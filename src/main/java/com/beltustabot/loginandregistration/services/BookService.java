package com.beltustabot.loginandregistration.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beltustabot.loginandregistration.models.Book;
import com.beltustabot.loginandregistration.repositories.BookRepository;

@Service
public class BookService {
	@Autowired
	private BookRepository bookRepo;
	
	//create
	public Book createBook(Book book) {
		return bookRepo.save(book);
	}
	
	
	// all books
	 public List<Book> allBooks(){
		 return bookRepo.findAll();
		 
		 
	 }
	
	
	// find one book
	 public Book oneBook(Long id) {
		 Optional<Book> optionalBook = bookRepo.findById(id);
		 if(optionalBook.isPresent()) {
		 return optionalBook.get();
		 }else {
			 return null;
		 }
	 }
	 //edit
	 public Book editBook(Book book) {
		 return bookRepo.save(book);
	 }
	
	//delete
	 public void deleteBook(Long id){
		 bookRepo.deleteById(id);
	 }
	

}
