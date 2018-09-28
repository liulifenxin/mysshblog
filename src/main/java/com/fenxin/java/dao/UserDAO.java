package com.fenxin.java.dao;

import com.fenxin.java.entity.User;

import java.util.List;

public interface UserDAO {
    public int save(User u);
    public List<User> findAll();
}

