package databaseConnection;

import static org.junit.Assert.*;

import java.sql.*;

import org.junit.Before;
import org.junit.Test;


public class DatabaseConnectionTest {
	private static final String tableName = "testDatabaseConnection";
	private DatabaseConnection connection;
	
	@Before
	public void setUp() {
		connection = new DatabaseConnection();
	}
	
	@Test
	public void testExecuteQuery() {
		ResultSet rs = null;
		try {
			rs = connection.executeQuery("select * from " + tableName);
			assertEquals(8, numRows(rs));
			
			rs = connection.executeQuery("select * from " + tableName + " where Metropolis = ?", "Rome");
			assertEquals(1, numRows(rs));
			
			rs = connection.executeQuery("select * from " + tableName + " where Metropolis like ?", "%on%");
			assertEquals(2, numRows(rs));
			
			rs = connection.executeQuery("select * from " + tableName + " where Population > ?", "8580000");
			assertEquals(2, numRows(rs));
			
			rs = connection.executeQuery("select * from " + tableName + " where Population = ?", "8580000");
			assertEquals(1, numRows(rs));
			
			rs = connection.executeQuery("select * from " + tableName + " where Population <= ?", "8580000");
			assertEquals(6, numRows(rs));
		} catch (SQLException e) {
			e.printStackTrace();	
			fail();
		}
	}
	
	@Test
	/**
	 * NOTE: If this test fails, this could leave the table in state with extra rows
	 * causing other tests to fail. If this test fails, please manually reset the table
	 * to the Metropolises table from CS108.
	 */
	public void testExecuteUpdate() {
		int result = 0;
		ResultSet rs = null;
		try {
			result = connection.executeUpdate("insert into " + tableName + " values( ? , ? , ? );", "Test", "Test", "0");
			assertEquals(1, result);
			rs = connection.executeQuery("select * from " + tableName);
			assertEquals(9, numRows(rs));
			
			result = connection.executeUpdate("delete from " + tableName + " where population = ?;", "0");
			assertEquals(1, result);
			rs = connection.executeQuery("select * from " + tableName);
			assertEquals(8, numRows(rs));
		} catch (SQLException e) {
			e.printStackTrace();	
			fail();
		}
	}
	
	private int numRows(ResultSet rs) throws SQLException {
		rs.last();
		return rs.getRow();
	}
}
