package dao;

import dto.UserDto;

public interface LoginDao {
	
	UserDto login(String email); 
}
