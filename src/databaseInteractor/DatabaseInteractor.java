package databaseInteractor;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;

public class DatabaseInteractor {
	
	
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
			if (queryType.equals("quiz")) {
				resultArray = parseQuizArray(rs);
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
	 * Parses a ResultSet containing achievements into an ArrayList of Strings.
	 * @param ResultSet to be parsed.
	 * @return ArrayList of achievement Strings contained in the ResultSet.
	 * @author NicoECvK
	 */
	private ArrayList<Object> parseAchievementArray(ResultSet rs) {
		try {
			ArrayList<Object> resultingAchievements = new ArrayList<Object>();
			while (rs.next()) {
				String username = rs.getString("username");
				String achievementStr = rs.getString("achievement");
				Time creationTime = rs.getTime("creationTime");
				Achievement achievement = new Achievement(username, achievementStr);
				achievement.creationTime = creationTime;
				resultingAchievements.add(achievement);
			}
			return resultingAchievements;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
