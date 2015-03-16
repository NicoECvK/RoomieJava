package databaseInteractor;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;

import databaseConnection.DatabaseConnection;

public class DatabaseInteractor {
	
	
	DatabaseConnection dbConnection;

	public DatabaseInteractor() {
		dbConnection = new DatabaseConnection();
	}
	
	
	/**
	 * Queries the database for the House that has the supplied houseName.
	 * If houseName is "" returns all Houses.
	 * @param houseName that is being searched for.
	 * @return  The House that matches the houseName.
	 * @author NicoECvK
	 */
	public ArrayList<Comment> searchCommentByHouseName(String houseName) {		
		String query = "SELECT * FROM Comment WHERE houseName = ?";
		ArrayList<Object> resultArray = new ArrayList<Object>();
		resultArray = constructResultArray("comment", query, houseName);
		ArrayList<Comment> resultingComments = new ArrayList<Comment>();
		fromObjectALToOtherAL(resultArray, resultingComments);
		return resultingComments;
	}
	
	
	/**
	 * Inserts a tuple into the Comment relation.
	 * @param String to be inserted.
	 * @return Number of rows affected.
	 * @author NicoECvK
	 */
	public int insertComment(Comment comment) {
		String username = comment.username;
		String houseName = comment.houseName;
		String text = comment.text;

		String statement = "INSERT INTO Comment (username, houseName, comment) " +
				"VALUES (?, ?, ?)";
		try {
			return dbConnection.executeUpdate(statement, username, houseName, text);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	
	/**
	 * Deletes a tuple into the Comment relation.
	 * @param Comment to be deleted.
	 * @return Number of rows affected.
	 * @author NicoECvK
	 */
	public int deleteComment(Comment comment) {
		String username = comment.username;
		String houseName = comment.houseName;
		String text = comment.text;
		String statement = "DELETE FROM Comment WHERE username = ? AND houseName = ? AND comment = ?";
		try {
			return dbConnection.executeUpdate(statement, username, houseName, text);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	
	/**
	 * Queries the database for the House that has the supplied houseName.
	 * If houseName is "" returns all Houses.
	 * @param houseName that is being searched for.
	 * @return  The House that matches the houseName.
	 * @author NicoECvK
	 */
	public House searchHouseByName(String houseName) {		
		String query = "SELECT * FROM House WHERE houseName = ?";
		ArrayList<Object> resultArray = new ArrayList<Object>();
		resultArray = constructResultArray("house", query, houseName);
		ArrayList<House> resultingHouses = new ArrayList<House>();
		fromObjectALToOtherAL(resultArray, resultingHouses);
		if(resultingHouses.size() != 0) {
			return resultingHouses.get(0);
		} else {
			return null;
		}
	}
	
	
	/**
	 * Gets all Houses from the database.
	 * @return ArrayList of all houses.
	 */
	public ArrayList<House> getAllHouses() {
		String query = "SELECT * FROM House";
		ArrayList<Object> resultArray = new ArrayList<Object>();
		resultArray = constructResultArray("house", query);
		ArrayList<House> resultingHouses = new ArrayList<House>();
		fromObjectALToOtherAL(resultArray, resultingHouses);
		return resultingHouses;
	}
	
	
	/**
	 * Takes the query and executes it. 
	 * Depending on what the result type is, it passes ResultSet off to be parsed into the correct objects.
	 * @param queryType is the name of the relation that was queried.
	 * @param query to be executed.
	 * @param queryParameter is the String to replace the "?" in the query.
	 * @return ResultSet containing the query result.
	 * @author NicoECvK
	 */
	private ArrayList<Object> constructResultArray(String queryType, String query, String... queryParameters) {
		ResultSet rs;
		try {
			rs = dbConnection.executeQuery(query, queryParameters);
			ArrayList<Object> resultArray = null;
			
			// Queries the House relation and returns House objects.
			if (queryType.equals("house")) {
				resultArray = parseHouseArray(rs);
			}
			
			// Queries the Comment relation and returns Comment objects.
			if (queryType.equals("comment")) {
				resultArray = parseCommentArray(rs);
			}
			

			return resultArray;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * Copies the contents of an ArrayList<Object> into an ArrayList of the new type T.
	 * @param Arraylist<Object> to be copied.
	 * @param Arraylist<T> to be copied to.
	 * @author NicoECvK
	 */
	<T> void fromObjectALToOtherAL(ArrayList<Object> objectAL, ArrayList<T> otherAL) {
	    for (Object object : objectAL) {
	    	otherAL.add((T) object); // Correct
	    }
	}
	
	
	/**
	 * Parses a ResultSet containing houses into an ArrayList of Houses.
	 * @param ResultSet to be parsed.
	 * @return ArrayList of achievement Houses contained in the ResultSet.
	 * @author NicoECvK
	 */
	private ArrayList<Object> parseHouseArray(ResultSet rs) {
		try {
			ArrayList<Object> resultingAchievements = new ArrayList<Object>();
			while (rs.next()) {
				String houseName = rs.getString("houseName");
				String houseType = rs.getString("houseType");
				String location = rs.getString("location");
				String tier = rs.getString("tier");
				String imageFileName = rs.getString("imageFileName");
				String text = rs.getString("text");
				House house = new House(houseName, houseType, location, tier, imageFileName, text);
				resultingAchievements.add(house);
			}
			return resultingAchievements;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * Parses a ResultSet containing houses into an ArrayList of Comments.
	 * @param ResultSet to be parsed.
	 * @return ArrayList of achievement Comments contained in the ResultSet.
	 * @author NicoECvK
	 */
	private ArrayList<Object> parseCommentArray(ResultSet rs) {
		try {
			ArrayList<Object> resultingAchievements = new ArrayList<Object>();
			while (rs.next()) {
				String username = rs.getString("username");
				String houseName = rs.getString("houseName");
				String text = rs.getString("comment");
				Time creationTime = rs.getTime("creationTime");
				Comment comment = new Comment(username, houseName, text);
				comment.creationTime = creationTime;
				resultingAchievements.add(comment);
			}
			return resultingAchievements;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
