package com.skilldistillery.bootbooks.data;


import java.util.List;

import com.skilldistillery.jpabooks.entities.Books;

public interface BooksDAO {
	int updateNullBooks();
	Books addBooks(Books books);
	boolean deleteBooks(int booksId);
	List<Books> findAll();
	Books findBooksById(int id);
	Books updateBook(Books book, int id);

}
