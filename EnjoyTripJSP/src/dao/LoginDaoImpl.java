package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.DBManager;
import dto.UserDto;


// Singleton Design Pattern
public class LoginDaoImpl implements LoginDao{
	
	private static LoginDaoImpl instance = new LoginDaoImpl();
	private DBManager dbManaber = DBManager.getInstance();
	

	private LoginDaoImpl() {
		
	}
	
	public static LoginDaoImpl getInstance() {
		return instance;
	}
	
	
	@Override
	public UserDto login(String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		UserDto userDto = null;
		
		try {
			con = dbManaber.getConnection();
			// insert
			
			StringBuilder sb = new StringBuilder();

			sb.append("select user_seq, user_name, user_password, user_email, user_register_date")
				.append(" from users where user_email=?");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, email);

			// ret = 0 ����, ret = 1 ����
			rs = pstmt.executeQuery();
			
		    if (rs.next()) {
		    	userDto = new UserDto();
		    	userDto.setUserSeq(rs.getInt("user_seq"));
		    	userDto.setUserName(rs.getString("user_name"));
		    	userDto.setUserPassword(rs.getString("user_password"));
		    	userDto.setUserEmail(rs.getString("user_email"));
		    	//userDto.setUserProfileImageUrl(rs.getString("user_profile_image_url"));
		    	userDto.setUserRegisterDate(rs.getDate("user_register_date"));
		    }
		    
		    
		}catch(Exception e){
			e.printStackTrace();
			
		}finally {
			DBManager.releaseConnection(pstmt, con);
		}
		return userDto;
	}



}
