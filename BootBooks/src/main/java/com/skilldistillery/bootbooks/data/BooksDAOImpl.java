package com.skilldistillery.bootbooks.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpabooks.entities.Books;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class BooksDAOImpl implements BooksDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public Books findBooksById(int id) {
		Books book = em.find(Books.class, id);
		return book;
	}

	public List<Books> findAll() {
		String jpql = "SELECT book FROM Books book";
		List<Books> books = em.createQuery(jpql, Books.class).getResultList();
		return books;
	}

	@Override
	public int updateNullBooks() {
		String jpql = "UPDATE Books b " + "SET b.genre = 'Default Genre' ";
		jpql += "WHERE b.genre IS NULL OR b.genre = ''";
		int numberRowsAffected = em.createQuery(jpql).executeUpdate();
		return numberRowsAffected;
	}

	@Override
	public Books addBooks(Books books) {
		em.persist(books);
		return books;
	}

	@Override
	public boolean deleteBooks(int booksId) {
		boolean wasDeleted = false;
		Books bookToDelete = em.find(Books.class, booksId);
		if (bookToDelete != null) {
			em.remove(bookToDelete);
			wasDeleted = true;
		}
		wasDeleted = !em.contains(bookToDelete);
		return wasDeleted;
	}

	@Override
	public Books updateBook(Books book, int id) {
		Books managedBook = null;
		// Retrieve existing entity
		managedBook = em.find(Books.class, id);
		if (managedBook != null) {
			// Update entity fields
			if (book.getBookTitle() != null && !book.getBookTitle().trim().isEmpty()) {
				managedBook.setBookTitle(book.getBookTitle());
			}

			if (book.getAuthor() != null && !book.getAuthor().trim().isEmpty()) {
				managedBook.setAuthor(book.getAuthor());
			}

			if (book.getGenre() != null && !book.getGenre().trim().isEmpty()) {
				managedBook.setGenre(book.getGenre());
			}

			if (book.getYear() != null) {
				managedBook.setYear(book.getYear());
			}
			// Use merge to persist updates
			em.merge(managedBook);
		}

		// Return null or throw a custom exception if something goes wrong
		managedBook = null;

		return managedBook;
	}

}
