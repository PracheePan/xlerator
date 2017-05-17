package com.ennoble.ennoapp.service;

import com.ennoble.ennoapp.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
