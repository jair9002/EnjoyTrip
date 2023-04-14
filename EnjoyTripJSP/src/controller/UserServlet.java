package controller;

import java.io.IOException;

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

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/user")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserService service = UserServiceImpl.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		process(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		process(request, response);
	}
	
	protected void process (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String contextPath = request.getContextPath();
		request.setCharacterEncoding("UTF-8");
		
		// request: {contextPath}/user?action=delete
		// request: {contextPath}/user?action=update
		// request: {contextPath}/user?action=detail
		String action = request.getParameter("action");
		
		switch(action) {
		case "delete" :
			// ?action=delete&userEmail=c@nav.com
			delete(request, response);
			break;
		case "update" :
			// ?action=update&userEmail=c@nav.com&userPassword=5432
			update(request, response);
			break;
		case "detail" :
			// ?action=detail&userEmail=c@nav.com
			detail(request, response);
			break;
		}
	}
	
	
	protected void detail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String contextPath = request.getContextPath();
		String userEmail = request.getParameter("userEmail");
		
		System.out.print("userEmail: " + userEmail);
		
		UserDto user = service.userDetail(userEmail);
		System.out.println(user);
		request.setAttribute("user", user);
		
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		String jsonStr = null;
		
		if ( user != null) {
			jsonObject.addProperty("result", "success");
			jsonObject.addProperty("userEmail", user.getUserEmail());
			jsonObject.addProperty("userName", user.getUserName());
			jsonObject.addProperty("userRegistDate", user.getUserRegisterDate().toString());
			jsonObject.addProperty("userSeq", user.getUserSeq());
			
			jsonStr = gson.toJson(jsonObject);
		}else {
			jsonObject.addProperty("result", "fail");
			jsonStr = gson.toJson(jsonObject);
		}
		response.getWriter().write(jsonStr);
		
	}
	
	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String contextPath = request.getContextPath();

		String userPwd = request.getParameter("userPwd");
		String userEmail = request.getParameter("userEmail");

		
		
		UserDto user = service.userDetail(userEmail);
		int userSeq = user.getUserSeq();
		
		int ret = service.userDelete(userPwd, userEmail,userSeq);
		if (ret == 1) {
			System.out.println("delete 성공");
			request.setAttribute("result", "success");
		} else {
			System.out.println("delete 실패");
			request.setAttribute("result", "fail");
		}

//		response.sendRedirect(contextPath + "/user/registMobile.jsp");
	}
	
	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String contextPath = request.getContextPath();

		String userEmail = request.getParameter("userEmail");
		String password = request.getParameter("userPassword");
		
		UserDto user = new UserDto();
		user.setUserEmail(userEmail);
		user.setUserPassword(password);

		int ret = service.userUpdate(user);

		if (ret >= 1) {
			System.out.println("update 성공");
			request.setAttribute("result", "success");
		} else {
			System.out.println("update 실패");
			request.setAttribute("result", "fail");
		}

//		response.sendRedirect(contextPath + "/user/registMobile.jsp");
	}
	
	

	
}
