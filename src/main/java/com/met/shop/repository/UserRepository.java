package com.met.shop.repository;

import com.met.shop.domain.User;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.EntityGraph.EntityGraphType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends JpaRepository<User, Long> {
		
	@EntityGraph(value = "UserComplete", type= EntityGraphType.FETCH)
	User findByUsername(String username);
			
	User findByEmail(String email);

}
