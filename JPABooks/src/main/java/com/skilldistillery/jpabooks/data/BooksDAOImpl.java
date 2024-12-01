package com.skilldistillery.jpabooks.data;

import com.skilldistillery.jpabooks.entities.Books;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class BooksDAOImpl implements BooksDAO {
	private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("Books");

	@Override
	public int updateNullBooks() {
		EntityManager em = emf.createEntityManager();
		 String jpql = "UPDATE Books b " +
                 "SET b.genre = concat(COALESCE(b.genre, 'Default'), ' Genre') " +
                 "WHERE b.genre IS NULL OR b.genre = ''";

		em.getTransaction().begin();
		int numberRowsAffected = em.createQuery(jpql).executeUpdate();

		em.getTransaction().commit();

		em.close();
		return numberRowsAffected;
	}

	@Override
	public Books addBooks(Books books) {
		EntityManager em = emf.createEntityManager();

		em.getTransaction().begin();
		books = em.merge(books);
		em.persist(books);

		em.getTransaction().commit();

		em.close();
		return books;
	}

	@Override
	public boolean deleteBooks(int booksId) {
		EntityManager em = emf.createEntityManager();
		boolean wasDeleted = false;

		em.getTransaction().begin();
		Books bookToDelete = em.find(Books.class, booksId);
		if (bookToDelete != null) {
			em.remove(bookToDelete);
			wasDeleted = true;
		}
		em.getTransaction().commit();
		wasDeleted = !em.contains(bookToDelete);

		em.close();
		return wasDeleted;
	}

}
