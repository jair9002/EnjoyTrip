package service;

import dao.UserDao;
import dao.UserDaoImpl;
import dto.UserDto;

public class UserServiceImpl implements UserService{
	private static UserServiceImpl instance = new UserServiceImpl();
	
	private UserServiceImpl() {}
	
	public static UserServiceImpl getInstance() {
		return instance;
	}

	UserDao userDao = UserDaoImpl.getInstance();
	
	@Override
	public int userRegister(UserDto userDto) {
		return userDao.UserRegister(userDto);
	}
	
}
