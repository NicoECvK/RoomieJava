package databaseInteractor;

public class House {
	
	public String houseName;
	public String houseType;
	public String location;
	public String tier;
	public String imageFileName;
	public String text;
	
	House(String houseName, String houseType, String location, String tier, String imageFileName, String text) {
		this.houseName = houseName;
		this.houseType = houseType;
		this.location = location;
		this.tier = tier;
		this.imageFileName = imageFileName;
		this.text = text;
	}

}
