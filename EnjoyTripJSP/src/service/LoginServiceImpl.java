package service;

import dao.LoginDao;
import dao.LoginDaoImpl;
import dto.UserDto;

public class LoginServiceImpl implements LoginService {
	
	private static LoginServiceImpl instance = new LoginServiceImpl();
	
	private LoginServiceImpl() {}
	
	public static LoginServiceImpl getInstance() {
		return instance;
	}
	
	LoginDao loginDao = LoginDaoImpl.getInstance();
	
	@Override
	public UserDto login(String userEmail, String userPassword) {
		UserDto userDto = loginDao.login(userEmail);
		
		

		if (userDto != null && userDto.getUserPassword().equals(userPassword)) {

			userDto.setUserPassword(null);
			return userDto;	
		}
		return null;
	}

}
