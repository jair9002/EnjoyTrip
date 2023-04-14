package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dto.BoardDto;
import dto.UserDto;
import service.BoardService;
import service.BoardServiceImpl;

@WebServlet("/board/*")
public class boardControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	BoardService boardService = BoardServiceImpl.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);//
	}
	
	// GET, POST, PUT, DELETE 모두 처리
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 선처리
		// encoding
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html charset=utf-8");
		
		// sub url 처리 
		String contextPath = request.getContextPath();
		String path = request.getRequestURI().substring(contextPath.length());
		
		switch( path ) {
			case "/board/boardList" 		 : boardList(request, response); break;   
			case "/board/boardListTotalCnt" : boardListTotalCnt( request, response); break;    
			case "/board/boardInsert"        : boardInsert(request, response); break;
	        case "/board/boardDetail"        : boardDetail(request, response); break;
	        case "/board/boardUpdate"        : boardUpdate(request, response); break;
	        case "/board/boardDelete"        : boardDelete(request, response); break;
		}
	}

	

	protected void boardList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// parameter
		

        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");
		
		String strLimit = request.getParameter("limit");
		String strOffset = request.getParameter("offset");
		String searchWord = request.getParameter("searchWord");
		
		int limit = Integer.parseInt(strLimit);
		int offset = Integer.parseInt(strOffset);
		// service - dao
		List<BoardDto> boardList = boardService.boardList(limit, offset);
		System.out.print("설정적용");

		// 검색에 여부에 따라서
	    if( "".equals(searchWord) ) { 
	        boardList = boardService.boardList(limit, offset);
	    }else {
	        // boardList = boardService.boardListSearchWord(limit, offset, searchWord);
	    }
		
		// result 
		Gson gson = new Gson();
		String jsonStr = gson.toJson(boardList);
		
		System.out.println(jsonStr);
		response.getWriter().write(jsonStr);
	}
	
	private void boardListTotalCnt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	    
	    String searchWord = request.getParameter("searchWord");
	    
	    int totalCnt = 0;
	    
	    // 검색에 여부에 따라...
	    if( "".equals(searchWord) ) {
	        totalCnt = boardService.boardListTotalCnt();
	    }else {
	        // totalCnt = boardService.boardListSearchWordTotalCnt(searchWord);
	    }
	    
	    //response.setContentType("text/html; charset=utf-8");
	    Gson gson = new Gson();
	    
	    JsonObject jsonObject = new JsonObject();
	    jsonObject.addProperty("totalCnt", totalCnt);
	    
	    String jsonStr = gson.toJson(jsonObject);
	    
	    response.getWriter().write(jsonStr);
	    System.out.println("BoardServlet boardListTotalCnt totalCnt : " + totalCnt);
	}
	
	
	private void boardInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	    
	    BoardDto boardDto = new BoardDto();
	    // LoginFilter 먼저 적용 필요!! 
	    HttpSession session = request.getSession();
	    UserDto userDto = (UserDto) session.getAttribute("userDto");
	    
	    boardDto.setUserSeq(userDto.getUserSeq());
	    boardDto.setTitle(request.getParameter("title"));
	    boardDto.setContent(request.getParameter("content"));
	    
	    int ret = boardService.boardInsert(boardDto);
	    
	    // if cnt != 1 Exception ...
	    Gson gson = new Gson();
	    JsonObject jsonObject = new JsonObject();
	    
	    if (ret == 1) {
	        jsonObject.addProperty("result", "success");
	    } else {
	        jsonObject.addProperty("result", "fail");
	    }
	    
	    String jsonStr = gson.toJson(jsonObject);
	    response.getWriter().write(jsonStr);
	}

	private void boardDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");
        
        
	    HttpSession session = request.getSession();
	    UserDto userDto = (UserDto) session.getAttribute("userDto");        
	    int userSeq = userDto.getUserSeq();
	    
	    String strBoardId = request.getParameter("boardId");
	    int boardId = Integer.parseInt(strBoardId);
	    BoardDto boardDto = boardService.boardDetail(boardId, userSeq);

	    Gson gson = new Gson();

	    String jsonStr = gson.toJson(boardDto);
	    response.getWriter().write(jsonStr);
	}

	private void boardUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	    
	    BoardDto boardDto = new BoardDto();
	    
	    String strBoardId = request.getParameter("boardId");
	    int boardId = Integer.parseInt(strBoardId);
	    
	    boardDto.setBoardId(boardId);
	    boardDto.setTitle(request.getParameter("title"));
	    boardDto.setContent(request.getParameter("content"));
	    
	    int ret = boardService.boardUpdate(boardDto);

	    Gson gson = new Gson();
	    JsonObject jsonObject = new JsonObject();
	    
	    if (ret == 1) {
	        jsonObject.addProperty("result", "success");
	    } else {
	        jsonObject.addProperty("result", "fail");
	    }
	    
	    String jsonStr = gson.toJson(jsonObject);
	    response.getWriter().write(jsonStr);
	}

	private void boardDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	    
	    String strBoardId = request.getParameter("boardId");
	    // if strBoardId == null or "" Exception ...
	    int boardId = Integer.parseInt(strBoardId);
	    int ret = boardService.boardDelete(boardId);

	    Gson gson = new Gson();
	    JsonObject jsonObject = new JsonObject();
	    
	    if (ret == 1) {
	        jsonObject.addProperty("result", "success");
	    } else {
	        jsonObject.addProperty("result", "fail");
	    }
	    
	    String jsonStr = gson.toJson(jsonObject);
	    response.getWriter().write(jsonStr);
	}
	
	
		
}
