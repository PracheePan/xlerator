package com.ennoble.ennoapp.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.ennoble.ennoapp.model.Employee;
import com.ennoble.ennoapp.service.IEmployeeService;
import com.ennoble.ennoapp.util.CustomErrorType;

@RestController
@RequestMapping("/api")
public class RestApiController {

	public static final Logger logger = LoggerFactory.getLogger(RestApiController.class);

	@Autowired
	private IEmployeeService employeeService; //Service which will do all data retrieval/manipulation work

	// -------------------Retrieve All Users---------------------------------------------

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/user/", method = RequestMethod.GET)
	public ResponseEntity<List<Employee>> listAllUsers() {
		List<Employee> users = employeeService.findAllUsers();
		if (users.isEmpty()) {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
			// You many decide to return HttpStatus.NOT_FOUND
		}
		return new ResponseEntity<List<Employee>>(users, HttpStatus.OK);
	}

	// -------------------Retrieve Single User------------------------------------------

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
	public ResponseEntity<?> getUser(@PathVariable("id") long id) {
		logger.info("Fetching User with id {}", id);
		Employee user = employeeService.findById(id);
		if (user == null) {
			logger.error("User with id {} not found.", id);
			return new ResponseEntity(new CustomErrorType("User with id " + id  + " not found"), HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<Employee>(user, HttpStatus.OK);
	}

	// -------------------Create a User-------------------------------------------
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/user/", method = RequestMethod.POST)
	public ResponseEntity<?> createUser(@RequestBody Employee user, UriComponentsBuilder ucBuilder) {
		logger.info("Creating User : {}", user);

		if (employeeService.isUserExist(user)) {
			logger.error("Unable to create. A User with name {} already exist", user.getFirstName());
			return new ResponseEntity(new CustomErrorType("Unable to create. A User with name " + 
			user.getFirstName() + " already exist."),HttpStatus.CONFLICT);
		}
		employeeService.saveUser(user);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/api/user/{id}").buildAndExpand(user.getId()).toUri());
		return new ResponseEntity<String>(headers, HttpStatus.CREATED);
	}

	// ------------------- Update a User ------------------------------------------------
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/user/{id}", method = RequestMethod.PUT)
	public ResponseEntity<?> updateUser(@PathVariable("id") long id, @RequestBody Employee user) {
		logger.info("Updating User with id {}", id);

		Employee currentUser = employeeService.findById(id);

		if (currentUser == null) {
			logger.error("Unable to update. User with id {} not found.", id);
			return new ResponseEntity(new CustomErrorType("Unable to upate. User with id " + id + " not found."),
					HttpStatus.NOT_FOUND);
		}

		currentUser.setFirstName(user.getFirstName());
		currentUser.setLastName(user.getLastName());
		currentUser.setAge(user.getAge());
		currentUser.setSalary(user.getSalary());

		employeeService.updateUser(currentUser);
		return new ResponseEntity<Employee>(currentUser, HttpStatus.OK);
	}

	// ------------------- Delete a User-----------------------------------------
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<?> deleteUser(@PathVariable("id") long id) {
		logger.info("Fetching & Deleting User with id {}", id);

		Employee user = employeeService.findById(id);
		if (user == null) {
			logger.error("Unable to delete. User with id {} not found.", id);
			return new ResponseEntity(new CustomErrorType("Unable to delete. User with id " + id + " not found."),
					HttpStatus.NOT_FOUND);
		}
		employeeService.deleteUserById(id);
		return new ResponseEntity<Employee>(HttpStatus.NO_CONTENT);
	}

	// ------------------- Delete All Users-----------------------------

	@RequestMapping(value = "/user/", method = RequestMethod.DELETE)
	public ResponseEntity<Employee> deleteAllUsers() {
		logger.info("Deleting All Users");

		employeeService.deleteAllUsers();
		return new ResponseEntity<Employee>(HttpStatus.NO_CONTENT);
	}

}