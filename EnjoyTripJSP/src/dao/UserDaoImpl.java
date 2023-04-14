package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.mysql.cj.xdevapi.JsonArray;

import common.DBManager;
import dto.UserDto;

public class UserDaoImpl implements UserDao {

	private static UserDaoImpl instance = new UserDaoImpl();
	private DBManager dbManaber = DBManager.getInstance();

	private UserDaoImpl() {
	}

	public static UserDaoImpl getInstance() {
		return instance;
	}

	@Override
	public int userRegister(UserDto userDto) {
		Connection con = null;
		PreparedStatement pstmt = null;

		int ret = -1;
		try {
			con = dbManaber.getConnection();
			// insert
			StringBuilder sb = new StringBuilder();
			sb.append(" insert into users ").append(" (user_name, user_password, user_email, user_register_date ) ")
					.append(" values( ?, ?, ?, now()) ");

			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, userDto.getUserName());
			pstmt.setString(2, userDto.getUserPassword());
			pstmt.setString(3, userDto.getUserEmail());

			ret = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.releaseConnection(pstmt, con);
		}

		return ret;
	}

	@Override
	public int userUpdate(UserDto userDto) {
		Connection con = null;
		PreparedStatement pstmt = null;

		// 비밀번호만 변경가능하도록, 동시에 update_date를 갱신시킴
		int ret = -1;

		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE users").append(" SET user_password = ?, user_register_date = now()")
				.append(" WHERE user_email = ? ");

		try {
			con = dbManaber.getConnection();
			pstmt = con.prepareStatement(sb.toString());

			pstmt.setString(1, userDto.getUserPassword());
			pstmt.setString(2, userDto.getUserEmail());

			System.out.print(pstmt.toString());

			ret = pstmt.executeUpdate();

			return ret; // 정상수행시, 1을 리턴해야함
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.releaseConnection(pstmt, con);
		}

		return 0;
	}

	@Override
	public UserDto userDetail(String userEmail) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT * from users").append(" WHERE user_email = ?");
		int ret = -1;
		try {
			con = dbManaber.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, userEmail);

			if (rs.next()) {
				UserDto user = new UserDto();
				user.setUserSeq(rs.getInt("user_seq"));
				user.setUserName(rs.getString("user_name"));
				user.setUserEmail(rs.getString("user_email"));
				user.setUserPassword(rs.getString("user_password"));
				user.setUserRegisterDate(rs.getDate("user_register_date"));
				user.setFavoritesAttraction(rs.getString("favorites_attraction"));

				return user;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.releaseConnection(pstmt, con, rs);
		}

		return null;
	}

	@Override
	public int userDelete(String userPwd, String userEmail, int userSeq) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		PreparedStatement pstmt2 = null;
		StringBuilder sb2 = new StringBuilder();

		sb.append("SELECT * from users").append(" WHERE user_email = ?");
		sb2.append("SELECT MAX(user_seq) FROM users");

		int ret = -1;
		try {
			con = dbManaber.getConnection();
			con.setAutoCommit(false);

			// 1. ID가 입력된 데이터를 삭제
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();
			UserDto user = new UserDto();

			if (rs.next()) {

				user.setUserSeq(rs.getInt("user_seq"));
				user.setUserName(rs.getString("user_name"));
				user.setUserEmail(rs.getString("user_email"));
				user.setUserPassword(rs.getString("user_password"));
				user.setUserRegisterDate(rs.getDate("user_register_date"));

			}

			// 2. 해당 ID가 마지막 번호였다면 AUTO_INCREMENT 값을 삭제된 데이터 인덱스로 지정
			pstmt2 = con.prepareStatement(sb2.toString());
			rs = pstmt2.executeQuery();
			if (rs.next()) {
				int maxUserSeq = rs.getInt(1);
				if (userSeq > maxUserSeq) {
					PreparedStatement pstmt3 = null;
					StringBuilder sb3 = new StringBuilder();
					sb3.append("ALTER TABLE users AUTO_INCREMENT = ? ");
					pstmt3 = con.prepareStatement(sb3.toString());
					pstmt3.setInt(1, userSeq);
					pstmt3.executeUpdate();
					pstmt3.close();
				}
			}

			if (user != null) {
				String actualPassword = user.getUserPassword();
				String hashedInputPassword = hashPassword(userPwd);

				System.out.println(actualPassword);
				System.out.println(hashedInputPassword);

				boolean isSamePassword = hashedInputPassword.equals(actualPassword);

				if (isSamePassword) {

					user.setUserPassword(null);
					ret = 1;
				}
			}

			con.commit();

		} catch (Exception e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			DBManager.releaseConnection(pstmt, con);
		}

		return ret;

	}

	public String hashPassword(String password) {

		int hash = 0;
		for (int i = 0; i < password.length(); i++) {
			char c = password.charAt(i);
			hash = (hash * 31 + c) ^ (c * i);
		}
		return Integer.toString(hash);
	}

	// user한테 JSON객체 형식으로 즐겨찾기 정보를 업데이트 해나가기

	@Override
	public int userAddAttraction(UserDto userDto) {

		Connection con = null;
		PreparedStatement pstmt = null;
		
		// 비밀번호만 변경가능하도록, 동시에 update_date를 갱신시킴
		int ret = -1;

		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE users").append(" SET favorites_attractions = ?").append(" WHERE user_email = ? ");

		try {
			con = dbManaber.getConnection();
			pstmt = con.prepareStatement(sb.toString());

			pstmt.setString(1, userDto.getUserEmail());
			pstmt.setString(2, userDto.getFavoritesAttraction());

			System.out.print(pstmt.toString());

			ret = pstmt.executeUpdate();

			return ret; // 정상수행시, 1을 리턴해야함
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.releaseConnection(pstmt, con);
		}

		return 0;

	}



}