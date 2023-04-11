package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dto.UserDto;
import service.LoginService;
import service.LoginServiceImpl;



@WebServlet({"/login", "/logout"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	LoginService loginService = LoginServiceImpl.getInstance();
	
	//
	//logout
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션 초기화
		HttpSession session = request.getSession();
		session.invalidate();
		
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		
		jsonObject.addProperty("result", "success");
		String jsonStr = gson.toJson(jsonObject); // json 문자열
		

		response.getWriter().write(jsonStr);
	}

	//login
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// encoding
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		String userEmail = request.getParameter("userEmail");
		String userPassword = request.getParameter("userPassword");
		UserDto userDto = loginService.login(userEmail, userPassword);

		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		String jsonStr = null;
		
		if ( userDto != null) {
			// 세션에 사용자 정보를 담아놔야 함!!
			HttpSession session = request.getSession();
			session.setAttribute("userDto",  userDto);
			
			jsonObject.addProperty("result", "success");
			jsonStr = gson.toJson(jsonObject);
		
		}else {
			jsonObject.addProperty("result", "fail");
			jsonStr = gson.toJson(jsonObject);
		}
		response.getWriter().write(jsonStr);
	}
}
