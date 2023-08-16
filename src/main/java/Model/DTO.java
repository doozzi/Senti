package Model;

public class DTO {

	private String id;
	private String pw;
	private String nick;
	private String gender;
	private String high;
	private String low;
	private String imgpath;
	
	public DTO(String id, String pw, String nick, String gender, String high, String low, String imgpath) {
		super();
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.gender = gender;
		this.high = high;
		this.low = low;
		this.imgpath = imgpath;
	}
	
	public DTO(String nick, String high, String low) {
		super();
		this.nick = nick;
		this.high = high;
		this.low = low;
	}

	public DTO(String id, String pw, String nick, String gender) {
		super();
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.gender = gender;
	}

	public DTO(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getHigh() {
		return high;
	}
	public void setHigh(String high) {
		this.high = high;
	}
	public String getLow() {
		return low;
	}
	public void setLow(String low) {
		this.low = low;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	
}
