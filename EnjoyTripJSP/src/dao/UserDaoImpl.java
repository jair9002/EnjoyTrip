package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import common.DBManager;
import dto.UserDto;

public class UserDaoImpl implements UserDao{

	private static UserDaoImpl instance = new UserDaoImpl();
	
	private UserDaoImpl() {}
	
	public static UserDaoImpl getInstance() {
		return instance;
	}
	
	@Override
	public int UserRegister(UserDto userDto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		int ret = -1;
		try {
			con = DBManager.getConnection();
			//insert
			StringBuilder sb = new StringBuilder();
			sb.append(" insert into users ")
				.append(" (user_name, user_password, user_email, user_register_date ) ")
				.append(" values( ?, ?, ?, now()) ");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1,  userDto.getUserName());
			pstmt.setString(2,  userDto.getUserPassword());
			pstmt.setString(3,  userDto.getUserEmail());
			
			ret = pstmt.executeUpdate();
			
		}catch( Exception e ) {
			e.printStackTrace();
		}finally {
			DBManager.releaseConnection(pstmt, con);
		}
		
		return ret;
	}

}
