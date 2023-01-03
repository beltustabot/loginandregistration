package com.beltustabot.loginandregistration.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.beltustabot.loginandregistration.models.LoginUser;
import com.beltustabot.loginandregistration.models.User;
import com.beltustabot.loginandregistration.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepo;
	
	   ////Register////////////
	    public User register(User newUser, BindingResult result) {
	    	
	    	
	    	Optional<User> optionalUser = userRepo.findByEmail(newUser.getEmail());
	        // TO-DO: Additional validations
            if(optionalUser.isPresent()) {            	
            	    result.rejectValue("email", "unique", "This email is already registered");           	
            }
            if(!newUser.getPassword().equals(newUser.getConfirm())) {
            	result.rejectValue("password","matches","The confirm password does not match");        	
            }
            if(result.hasErrors()) {
            	return null;
            }
			String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
			newUser.setPassword(hashed);
			userRepo.save(newUser);
			
			return newUser;
	    }
	    //login
	    public User login(LoginUser newLogin, BindingResult result) {
	    Optional<User> optionalUser = userRepo.findByEmail(newLogin.getEmail());
	    
	    if(!optionalUser.isPresent()) {
	    	result.rejectValue("email","unique","This email is already registered");
	    	return null;
	    }
	    User user = optionalUser.get();
	    if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
	    	result.rejectValue("password","Matches","Invalid Password");
	    }
	    if(result.hasErrors()) {
        	return null;
        }
	    return user;
	    }
	    
	    //find one user
	     public User oneUser(Long id) {
	    	 Optional <User> optionalUser = userRepo.findById(id);
	    	 if(optionalUser.isPresent()) {
	    		 return optionalUser.get();
	    	 }else {
	    		 return null;
	    		 
	    	 }
	     

}
}
