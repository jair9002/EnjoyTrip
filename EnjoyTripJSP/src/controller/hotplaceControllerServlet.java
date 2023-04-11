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


@WebServlet("/hotplace/*")
public class hotplaceControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		process(request, response);
		

	}
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
		    // 상세보기없음 
			case "/hotplace/list" : 
				System.out.println("모든리스트 조회 작동");
				list(request, response); break;	
		}	
	}
	
	

	protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 전체보기 , 임시로 hotPlace으로 동일하게 설정 
		
		//JSP forwarding
		List<Object> list = new ArrayList<>();
		//request.setAttribute("list", list); // list는 임시 데이터
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/hotPlace.jsp");
		dispatcher.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("생성하기 작동");
		// 생성하기 , 임시로 hotPlace으로 동일하게 설정 
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/hotPlace.jsp");
		dispatcher.forward(request, response);
	}



	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("삭제하기 작동");
		// 삭제하기 , 임시로 hotPlace으로 동일하게 설정 
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/hotPlace.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("수정하기 작동");
		// 수정하기 , 임시로 hotPlace으로 동일하게 설정 
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/hotPlace.jsp");
		dispatcher.forward(request, response);
	}

}
