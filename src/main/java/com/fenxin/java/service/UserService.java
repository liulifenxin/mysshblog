package com.fenxin.java.service;

import com.fenxin.java.entity.User;

import java.util.List;

public interface UserService {
    public void saveUsers(List<User> us);
    public List<User> getAllUsernames();
}

