package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dto.UserDto;
import service.UserService;
import service.UserServiceImpl;

@WebServlet("/member/*")
public class memberControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserService userService = UserServiceImpl.getInstance();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		String path = request.getRequestURI().substring(contextPath.length());
		
		switch( path ) {
			case "/member/register" : register(request, response); break;	
			case "/member/login" : login(request, response); break;	
			case "/member/update" : update(request, response); break;	
			case "/member/delete" : delete(request, response); break;	
		}
	}
	
	protected void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사용자로부터 입력 parameter 처리
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String userPassword = request.getParameter("userPassword");
		
		// Business Logic 처리후
		UserDto userDto = new UserDto();
		userDto.setUserName(userName);
		userDto.setUserPassword(userPassword);
		userDto.setUserEmail(userEmail);

		// service - dao
		int ret = userService.userRegister(userDto);

		// result 
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		
		if( ret == 1 ) {
			jsonObject.addProperty("result", "success");
		}else {
			jsonObject.addProperty("result", "fail");
		}
		
		String jsonStr = gson.toJson(jsonObject); // json 문자열
		response.getWriter().write(jsonStr);
	}

	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("로그인 하기");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/index.jsp");
		dispatcher.forward(request, response);
		
	}
	
	protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("정보 수정 하기");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/myPage.jsp");
		dispatcher.forward(request, response);
		
	}
	
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("탈퇴 하기");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/index.jsp");
		dispatcher.forward(request, response);
	}

	
		
		
}
