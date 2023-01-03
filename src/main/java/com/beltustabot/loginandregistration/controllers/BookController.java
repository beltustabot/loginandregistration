package com.beltustabot.loginandregistration.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.beltustabot.loginandregistration.models.Book;
import com.beltustabot.loginandregistration.services.BookService;

@Controller
public class BookController {
	
	@Autowired
	private  BookService bookService;
  
	@GetMapping("/books")
    public String dashboard(HttpSession session, Model model) {
    	if(session.getAttribute("userId") == null){
    		return "redirect:/";
    	}
    	model.addAttribute("bookList", bookService.allBooks());
       return "dashboard.jsp";
	}
	
	//Create book
	//display the form
	@GetMapping("/books/new")
	public String displayNewBookform(@ModelAttribute("book") Book book) {
		return "newBook.jsp";
	}
	
	//process form
    @PostMapping("/books/new")
    public String processBookForm(@Valid @ModelAttribute("book") Book  book, BindingResult result,Model model){
    	if(result.hasErrors()) {
    		return "newBook.jsp";
    		}else
			bookService.createBook( book);
			return "redirect:/books";
    }
    //edit book : 1.get id from path variable 2. get donation from service 3. form
    //display the form
    @GetMapping("books/edit/{id}")
    public String displayEditBookForm( @PathVariable("id")Long id, Model model) {
    	Book book = bookService.oneBook(id);
    	model.addAttribute("book", book);
    	return "editBook.jsp";
    }
    
    //process
    @PutMapping("/books/edit/{id}")
	public String processUpdate(
			@PathVariable("id") Long id, 
			Model model, 
			@Valid @ModelAttribute("book") Book book, 
			BindingResult result) {
		if(result.hasErrors()) {
			model.addAttribute("book", book);
			return "editBook.jsp";
		}else {
			bookService.editBook(book);
			return "redirect:/books";
		}
		
    }
    
	  @DeleteMapping("/books/delete/{id}")
	    public String destroy(@PathVariable("id") Long id) {
	        bookService.deleteBook(id);
	        return "redirect:/books";
	    }
	  @GetMapping("/books/show/{id}")
	  public String show(@PathVariable("id") Long id, Model model) {
		  Book book = bookService.oneBook(id);
		  model.addAttribute("book", book);
		  return "bookDetails.jsp";
		  
	  }
	
}
