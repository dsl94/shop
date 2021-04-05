package com.met.shop.repository;

import com.met.shop.domain.security.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

public interface RoleRepository extends JpaRepository<Role, Long> {
	
	Role findByName(String name);

}
