//package com.met.shop.controller;
//
//import com.met.shop.domain.User;
//import com.met.shop.domain.security.UserRole;
//import com.met.shop.service.OrderService;
//import com.met.shop.service.UserService;
//import com.met.shop.service.impl.UserSecurityService;
//import org.junit.jupiter.api.Test;
//import org.junit.jupiter.api.extension.ExtendWith;
//import org.mockito.Mock;
//import org.mockito.junit.jupiter.MockitoExtension;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.boot.test.mock.mockito.MockBean;
//import org.springframework.security.test.context.support.WithMockUser;
//import org.springframework.test.web.servlet.MockMvc;
//
//import java.util.Set;
//
//import static org.hamcrest.Matchers.*;
//import static org.mockito.Mockito.doReturn;
//import static org.mockito.ArgumentMatchers.any;
//import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.user;
//import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
//
//import static org.junit.jupiter.api.Assertions.*;
//
//@SpringBootTest
//@AutoConfigureMockMvc
//class AccountControllerTest {
//
//    @Autowired
//    MockMvc mockMvc;
//
//    @MockBean
//    private UserService userService;
//
//    @MockBean
//    private UserSecurityService userSecurityService;
//
//    @MockBean
//    private OrderService orderService;
//
//    @Test
//    public void testLogin() throws Exception {
//        mockMvc.perform(get("/login"))
//                .andExpect(status().isOk())
//                .andExpect(view().name("myAccount"));
//    }
//
//    @Test
//    @WithMockAu
//    public void testProfile() throws Exception {
//        User user = new User();
//        user.setUsername("user");
//        mockMvc.perform(get("/my-profile"))
//                .andExpect(status().isOk())
//                .andExpect(view().name("myProfile"))
//                .andExpect(model().attribute("user", notNullValue()));
//    }
//
//}