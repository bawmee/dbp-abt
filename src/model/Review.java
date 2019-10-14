package model;

public class Review extends Post{
	private int review_id;
	private String consumer_id;
	private String review_content;
	
	public Review(int post_id, String consumer_id, String review_content) {
		super(post_id);
		this.consumer_id = consumer_id;
		this.review_content = review_content;
	}
	
	public Review(int post_id, int review_id, String consumer_id, String review_content) {
		super(post_id);
		this.review_id = review_id;
		this.consumer_id = consumer_id;
		this.review_content = review_content;
	}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public String getConsumer_id() {
		return consumer_id;
	}

	public void setConsumer_id(String consumer_id) {
		this.consumer_id = consumer_id;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	
}
