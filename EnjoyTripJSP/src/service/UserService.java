package service;

import dto.UserDto;

public interface UserService {
	// 회원가입 (from join.jsp)
	int userRegister(UserDto userDto);
	
	// 수정, 조회, 탈퇴 ( from newPage(아마 myPage?) )
	int userUpdate(UserDto userDto);
	UserDto userDetail(String userId); 
	int userDelete(String userPwd, String userEmail, int userSeq);
	
	// 비번찾기, 로그인 -> 여기서 하지 말고 LoginService, LoginDao로 옮기자
//	String findPassword(String userId);
//	String userLogin(UserDto userDto);
	
	//로그아웃 -> Servlet내에서 session.invalidate()
}

