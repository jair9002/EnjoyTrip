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

		// 여기서, userDto의 패스워드를 암호화할 예정임

		String originalInputPassword = userDto.getUserPassword();
		String convertHashPassword = hashPassword(originalInputPassword);

		userDto.setUserPassword(convertHashPassword);

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

	public int userDelete(String userPwd, String userEmail, int userSeq) {

		return userDao.userDelete(userPwd, userEmail, userSeq);

	}

	public String hashPassword(String password) {

		int hash = 0;
		for (int i = 0; i < password.length(); i++) {
			char c = password.charAt(i);
			hash = (hash * 31 + c) ^ (c * i);
		}
		return Integer.toString(hash);
	}

	@Override
	public int userAddAttraction(UserDto userDto) {
		
		UserDto tmpUserDto =  userDao.userDetail(userDto.getUserEmail());
		System.out.println(tmpUserDto.toString());
		
		String favoritesAttraction = tmpUserDto.getFavoritesAttraction();
		StringBuilder sb = new StringBuilder();
		sb.append(favoritesAttraction).append(" ").append(userDto.getFavoritesAttraction());

		userDto.setFavoritesAttraction(sb.toString());
		return userDao.userAddAttraction(userDto);

	}

}
