package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.DBManager;
import dto.BoardDto;

public class BoardDaoImpl implements BoardDao{
	
	private static BoardDaoImpl instance = new BoardDaoImpl();
	private BoardDaoImpl () {}
	public static BoardDaoImpl getInstance() {
		return instance;
	}
	
	@Override
	public List<BoardDto> boardList(int limit, int offset) {
		List<BoardDto> list = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DBManager.getInstance().getConnection();
			//select
			StringBuilder sb = new StringBuilder();
	        sb.append("SELECT b.BOARD_ID, b.USER_SEQ, u.USER_NAME, b.TITLE, b.CONTENT, b.REG_DT, b.READ_COUNT ");
	        sb.append("  FROM BOARD b, USERS u");
	        sb.append(" WHERE b.USER_SEQ = u.USER_SEQ");            
	        sb.append(" ORDER BY b.BOARD_ID DESC");
	        sb.append(" LIMIT ? OFFSET ? ");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, limit);
			pstmt.setInt(2, offset);
			
			rs= pstmt.executeQuery();
			
			while( rs.next() ) {
				BoardDto boardDto = new BoardDto();
	            boardDto.setBoardId(rs.getInt("BOARD_ID"));
	            boardDto.setUserSeq(rs.getInt("USER_SEQ"));
	            boardDto.setUserName(rs.getString("USER_NAME"));
	            boardDto.setTitle(rs.getString("TITLE"));
	            boardDto.setContent(rs.getString("CONTENT"));
	            boardDto.setReadCount(rs.getInt("READ_COUNT"));
	            boardDto.setRegDt(rs.getTimestamp("REG_DT").toLocalDateTime()); // java 8 버전
	            
	            list.add(boardDto);
			}
			
		}catch( Exception e ) {
			e.printStackTrace();
		}finally {
			DBManager.releaseConnection(rs, pstmt, con);
		}
		
		
		return list;
	}

	@Override
	public int boardListTotalCnt() {
	    int totalCnt = -1;
	    
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    try{
	        con = DBManager.getInstance().getConnection();
	        pstmt = con.prepareStatement("SELECT COUNT(*) FROM BOARD");
	        rs = pstmt.executeQuery();

	        if(rs.next()) {
	            totalCnt = rs.getInt(1);
	        }
	    }catch (Exception e) {
	        e.printStackTrace();
	    }finally {
	        DBManager.releaseConnection(rs, pstmt, con);
	    }
	    
	    return totalCnt;
	}
	@Override
	public int boardInsert(BoardDto boardDto) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    
	    int ret = -1;
	    
	    try {
	        con = DBManager.getInstance().getConnection();
	        
	        StringBuilder sb = new StringBuilder();
	        sb.append("INSERT INTO BOARD ( USER_SEQ, TITLE, CONTENT, REG_DT, READ_COUNT ) ");
	        sb.append(" VALUES ( ?, ?, ?, now(), 0 ) ");

	        pstmt = con.prepareStatement(sb.toString());
	        pstmt.setInt(1,  boardDto.getUserSeq());
	        pstmt.setString(2,  boardDto.getTitle());
	        pstmt.setString(3,  boardDto.getContent());

	        ret = pstmt.executeUpdate();
	        
	    }catch(Exception e) {
	        e.printStackTrace();
	    }finally {
	        DBManager.releaseConnection(pstmt, con);
	    }
	    
	    return ret;
	}

	@Override
	public int boardUpdate(BoardDto boardDto) {
	    
	    Connection con = null;
	    PreparedStatement pstmt = null;

	    int ret = -1;
	    
	    try {
	        con = DBManager.getInstance().getConnection();
	        
	        StringBuilder sb = new StringBuilder();
	        sb.append("UPDATE BOARD SET TITLE = ?, CONTENT = ? ");
	        sb.append(" WHERE BOARD_ID = ? ");

	        pstmt = con.prepareStatement(sb.toString());
	        pstmt.setString(1,  boardDto.getTitle());
	        pstmt.setString(2,  boardDto.getContent());
	        pstmt.setInt(3,  boardDto.getBoardId());

	        ret = pstmt.executeUpdate();
	        
	    }catch(Exception e) {
	        e.printStackTrace();
	    }finally {
	        DBManager.releaseConnection(pstmt, con);
	    }
	    
	    return ret;
	}

	@Override
	public int boardDelete(int boardId) {
	    
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    
	    int ret = -1;
	    
	    try {
	        con = DBManager.getInstance().getConnection();
	        
	        StringBuilder sb = new StringBuilder();
	        sb.append("DELETE FROM BOARD ");
	        sb.append(" WHERE BOARD_ID = ? ");

	        pstmt = con.prepareStatement(sb.toString());
	        pstmt.setInt(1, boardId);

	        ret = pstmt.executeUpdate();
	        
	    }catch(Exception e) {
	        e.printStackTrace();
	    }finally {
	        DBManager.releaseConnection(pstmt, con);
	    }
	    
	    return ret;
	}
	
	@Override
	public BoardDto boardDetail(int boardId) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    BoardDto boardDto = null;
	    
	    try {
	        con = DBManager.getInstance().getConnection();
	        
	        StringBuilder sb = new StringBuilder();
	        sb.append("SELECT b.BOARD_ID, b.USER_SEQ, u.USER_NAME, ");
	        sb.append("       b.TITLE, b.CONTENT, b.REG_DT, b.READ_COUNT ");
	        sb.append("  FROM BOARD b, USERS u ");
	        sb.append(" WHERE b.BOARD_ID = ? ");
	        sb.append("   AND b.USER_SEQ = u.USER_SEQ ");

	        pstmt = con.prepareStatement(sb.toString());
	        pstmt.setInt(1,  boardId);

	        rs = pstmt.executeQuery();

	        if(rs.next()) {
	            boardDto = new BoardDto();
	            boardDto.setBoardId(rs.getInt("BOARD_ID"));
	            boardDto.setUserSeq(rs.getInt("USER_SEQ"));
	            boardDto.setUserName(rs.getString("USER_NAME"));
	            boardDto.setTitle(rs.getString("TITLE"));
	            boardDto.setContent(rs.getString("CONTENT"));
	            //boardDto.setRegDt(rs.getDate("REG_DT"));
	            //boardDto.setRegDt(rs.getDate("REG_DT").toLocalDate ());
	            boardDto.setRegDt(rs.getTimestamp("REG_DT").toLocalDateTime());
	            boardDto.setReadCount(rs.getInt("READ_COUNT"));
	        }
	        
	    }catch(Exception e) {
	        e.printStackTrace();
	    }finally {
	        DBManager.releaseConnection(rs, pstmt, con);
	    }
	    return boardDto;
	}

}
