package common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.UserDto;

@WebFilter("/*")
public class LoginFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		
		String contextPath = httpServletRequest.getContextPath();
		String path = httpServletRequest.getRequestURI();
		
		System.out.println("BoardWebAjaxJson - doFilter path : " + path ); 
		
		HttpSession session = httpServletRequest.getSession();
		
		// 현재 요청한 path가 login이 필요한 부분일 때와 그렇지 않을 때를 구분 처리
		
		// exclude 
	    if( 
                ! path.contains("/img/") 
	            && ! path.contains("/css/") 
	            && ! path.contains("/js/") 
	            && ! path.contains("/register") 
	            && ! path.contains("/isEmailUnique") 
	            && ! path.contains("/login") 
	            && ! path.contains("/join") 
	    ) {
	        UserDto userDto = (UserDto) session.getAttribute("userDto");
	
	        if(userDto == null) { // 로그아웃 된 상태( session timeout )
	            httpServletResponse.sendRedirect(contextPath + "/pages/login.jsp");
	            return;
	        }
	    }
	
	    chain.doFilter(request, response); // 이걸 호출해야 간다..
		
	}
	
}
