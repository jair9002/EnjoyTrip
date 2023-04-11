package service;

import dto.UserDto;

public interface LoginService {
	 UserDto login(String userEmail, String userPasword);
}
