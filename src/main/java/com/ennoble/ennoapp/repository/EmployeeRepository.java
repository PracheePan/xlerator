package com.ennoble.ennoapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ennoble.ennoapp.model.Employee;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long> {

    Employee findByFirstName(String firstName);

}
