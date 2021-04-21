package com.met.shop.service.impl;

import com.met.shop.domain.User;
import com.met.shop.domain.security.Role;
import com.met.shop.repository.RoleRepository;
import com.met.shop.repository.UserRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Collections;

import static org.junit.jupiter.api.Assertions.*;

@ExtendWith(MockitoExtension.class)
class UserServiceImplTest {

    @Mock
    private UserRepository userRepository;
    @Mock
    private RoleRepository roleRepository;

    @InjectMocks
    private UserServiceImpl userService;

    @Test
    public void testFindByUsername() {
        User expected = new User();
        expected.setId(1L);
        expected.setUsername("user1");

        Mockito.when(userRepository.findByUsername("user1")).thenReturn(expected);

        User actual = userService.findByUsername("user1");

        assertEquals(expected, actual);
    }

    @Test
    void testFindByUsernameNotFound() {
        Mockito.when(userRepository.findByUsername("user1")).thenReturn(null);

        User actual = userService.findByUsername("user1");

        assertNull(actual);
    }

    @Test
    public void testFindByEmail() {
        User expected = new User();
        expected.setId(1L);
        expected.setUsername("user1");
        expected.setEmail("user1@mail.com");

        Mockito.when(userRepository.findByEmail("user1@mail.com")).thenReturn(expected);

        User actual = userService.findByEmail("user1@mail.com");

        assertEquals(expected, actual);
    }

    @Test
    public void testFindByEmailNotFound() {
        Mockito.when(userRepository.findByEmail("user1@mail.com")).thenReturn(null);

        User actual = userService.findByEmail("user1@mail.com");

        assertNull(actual);
    }

    @Test
    public void testSave() {
        User user = new User();
        user.setId(1L);
        user.setUsername("user1");
        user.setEmail("user1@mail.com");

        userService.save(user);

        Mockito.verify(userRepository, Mockito.times(1)).save(user);
    }

    @Test
    public void testUserCreateUserDoesNotExist() {
        User expected = new User();
        expected.setId(1L);
        expected.setUsername("user");
        expected.setPassword("password");
        expected.setEmail("user@mail.com");

        Role role = new Role();
        role.setRoleId(1L);
        role.setName("ROLE");

        Mockito.when(userRepository.findByUsername("user")).thenReturn(null);
        Mockito.when(roleRepository.findByName("ROLE")).thenReturn(role);
        Mockito.when(userRepository.save(Mockito.any())).thenReturn(expected);

        User actual = userService.createUser("user", "password", "user@mail.com", Collections.singletonList("ROLE"));

        assertEquals(expected, actual);
    }

    @Test
    public void testUserCreateUserExists() {
        User expected = new User();
        expected.setId(1L);
        expected.setUsername("user");
        expected.setPassword("password");
        expected.setEmail("user@mail.com");

        Mockito.when(userRepository.findByUsername("user")).thenReturn(expected);

        User actual = userService.createUser("user", "password", "user@mail.com", Collections.singletonList("ROLE"));

        Mockito.verify(userRepository, Mockito.times(0)).save(Mockito.any());
        assertEquals(expected, actual);
    }
}