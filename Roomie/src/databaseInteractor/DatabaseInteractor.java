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
	public House searchHouseByName(String houseName) {		
		String query = "SELECT * FROM House WHERE houseName = ?";
		ArrayList<Object> resultArray = new ArrayList<Object>();
		resultArray = constructResultArray("house", query, houseName);
		ArrayList<House> resultingHouses = new ArrayList<House>();
		fromObjectALToOtherAL(resultArray, resultingHouses);
		return resultingHouses.get(0);
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
			
			// Queries the Quiz relation and returns Quiz objects.
			if (queryType.equals("house")) {
				resultArray = parseHouseArray(rs);
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

}
