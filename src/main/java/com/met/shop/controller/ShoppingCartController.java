package com.met.shop.controller;

import com.met.shop.domain.Article;
import com.met.shop.domain.CartItem;
import com.met.shop.domain.ShoppingCart;
import com.met.shop.domain.User;
import com.met.shop.dto.AddToCartDto;
import com.met.shop.service.ArticleService;
import com.met.shop.service.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RestController
@RequestMapping("/shopping-cart")
public class ShoppingCartController {
		
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private ShoppingCartService shoppingCartService;
	
	@RequestMapping("/cart")
	public ResponseEntity<ShoppingCart> shoppingCart( Authentication authentication) {
		User user = (User) authentication.getPrincipal();
		ShoppingCart shoppingCart = shoppingCartService.getShoppingCart(user);
		return ResponseEntity.ok(shoppingCart);
	}

	@RequestMapping(value = "/add-item", method = RequestMethod.POST)
	public ResponseEntity<?> addItem(@RequestBody AddToCartDto addToCartDto, Authentication authentication) {
		Article article = articleService.findArticleById(addToCartDto.getArticleId());
		if (!article.hasStock(addToCartDto.getQty())) {
			return ResponseEntity.badRequest().body("Not enough stock");
		}		
		User user = (User) authentication.getPrincipal();		
		shoppingCartService.addArticleToShoppingCart(article, user, addToCartDto.getQty(), addToCartDto.getSize());
		return ResponseEntity.ok().build();
	}
	
	@RequestMapping(value = "/update-item/{id}/{qty}", method = RequestMethod.PUT)
	public ResponseEntity<?> updateItemQuantity(@PathVariable("id") Long cartItemId,
                                     @PathVariable("qty") Integer qty) {
		CartItem cartItem = shoppingCartService.findCartItemById(cartItemId);
		if (cartItem.canUpdateQty(qty)) {
			shoppingCartService.updateCartItem(cartItem, qty);
		}
		return ResponseEntity.ok().build();
	}
	
	@RequestMapping(value = "/remove-item/{id}", method = RequestMethod.DELETE)
	public String removeItem(@PathVariable("id") Long id) {
		shoppingCartService.removeCartItem(shoppingCartService.findCartItemById(id));		
		return "redirect:/shopping-cart/cart";
	} 
}
