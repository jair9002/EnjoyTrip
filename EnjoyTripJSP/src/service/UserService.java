package service;

import dto.UserDto;

public interface UserService {
	int userRegister( UserDto userDto ); // public이 없어도 public임!
}
