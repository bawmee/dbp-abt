package model;

import java.util.*;


public class Post {
	private int post_id;
	private String consumer_id;
	private String title;
	private String content;
	private String post_file;
	private String file_link;
	private int down_count;
	private String upload_date;
	private String usage;
	private List<String> color = new ArrayList<String>();
	private String thumnail;

	public Post(int post_id) {
		this.post_id = post_id;
	}
	
	public Post(String consumer_id, String title, String content, String file_link, String usage) {
		this.consumer_id = consumer_id;
		this.title = title;
		this.content = content;
		this.file_link = file_link;
		this.usage = usage;
	}
	
	public Post(int post_id, String title, String usage, String color1, String color2) {
		this.post_id = post_id;
		this.title = title;
		this.usage = usage;
		color.add(color1);
		color.add(color2);
	}
	
	public Post(String consumer_id, String title, String content, String file_link, String post_file, String usage, String thumnail, List<String> color) {
		this.consumer_id = consumer_id;
		this.title = title;
		this.content = content;
		this.file_link = file_link;
		this.post_file = post_file;
		this.usage = usage;
		this.thumnail = thumnail;
		this.color = color;
	}

	public Post(int post_id, String consumer_id, String title, String content, String post_file, String file_link,
			int down_count, String upload_date, String usage, String thumnail, String color1, String color2) {
		this.post_id = post_id;
		this.consumer_id = consumer_id;
		this.title = title;
		this.content = content;
		this.post_file = post_file;
		this.file_link = file_link;
		this.down_count = down_count;
		this.upload_date = upload_date;
		this.usage = usage;
		this.thumnail = thumnail;
		color.add(color1);
		color.add(color2);
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public String getConsumer_id() {
		return consumer_id;
	}

	public void setConsumer_id(String consumer_id) {
		this.consumer_id = consumer_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPost_file() {
		return post_file;
	}

	public void setPost_file(String post_file) {
		this.post_file = post_file;
	}

	public String getFile_link() {
		return file_link;
	}

	public void setFile_link(String file_link) {
		this.file_link = file_link;
	}

	public int getDown_count() {
		return down_count;
	}

	public void setDown_count(int down_count) {
		this.down_count = down_count;
	}

	public String getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}

	public String getUsage() {
		return usage;
	}

	public void setUsage(String usage) {
		this.usage = usage;
	}

	public List<String> getColor() {
		return color;
	}
	
	public String getColor1() {
		return color.get(0);
	}
	
	public String getColor2() {
		return color.get(1);
	}

	public void setColor(List<String> color) {
		this.color = color;
	}
	
	public String toString() {
		return String.valueOf(getPost_id());
	}

	public String getThumnail() {
		return thumnail;
	}

	public void setThumnail(String thumnail) {
		this.thumnail = thumnail;
	}
	
	
}