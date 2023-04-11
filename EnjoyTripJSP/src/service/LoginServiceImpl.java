package service;

import dao.LoginDao;
import dao.LoginDaoImpl;
import dto.UserDto;

public class LoginServiceImpl implements LoginService {

	private static LoginServiceImpl instance = new LoginServiceImpl();

	private LoginServiceImpl() {
	}

	public static LoginServiceImpl getInstance() {
		return instance;
	}

	LoginDao loginDao = LoginDaoImpl.getInstance();

	@Override
	public UserDto login(String userEmail, String userPassword) {
		UserDto userDto = loginDao.login(userEmail);

		String actualPassword = userDto.getUserPassword();
		String hashedInputPassword = hashPassword(userPassword);


		System.out.println(actualPassword);
		System.out.println(hashedInputPassword);

		boolean isSamePassword = hashedInputPassword.equals(actualPassword);
		
		if (userDto != null && isSamePassword) {

			userDto.setUserPassword(null);
			return userDto;
		}
		return null;
	}
	
	public String hashPassword(String password) {

		int hash = 0;
		for (int i = 0; i < password.length(); i++) {
			char c = password.charAt(i);
			hash = (hash * 31 + c) ^ (c * i);
		}
		return Integer.toString(hash);
	}

}
