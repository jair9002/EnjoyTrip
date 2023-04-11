package service;

import dao.UserDao;
import dao.UserDaoImpl;
import dto.UserDto;

public class UserServiceImpl implements UserService {
	private static UserServiceImpl instance = new UserServiceImpl();

	private UserServiceImpl() {
	}

	private UserDao userDao = UserDaoImpl.getInstance();

	public static UserServiceImpl getInstance() {
		return instance;
	}

	@Override
	public int userRegister(UserDto userDto) {
		// TODO Auto-generated method stub
		return userDao.userRegister(userDto);
	}

	@Override
	public int userUpdate(UserDto userDto) {
		// TODO Auto-generated method stub
		return userDao.userUpdate(userDto);
	}

	@Override
	public UserDto userDetail(String userId) {
		// TODO Auto-generated method stub
		return userDao.userDetail(userId);
	}

	@Override
	public int userDelete(String userId) {
		// TODO Auto-generated method stub
		return userDao.userDelete(userId);
	}

}
