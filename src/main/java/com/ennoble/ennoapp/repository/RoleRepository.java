package com.ennoble.ennoapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ennoble.ennoapp.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{
}
