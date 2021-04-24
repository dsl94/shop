package com.met.shop.service.impl;

import com.met.shop.domain.*;
import com.met.shop.repository.ArticleRepository;
import com.met.shop.repository.CartItemRepository;
import com.met.shop.repository.OrderRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@ExtendWith(MockitoExtension.class)
class OrderServiceImplTest {

    @Mock
    private OrderRepository orderRepository;
    @Mock
    private CartItemRepository cartItemRepository;
    @Mock
    private ArticleRepository articleRepository;

    @InjectMocks
    private OrderServiceImpl orderService;

    @Test
    public void testCreateOrder() {
        Article article1 = new Article();
        Article article2 = new Article();
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
        ShoppingCart shoppingCart = new ShoppingCart(new ArrayList<>(Arrays.asList(c1, c2)));
        Payment payment = new Payment();
        payment.setId(1L);
        User user = new User();
        user.setId(1L);

        orderService.createOrder(shoppingCart, shipping, payment, user);

        Mockito.verify(orderRepository, Mockito.times(1)).save(Mockito.any());
        Mockito.verify(articleRepository, Mockito.times(2)).save(Mockito.any());
        Mockito.verify(cartItemRepository, Mockito.times(2)).save(Mockito.any());
    }

    @Test
    public void testFindOrderById() {
        Order expected = new Order();
        expected.setId(1L);

        Mockito.when(orderRepository.findEagerById(1L)).thenReturn(expected);

        Order actual = orderService.findOrderWithDetails(1L);

        assertEquals(expected, actual);
    }

    @Test
    public void testFindOrderNotFound() {
        Mockito.when(orderRepository.findEagerById(1L)).thenReturn(null);

        Order actual = orderService.findOrderWithDetails(1L);

        assertNull(actual);
    }

    @Test
    public void testFindOrderByUser() {
        User user = new User();
        Order order = new Order();
        order.setId(1L);
        List<Order> expected = Collections.singletonList(order);

        Mockito.when(orderRepository.findByUser(user)).thenReturn(expected);

        List<Order> actual = orderService.findByUser(user);

        assertEquals(expected, actual);
    }

    @Test
    public void testFindOrderByUserNotFound() {
        User user = new User();
        Mockito.when(orderRepository.findByUser(user)).thenReturn(Collections.emptyList());

        List<Order> actual = orderService.findByUser(user);

        assertEquals(actual.size(), 0);
    }
}