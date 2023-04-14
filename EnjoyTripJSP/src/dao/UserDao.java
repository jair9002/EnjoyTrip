package dao;

import dto.UserDto;

public interface UserDao {
	
	// 회원가입 (from join.jsp)
	int userRegister(UserDto userDto);
	
	// 수정, 조회, 탈퇴 ( from newPage(아마 myPage?) )
	int userUpdate(UserDto userDto);
	UserDto userDetail(String userId); 
	int userDelete(String userPwd, String userEmail, int userSeq);
	
	// 비번찾기, 로그인
//	String findPassword(String userId);
//	String userLogin(UserDto userDto);
}
