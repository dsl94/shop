package com.met.shop.service.impl;

import com.met.shop.domain.User;
import com.met.shop.repository.UserRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import static org.junit.jupiter.api.Assertions.*;

@ExtendWith(MockitoExtension.class)
class UserSecurityServiceTest {

    @Mock
    private UserRepository userRepository;

    @InjectMocks
    private UserSecurityService userSecurityService;

    @Test
    public void loadByUsername() {
        User expected = new User();
        expected.setId(1L);
        expected.setUsername("user");

        Mockito.when(userRepository.findByUsername("user")).thenReturn(expected);

        UserDetails actual = userSecurityService.loadUserByUsername("user");

        assertEquals(expected, actual);
    }

    @Test
    public void loadByUsernameNotFound() {
        Mockito.when(userRepository.findByUsername("user")).thenReturn(null);

        assertThrows(UsernameNotFoundException.class, () -> {
            userSecurityService.loadUserByUsername("user");
        });
    }

    @Test
    public void testAuthenticate() {
        User expected = new User();
        expected.setId(1L);
        expected.setUsername("user");

        Mockito.when(userRepository.findByUsername("user")).thenReturn(expected);

        userSecurityService.authenticateUser("user");
    }

    @Test
    public void authenticateFailed() {
        Mockito.when(userRepository.findByUsername("user")).thenReturn(null);

        assertThrows(UsernameNotFoundException.class, () -> {
            userSecurityService.authenticateUser("user");
        });
    }
}