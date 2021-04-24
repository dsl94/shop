package com.met.shop.service.impl;

import com.met.shop.domain.*;
import com.met.shop.repository.CartItemRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.*;

import static org.junit.jupiter.api.Assertions.*;

@ExtendWith(MockitoExtension.class)
class ShoppingCartServiceImplTest {

    @Mock
    private CartItemRepository cartItemRepository;

    @InjectMocks
    private ShoppingCartServiceImpl shoppingCartService;

    @Test
    public void testGetByUser() {
        Article article1 = new Article();
        article1.setId(1L);
        Article article2 = new Article();
        article2.setId(2L);
        CartItem c1 = new CartItem();
        c1.setId(1L);
        c1.setQty(1);
        c1.setSize("L");
        c1.setArticle(article1);
        CartItem c2 = new CartItem();
        c2.setId(2L);
        c2.setQty(1);
        c2.setSize("L");
        c2.setArticle(article2);
        Shipping shipping = new Shipping();
        shipping.setId(1L);
        List<CartItem> items = new ArrayList<>(Arrays.asList(c1, c2));
        User user = new User();

        Mockito.when(cartItemRepository.findAllByUserAndOrderIsNull(user)).thenReturn(items);

        ShoppingCart actual = shoppingCartService.getShoppingCart(user);

        assertEquals(2, actual.getCartItems().size());
        assertEquals(c1, actual.getCartItems().get(0));
        assertEquals(c2, actual.getCartItems().get(1));
    }

    @Test
    public void testGetItemsNumber() {
        User user = new User();

        Mockito.when(cartItemRepository.countDistinctByUserAndOrderIsNull(user)).thenReturn(5);

        int actual = shoppingCartService.getItemsNumber(user);

        assertEquals(5, actual);
    }

    @Test
    public void testFindById() {
        CartItem expected = new CartItem();

        Mockito.when(cartItemRepository.findById(1L)).thenReturn(Optional.of(expected));

        CartItem actual = shoppingCartService.findCartItemById(1L);

        assertEquals(expected, actual);
    }

    @Test
    public void testFindByIdNotFound() {
        Mockito.when(cartItemRepository.findById(1L)).thenReturn(Optional.empty());

        assertThrows(NoSuchElementException.class, () -> {
            shoppingCartService.findCartItemById(1L);
        });
    }

    @Test
    public void testAddToCart() {
        Article article1 = new Article();
        article1.setId(1L);
        Article article2 = new Article();
        article2.setId(2L);
        CartItem c1 = new CartItem();
        c1.setId(1L);
        c1.setQty(1);
        c1.setSize("L");
        c1.setArticle(article1);
        CartItem c2 = new CartItem();
        c2.setId(2L);
        c2.setQty(1);
        c2.setSize("L");
        c2.setArticle(article2);
        Shipping shipping = new Shipping();
        shipping.setId(1L);
        List<CartItem> items = new ArrayList<>(Arrays.asList(c1, c2));
        Article article = new Article();
        article.setId(1L);
        User user = new User();
        int qty = 1;
        String size = "S";

        Mockito.when(cartItemRepository.findAllByUserAndOrderIsNull(user)).thenReturn(items);

        shoppingCartService.addArticleToShoppingCart(article, user, qty, size);

        Mockito.verify(cartItemRepository, Mockito.times(1)).save(Mockito.any());
    }

    @Test
    public void testRemoveCartItem() {
        CartItem cartItem = new CartItem();
        cartItem.setId(1L);

        shoppingCartService.removeCartItem(cartItem);

        Mockito.verify(cartItemRepository, Mockito.times(1)).deleteById(1L);
    }

    @Test
    public void testClearShoppingCart() {
        User user = new User();

        shoppingCartService.clearShoppingCart(user);

        Mockito.verify(cartItemRepository, Mockito.times(1)).deleteAllByUserAndOrderIsNull(user);
    }

    @Test
    public void testUpdateQtyLessThen1() {
        CartItem cartItem = new CartItem();
        cartItem.setId(1L);

        shoppingCartService.updateCartItem(cartItem, 0);

        Mockito.verify(cartItemRepository, Mockito.times(1)).deleteById(1L);
    }

    @Test
    public void testUpdateQtyGreaterThen0() {
        Article article = new Article();
        article.setStock(5);
        CartItem cartItem = new CartItem();
        cartItem.setId(1L);
        cartItem.setQty(1);
        cartItem.setArticle(article);

        shoppingCartService.updateCartItem(cartItem, 1);

        Mockito.verify(cartItemRepository, Mockito.times(1)).save(cartItem);
    }
}