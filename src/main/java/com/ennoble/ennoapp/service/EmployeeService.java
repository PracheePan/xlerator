package com.ennoble.ennoapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ennoble.ennoapp.model.Employee;
import com.ennoble.ennoapp.repository.EmployeeRepository;

@Service
@Transactional
public class EmployeeService implements IEmployeeService {

	@Autowired
	private EmployeeRepository employeeRepository;

	public Employee findById(Long id) {
		return employeeRepository.findOne(id);
	}

	public Employee findByName(String name) {
		return employeeRepository.findByFirstName(name);
	}

	public void saveUser(Employee user) {
		employeeRepository.save(user);
	}

	public void updateUser(Employee user) {
		saveUser(user);
	}

	public void deleteUserById(Long id) {
		employeeRepository.delete(id);
	}

	public void deleteAllUsers() {
		employeeRepository.deleteAll();
	}

	public List<Employee> findAllUsers() {
		return employeeRepository.findAll();
	}

	public boolean isUserExist(Employee user) {
		return findByName(user.getFirstName()) != null;
	}

}
