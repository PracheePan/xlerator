package com.ennoble.ennoapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ennoble.ennoapp.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
	
	@Query("FROM User WHERE username = :username")
    User findByUsername(@Param("username") String username);
}
