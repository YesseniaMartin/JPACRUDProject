package com.skilldistillery.jpabooks.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class BooksTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	// entity under test
	private Books books;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("Books");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		books = new Books();
		em = emf.createEntityManager();
		books = em.find(Books.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		books = null;
	}

	@Test
	void test_Books_basic_mappings() {
		assertNotNull(books);
		assertEquals(1, books.getId());
		assertEquals("Rick Riordan", books.getAuthor());
		assertEquals("Percy Jackson The Lightning Thief", books.getBookTitle());
		assertEquals("Action & Adventure", books.getGenre());
		assertEquals(2005, books.getYear());
		
	}
	

}
