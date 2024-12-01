package com.skilldistillery.jpabooks.data;

import com.skilldistillery.jpabooks.entities.Books;

public interface BooksDAO {
	int updateNullBooks();
	Books addBooks(Books books);
	boolean deleteBooks(int booksId);

}
