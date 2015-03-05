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
	
	
	@Test
	public void searchCommentsTest() {
		ArrayList<Comment> comments = dbInteractor.searchCommentByHouseName("Durand");
		assertEquals(2, comments.size());
		
		Comment newComment = new Comment("Nico", "Durand", "Love it");
		dbInteractor.insertComment(newComment);
		comments = dbInteractor.searchCommentByHouseName("Durand");
		assertEquals(3, comments.size());
		
		dbInteractor.deleteComment(newComment);
		comments = dbInteractor.searchCommentByHouseName("Durand");
		assertEquals(2, comments.size());
	}

}
