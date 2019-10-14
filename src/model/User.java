package model;

public class User {

	private String user_id;
	private String nickname;
	private String password;
	private int total_point;
	private String interest1 = "";
	private String interest2 = "";
	private String interest3 = "";
	
	public User(String user_id, String nickname, String password, int total_point, String interest1) {
		super();
		this.user_id = user_id;
		this.nickname = nickname;
		this.password = password;
		this.total_point = 10;
		this.interest1 = interest1;
	}
	public User(String user_id, String nickname, String password, int total_point, String interest1, String interest2) {
		super();
		this.user_id = user_id;
		this.nickname = nickname;
		this.password = password;
		this.total_point = 10;
		this.interest1 = interest1;
		this.interest2 = interest2;
	}
	public User(String user_id, String nickname, String password, int total_point, String interest1, String interest2, String interest3) {
		super();
		this.user_id = user_id;
		this.nickname = nickname;
		this.password = password;
		this.total_point = total_point;
		this.interest1 = interest1;
		this.interest2 = interest2;
		this.interest3 = interest3;
	}
	
	public User(String user_id, String nickname, String password, String interest1) {
		super();
		this.user_id = user_id;
		this.nickname = nickname;
		this.password = password;
		this.interest1 = interest1;
	}
	public User(String user_id, String nickname, String password, String interest1, String interest2) {
		super();
		this.user_id = user_id;
		this.nickname = nickname;
		this.password = password;
		this.interest1 = interest1;
		this.interest2 = interest2;
	}
	public User(String user_id, String nickname, String password, String interest1, String interest2, String interest3) {
		super();
		this.user_id = user_id;
		this.nickname = nickname;
		this.password = password;
		this.interest1 = interest1;
		this.interest2 = interest2;
		this.interest3 = interest3;
	}
	
	public User(String user_id) {
		super();
		this.user_id = user_id;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getTotal_point() {
		return total_point;
	}
	public void setTotal_point(int total_point) {
		this.total_point = total_point;
	}
	public String getInterest1() {
		return interest1;
	}
	public void setInterest1(String interest1) {
		this.interest1 = interest1;
	}
	public String getInterest2() {
		return interest2;
	}
	public void setInterest2(String interest2) {
		this.interest2 = interest2;
	}
	public String getInterest3() {
		return interest3;
	}
	public void setInterest3(String interest3) {
		this.interest3 = interest3;
	}
	
	
	/* 비밀번호 검사 */
	public boolean matchPassword(String password) {
		if (password == null) {
			return false;
		}
		return this.password.equals(password);
	}
	
	public boolean isSameUser(String userid) {
        return this.user_id.equals(userid);
    }

}
