package Model;

public class playListDTO {

	private String keys;
	private String id;
	private String pname;
	
	public playListDTO( String keys,String id, String pname) {
		super();
		this.keys = keys;
		this.id = id;
		this.pname = pname;
	}
	
	public playListDTO(String pname) {
		this.pname = pname;
	}

	public String getKeys() {
		return keys;
	}

	public void setKeys(String keys) {
		this.keys = keys;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}
	
}