package kr.ac.kopo.member.vo;

public class MemberVO {
	private String userId;
	private String password;
	private String username;
	private String email;

	public MemberVO() {
	}

	public MemberVO(String userId, String password) {
		super();
		this.userId = userId;
		this.password = password;
	}

	public MemberVO(String userId, String username, String email) {
		super();
		this.userId = userId;
		this.username = username;
		this.email = email;
	}

	public MemberVO(String userId, String password, String username, String email) {
		super();
		this.userId = userId;
		this.password = password;
		this.username = username;
		this.email = email;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", password=" + password + ", username=" + username + ", email=" + email
				+ "]";
	}

}
