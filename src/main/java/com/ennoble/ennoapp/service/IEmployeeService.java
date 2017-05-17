package com.ennoble.ennoapp.service;


import java.util.List;

import com.ennoble.ennoapp.model.Employee;

public interface IEmployeeService {
	
	Employee findById(Long id);

	Employee findByName(String name);

	void saveUser(Employee user);

	void updateUser(Employee user);

	void deleteUserById(Long id);

	void deleteAllUsers();

	List<Employee> findAllUsers();

	boolean isUserExist(Employee user);
}