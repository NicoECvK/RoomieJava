package databaseInteractor;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;


public class DatabaseInteractorTest {
	
	private DatabaseInteractor dbInteractor;
	
	@Before
	public void setUp() {
		this.dbInteractor = new DatabaseInteractor();
	}
	
	
	@Test
	public void housesTest() {
		ArrayList<House> houses = dbInteractor.getAllHouses();
		assertEquals(22, houses.size());
	}

}
