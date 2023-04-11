package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBManager {
	// jdbc 吏곸젒 Connection 媛앹껜X
		// Connection Pool
	
	private static DBManager instance = new DBManager();
	
	public static DBManager getInstance() {
		return instance;
	}
	
	private DBManager(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}
		
	public Connection getConnection() throws SQLException {
		String url = "jdbc:mysql://127.0.0.1:3306/enjoytrip?serverTimezone=UTC&useUniCode=yes&characterEncoding=UTF-8";
		//String url = "jdbc:mysql://127.0.0.1:3306/board?serverTimezone=UTC&useUniCode=yes&characterEncoding=UTF-8";
		String user = "root";
		String pwd = "1234";
		return DriverManager.getConnection(url, user, pwd);
	}
		public static void releaseConnection(PreparedStatement pstmt, Connection con) {
		    try {
		        if( pstmt != null ) pstmt.close();
		        if( con != null ) con.close(); // overriding �릺�뼱 �엳�뼱�꽌 媛앹껜瑜� 醫낅즺�븯吏� �븡怨�, 諛섎궔!
		    }catch(SQLException e) {
		        e.printStackTrace();
		    }
		}

		public static void releaseConnection(ResultSet rs, PreparedStatement pstmt, Connection con) {
		    try {
		        if( rs != null ) rs.close();
		        if( pstmt != null ) pstmt.close();
		        if( con != null ) con.close();
		    }catch(SQLException e) {
		        e.printStackTrace();
		    }
		}

		public static void releaseConnection(AutoCloseable... params) {
		    for (AutoCloseable ac : params) {
		        if( ac != null ) {
		            try {
		                ac.close();
		            }catch(Exception e) {
		                e.printStackTrace();
		            }
		        }
		    }
		}
}
