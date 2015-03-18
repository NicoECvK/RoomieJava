package databaseInteractor;

public class House {
	
	public String houseName;
	public String houseType;
	public String location;
	public String tier;
	public String imageFileName;
	public String thumbFileName;
	public String address;
	public String roomTypes;
	public String houseStaffPositions;
	public int numResidents;
	public String text;
	
	House(String houseName, String houseType, String location, String tier, String imageFileName, String thumbFileName, String address, String roomTypes, String houseStaffPositions, int numResidents, String text) {
		this.houseName = houseName;
		this.houseType = houseType;
		this.location = location;
		this.tier = tier;
		this.imageFileName = imageFileName;
		this.thumbFileName = thumbFileName;
		this.address = address;
		this.roomTypes = roomTypes;
		this.houseStaffPositions = houseStaffPositions;
		this.numResidents = numResidents;
		this.text = text;
	}

}
