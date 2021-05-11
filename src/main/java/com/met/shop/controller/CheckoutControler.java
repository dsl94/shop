package com.met.shop.controller;

import com.met.shop.domain.*;
import com.met.shop.dto.CheckoutDto;
import com.met.shop.service.OrderService;
import com.met.shop.service.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RestController
public class CheckoutControler {
	
	@Autowired
	private ShoppingCartService shoppingCartService;
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "/checkout", method = RequestMethod.POST)
	public ResponseEntity<?> placeOrder(@RequestBody CheckoutDto checkoutDto, Authentication authentication) {
		User user = (User) authentication.getPrincipal();		
		ShoppingCart shoppingCart = shoppingCartService.getShoppingCart(user);	
		if (!shoppingCart.isEmpty()) {
			checkoutDto.getShipping().setAddress(checkoutDto.getAddress());
			Order order = orderService.createOrder(shoppingCart, checkoutDto.getShipping(), checkoutDto.getPayment(), user);
			return ResponseEntity.ok(order);
		}

		return ResponseEntity.badRequest().build();
	}

}
