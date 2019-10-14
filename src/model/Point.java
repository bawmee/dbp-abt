package model;

public class Point extends User {
	private int point_id;
	private int post_id;
	private String use_or_get;
	
	public Point(String user_id, int point_id, int post_id) {	//use와 get 판별은 나중에 post_id의 user_id와 비교하여 getter로 넣어주자?
		super(user_id);
		this.point_id = point_id;
		this.post_id = post_id;
	}

	public int getPoint_id() {
		return point_id;
	}

	public void setPoint_id(int point_id) {
		this.point_id = point_id;
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public String getUse_or_get() {
		return use_or_get;
	}

	public void setUse_or_get(String use_or_get) {
		this.use_or_get = use_or_get;
	}
	
}
