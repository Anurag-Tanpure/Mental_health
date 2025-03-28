package com.mental_health.dao;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mental_health.models.User;

@Service
@Transactional
public class UserService {

    @Autowired
    private UserDAO userDAO;

    public void addUser(User user) {
        userDAO.saveUser(user);
    }

    public List<User> fetchAllUsers() {
        return userDAO.getAllUsers();
    }
}
