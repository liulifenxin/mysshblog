package com.fenxin.java.service;

import com.fenxin.java.dao.UserDAO;
import com.fenxin.java.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDAO userDao;

    @Override
    public void saveUsers(List<User> us) {
        for (User u : us) {
            userDao.save(u);
        }
    }

    @Override
    public List<User> getAllUsernames() {
        return userDao.findAll();
    }

    @Override
    public User getUserByName(String username) {
        return userDao.getUserByName(username);
    }

}

