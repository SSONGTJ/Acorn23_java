package test.lunch.dto;

public class LunchDto {
	private int num;
	private String menu;
	private String loc;
	private String review;
	
	public LunchDto () {}
	
	public LunchDto (int num, String menu, String loc, String review) {
		this.num=num;
		this.menu=menu;
		this.loc=loc;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}
}
