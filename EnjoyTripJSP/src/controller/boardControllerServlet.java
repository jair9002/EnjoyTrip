package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.UserDto;

@WebServlet("/board/*")
public class boardControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	// GET, POST, PUT, DELETE 모두 처리
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 선처리
		// encoding
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html charset=utf-8");
		
		// sub url 처리 
		String contextPath = request.getContextPath();
		System.out.println("contextPath : " + contextPath);
		String path = request.getRequestURI().substring(contextPath.length());
		System.out.println("path : " + path);
		
		switch( path ) {
			case "/board/list" : list(request, response); break;	
			case "/board/detail" : detail(request, response); break;	
			case "/board/detail/update" : update(request, response); break;	
			case "/board/detail/delete" : delete(request, response); break;	
		}
	}

	
	protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Parameter, Business Logic 처리 후
		
		//JSP forwarding
		System.out.println("목록보기");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/board.jsp");
		dispatcher.forward(request, response);
	}

	protected void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("게시글 상세 보기");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/board.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("게시글 수정 하기");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/board.jsp");
		dispatcher.forward(request, response);
	}
		

	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("게시글 삭제 하기");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/board.jsp");
		dispatcher.forward(request, response);
	}
		
		
}
