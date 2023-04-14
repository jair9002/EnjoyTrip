package dto;

import java.util.Date;

public class UserDto {
	private int userSeq; // long 형이 일반적
	private String userName;
	private String userPassword;
	private String userEmail;
	private Date userRegisterDate;
	private String favoritesAttraction; // JSON객체임 (JSON <-> String 변환 예정) 

	public int getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {

		return userPassword;
	}

	public void setUserPassword(String userPassword) {

		this.userPassword = userPassword;
	}

	public String getFavoritesAttraction() {
		return favoritesAttraction;
	}

	public void setFavoritesAttraction(String favoritesAttraction) {
		this.favoritesAttraction = userEmail;
	}

	public Date getUserRegisterDate() {
		return userRegisterDate;
	}

	public void setUserRegisterDate(Date userRegisterDate) {
		this.userRegisterDate = userRegisterDate;
	}
	
	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	

	@Override
	public String toString() {
		return "UserDto [userSeq=" + userSeq + ", userName=" + userName + ", userPassword=" + userPassword
				+ ", userEmail=" + userEmail + ", userProfileImageUrl=" + ", userRegisterDate=" + userRegisterDate
				+ "]";
	}

	public UserDto() {
	}

	public UserDto(int userSeq, String userName, String userPassword, String userEmail, Date userRegisterDate) {
		super();
		this.userSeq = userSeq;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userEmail = userEmail;
		this.userRegisterDate = userRegisterDate;
	}

}
