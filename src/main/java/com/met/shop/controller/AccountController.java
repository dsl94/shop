package com.met.shop.controller;

import com.met.shop.domain.Address;
import com.met.shop.domain.Order;
import com.met.shop.domain.User;
import com.met.shop.dto.NewUserDto;
import com.met.shop.service.OrderService;
import com.met.shop.service.UserService;
import com.met.shop.service.impl.UserSecurityService;
import com.met.shop.util.SecurityUtility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.security.Principal;
import java.util.Arrays;
import java.util.List;

@RestController
public class AccountController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private UserSecurityService userSecurityService;
	
	@Autowired
	private OrderService orderService;

	
	@RequestMapping("/my-profile")
	public ResponseEntity<User> myProfile(Authentication authentication) {
		User user = (User) authentication.getPrincipal();
		return ResponseEntity.ok(user);
	}
	
	@RequestMapping("/my-orders")
	public ResponseEntity<List<Order>> myOrders(Authentication authentication) {
		User user = (User) authentication.getPrincipal();
		List<Order> orders = orderService.findByUser(user);
		return ResponseEntity.ok(orders);
	}

	
	@RequestMapping(value="/update-user-address", method= RequestMethod.POST)
	public ResponseEntity<?> updateUserAddress(@RequestBody Address address,
                                   Principal principal) throws Exception {
		User currentUser = userService.findByUsername(principal.getName());
		if(currentUser == null) {
			throw new Exception ("User not found");
		}
		currentUser.setAddress(address);
		userService.save(currentUser);
		return ResponseEntity.ok().build();
	}
	
	@RequestMapping(value="/new-user", method= RequestMethod.POST)
	public ResponseEntity<?> newUserPost(@Valid @RequestBody NewUserDto newUser) {
		boolean invalidFields = userService.findByUsername(newUser.getUser().getUsername()) != null;

		if (userService.findByEmail(newUser.getUser().getEmail()) != null) {
			invalidFields = true;
		}	
		if (invalidFields) {
			return ResponseEntity.badRequest().build();
		}		
		userService.createUser(newUser.getUser().getUsername(), newUser.getPassword(),  newUser.getUser().getEmail(), Arrays.asList("ROLE_USER"));
		userSecurityService.authenticateUser(newUser.getUser().getUsername());
		return ResponseEntity.ok().build();
	}
		
	@RequestMapping(value="/update-user-info", method= RequestMethod.POST)
	public ResponseEntity<?> updateUserInfo(@Valid @RequestBody NewUserDto newUser, Principal principal) throws Exception {
		User currentUser = userService.findByUsername(principal.getName());
		if(currentUser == null) {
			throw new Exception ("User not found");
		}
		/*check username already exists*/
		User existingUser = userService.findByUsername(newUser.getUser().getUsername());
		if (existingUser != null && !existingUser.getId().equals(currentUser.getId()))  {
			return ResponseEntity.badRequest().build();
		}	
		/*check email already exists*/
		existingUser = userService.findByEmail(newUser.getUser().getEmail());
		if (existingUser != null && !existingUser.getId().equals(currentUser.getId()))  {
			return ResponseEntity.badRequest().build();
		}			
		/*update password*/
		if (newUser.getPassword() != null && !newUser.getPassword().isEmpty() && !newUser.getPassword().equals("")){
			BCryptPasswordEncoder passwordEncoder = SecurityUtility.passwordEncoder();
			String dbPassword = currentUser.getPassword();
			if(passwordEncoder.matches(newUser.getUser().getPassword(), dbPassword)){
				currentUser.setPassword(passwordEncoder.encode(newUser.getPassword()));
			} else {
				return ResponseEntity.badRequest().build();
			}
		}		
		currentUser.setFirstName(newUser.getUser().getFirstName());
		currentUser.setLastName(newUser.getUser().getLastName());
		currentUser.setUsername(newUser.getUser().getUsername());
		currentUser.setEmail(newUser.getUser().getEmail());
		userService.save(currentUser);
		userSecurityService.authenticateUser(currentUser.getUsername());
		return ResponseEntity.ok().build();
	}
	
	@RequestMapping("/order-detail")
	public String orderDetail(@RequestParam("order") Long id, Model model) {
		Order order = orderService.findOrderWithDetails(id);
		model.addAttribute("order", order);
		return "orderDetails";
	}
	
}
