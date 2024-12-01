package com.skilldistillery.jpabooks.client;

import com.skilldistillery.jpabooks.data.BooksDAO;
import com.skilldistillery.jpabooks.data.BooksDAOImpl;



public class BooksClient {
	
		public static void main(String[] args) {
			BooksDAO dao = new BooksDAOImpl();
			
//			-AddBooks-
//			Books myBook = new Books("The Girl On The Train", "Paula Hawkins", "Fiction", 2015);
//			System.out.println("Before persist: " + myBook);
//			myBook = dao.addBooks(myBook);
//			System.out.println("After persist: " + myBook);
			
//			-deleteBook-
//			System.out.println(dao.deleteBooks(4));
			
//			-updateNullBooks-
//			System.out.println("Number of books changed: " + dao.updateNullBooks());
			
		}

}
