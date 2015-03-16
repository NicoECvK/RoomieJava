package databaseInteractor;

import java.sql.Time;

public class Comment {
	
	public String username;
	public String houseName;
	public String text;
	public Time creationTime;
	
	Comment(String username, String houseName, String text) {
		this.username = username;
		this.houseName = houseName;
		this.text = text;
	}
	
}
