package databaseConnection;

import java.sql.*;

/**
 * Class to manage a single connection to the remote SQL database.
 * This can be used to execute SQL queries, and its public member
 * functions will return ResultSet objects.
 * @author ashwinsr
 */
public class DatabaseConnection {
	// Database access variables
	private static String server = DBCredentials.MYSQL_DATABASE_SERVER;
	private static String account = DBCredentials.MYSQL_USERNAME;
	private static String password = DBCredentials.MYSQL_PASSWORD;
	private static String database = DBCredentials.MYSQL_DATABASE_NAME;
	
	// Connection to the database
	private Connection con;
	
	// Number of times to reconnect to the database
	public static final int CONNECTION_RETRIES = 5;
	
	/**
	 * Constructs the DatabaseConnection object and builds a connection to the
	 * remote SQL server
	 */
	public DatabaseConnection() {
		buildConnection();
	}
	
	/**
	 * A function to execute a SQL query on the remote SQL database
	 * that does not modify the database. The query should be a
	 * PARAMETERIZED query, with the appropriate number of parameters
	 * in the varargs parameter after.
	 * @param The SQL parameterized query to be executed
	 * @param The parameters of the query
	 * @return The ResultSet object returned by the Query
	 * @throws SQLException, RuntimeException (if opening a connection fails)
	 */
	public ResultSet executeQuery(String query, String... parameters) throws SQLException {
		if(con == null || con.isClosed())
			// Attempt to rectify problem
			if(!buildConnection())
				throw new RuntimeException("Unable to create connection after retries.");
		
		// Create the prepared statement
		PreparedStatement stmt = con.prepareStatement(query);
		for(int i = 1; i <= parameters.length; i++)
			stmt.setString(i, parameters[i-1]);
		System.out.println(stmt);
		return stmt.executeQuery();
	}
	
	/**
	 * A function to execute a SQL query on the remote SQL database
	 * that modifies the database. The query should be a
	 * PARAMETERIZED query, with the appropriate number of parameters
	 * in the varargs parameter after.
	 * @param The parameterized SQL query to be executed
	 * @param The parameters of the query
	 * @return The ResultSet object returned by the Query
	 * @throws SQLException, RuntimeException (if opening a connection fails)
	 */
	public int executeUpdate(String query, String... parameters) throws SQLException {
		if(con == null || con.isClosed())
			// Attempt to rectify problem
			if(!buildConnection())
				throw new RuntimeException("Unable to create connection after retries.");
		
		// Create the prepared statement
		PreparedStatement stmt = con.prepareStatement(query);
		for(int i = 1; i <= parameters.length; i++)
			stmt.setString(i, parameters[i-1]);
		
		System.out.println(stmt);
		return stmt.executeUpdate();
	}
	
	/**
	 * Function to attempt to connect (a maximum of CONNECTION_RETRIES
	 * times) to the remote SQL server.
	 * @return A boolean specifying whether the connection to the server
	 * was successful.
	 */
	private boolean buildConnection() {
		try {
			if(con != null && !con.isClosed()) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		for(int i = 0; i < CONNECTION_RETRIES; i++)
			if(buildConnectionOnce()) return true;
		
		return false;
	}
	
	/**
	 * A private member function that attempts to connect to the remote SQL
	 * server one time.
	 * @return A boolean specifying whether the connection was successful
	 */
	private boolean buildConnectionOnce() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection
					("jdbc:mysql://" + server, account, password);
			Statement stmt = con.createStatement();
			stmt.executeQuery("USE " + database);
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	/**
	 * Function to close the connection to the remote SQL server. Clients
	 * must call this when done with the model.
	 * @return Boolean indicating whether the connection was successfully
	 * closed.
	 */
	public boolean closeConnection() {
		try {
			if(con == null || con.isClosed()) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {
			con.close();
			con = null;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
}