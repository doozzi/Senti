package Model;

public class songrangeDTO {

	private String keys;
	private String high_range;
	private String low_range;
	private String frequent;
	
	public songrangeDTO(String keys, String high_range, String low_range, String frequent) {
		super();
		this.keys = keys;
		this.high_range = high_range;
		this.low_range = low_range;
		this.frequent = frequent;
	}
	
	public songrangeDTO(String low_range) {
		super();
		this.low_range = low_range;
	}
	
	public songrangeDTO(String high_range, String frequent) {
		super();
		this.high_range = high_range;
		this.frequent = frequent;
	}

	public String getKeys() {
		return keys;
	}

	public void setKeys(String keys) {
		this.keys = keys;
	}

	public String getHigh_range() {
		return high_range;
	}

	public void setHigh_range(String high_range) {
		this.high_range = high_range;
	}

	public String getLow_range() {
		return low_range;
	}

	public void setLow_range(String low_range) {
		this.low_range = low_range;
	}

	public String getFrequent() {
		return frequent;
	}

	public void setFrequent(String frequent) {
		this.frequent = frequent;
	}

}