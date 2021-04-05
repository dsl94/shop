package com.met.shop.util;

import com.met.shop.domain.User;
import com.met.shop.domain.security.Role;
import com.met.shop.repository.RoleRepository;
import com.met.shop.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Collections;

@Component
public class DatabaseSeeder {

    private Logger logger = LoggerFactory.getLogger(DatabaseSeeder.class);

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private UserRepository userRepository;

    @EventListener
    public void seed(ContextRefreshedEvent event) throws IOException {
        seedRolesTable();
        seedUsersTable();
    }

    private void seedRolesTable() {
        if (roleRepository.findAll().size() == 0) {
            logger.info("Seeding roles");
            Role admin = new Role();
            admin.setName("ROLE_ADMIN");
            roleRepository.save(admin);

            Role user = new Role();
            user.setName("ROLE_USER");
            roleRepository.save(user);
        }
    }

    private void seedUsersTable() {
        if (userRepository.findAll().size() == 0) {
            logger.info("Seeding users");
            Role systemAdminRole = roleRepository.findByName("ROLE_ADMIN");

            User systemAdmin = new User();
            systemAdmin.setFirstName("Admin");
            systemAdmin.setLastName("Admin");
            systemAdmin.setEmail("admin@mail.com");
            systemAdmin.setUsername("admin");
            systemAdmin.setPassword(SecurityUtility.passwordEncoder().encode("admin"));
            userRepository.save(systemAdmin);
        }
    }
}
