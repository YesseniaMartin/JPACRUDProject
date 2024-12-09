package com.skilldistillery.bootbooks.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.bootbooks.data.BooksDAO;
import com.skilldistillery.jpabooks.entities.Books;

@Controller
public class BooksController {
	
	private final BooksDAO dao;
	
	public BooksController(BooksDAO dao) {
		this.dao = dao;
	}
	
	@GetMapping(path = { "/", "show.do", "home.do"})
	public String home(Model model) {
		List<Books> books = dao.findAll();
		model.addAttribute("book", books);
		return "home";
	}

	@GetMapping("getBooks.do")
	public ModelAndView findBooksById(@RequestParam("bookId") int id) {
		ModelAndView mv = new ModelAndView();
		Books book = dao.findBooksById(id);
		System.out.println(book);
		mv.addObject("book", book);
		mv.setViewName("show");
		return mv;
	}
	@GetMapping("addBookForm.do")
	public String showAddBookForm() {
	    return "addbook"; // This returns the addbook.jsp page
	}
	
	@PostMapping("addBooks.do")
	public ModelAndView addBooks(@RequestParam("bookTitle") String bookTitle, 
			@RequestParam("author") String author,
		    @RequestParam("genre") String genre,
		    @RequestParam("year") Integer year) {
		ModelAndView mv = new ModelAndView();
		Books newBook = new Books(bookTitle, author, genre, year);
		Books bookAdded = dao.addBooks(newBook);
		System.out.println(bookAdded);
		mv.addObject("book", bookAdded);
		mv.setViewName("addbook");
		return mv;
	}
}
