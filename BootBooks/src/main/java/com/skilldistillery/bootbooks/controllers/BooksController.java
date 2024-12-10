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
	
	@GetMapping("deleteBookForm.do")
    public String showDeleteBookForm(Model model) {
		List<Books> books = dao.findAll();
        model.addAttribute("book", books);
        return "deletebook"; // This returns deletebook.jsp
    }
	
	@PostMapping("deleteBooks.do")
	public ModelAndView deleteBook(@RequestParam("bookId") int booksId) {
	    ModelAndView mv = new ModelAndView();
	    boolean wasDeleted = dao.deleteBooks(booksId);

	    mv.addObject("book",dao.findAll());
	    // Return to the main page (or the page that shows updated list)
	    mv.setViewName("deletebook");
	    return mv;
	}
	
	@GetMapping("editBookForm.do")
	public String showEditBookForm(@RequestParam("bookId") int bookId, Model model) {
	    Books book = dao.findBooksById(bookId);
	    if (book == null) {
	    	return "redirect:home.do";
	    }
	    model.addAttribute("book", book);
	    return "updatebook";
	}
	
	@PostMapping("updateBook.do")
    public String updateBook(@RequestParam("bookId") int bookId,
                             @RequestParam("bookTitle") String bookTitle,
                             @RequestParam("author") String author,
                             @RequestParam("genre") String genre,
                             @RequestParam("year") Integer year,
                             Model model) {
        Books updatedInfo = new Books(bookTitle, author, genre, year);
        Books updatedBook = dao.updateBook(updatedInfo, bookId);
        if (updatedBook == null) {
            model.addAttribute("error", "Unable to update book");
            return "updatebook"; 
        }
        model.addAttribute("book", updatedBook);
    
        return "updatebook"; 
    }

	
}
