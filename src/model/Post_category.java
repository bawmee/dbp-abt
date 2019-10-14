package model;

public class Post_category extends Post {
	private String usage;
	private String style;
	
	public Post_category(int post_id, String usage, String style) {
		super(post_id);
		this.usage = usage;
		this.style = style;
	}
	
}
