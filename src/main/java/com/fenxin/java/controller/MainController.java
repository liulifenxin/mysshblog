package com.fenxin.java.controller;

import com.fenxin.java.entity.User;
import com.fenxin.java.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class MainController {

    @Autowired
    private UserService userService;

    @RequestMapping("")
    public String index(){
        return "index2";
    }

    @RequestMapping("/json2")
    @ResponseBody
    public Map<String, String> json2() {
        Map<String, String> result = new HashMap<String, String>();
        result.put("MarK", "hello");
        result.put("Ken", "Hehe");
        result.put("Fowafolo", "fool");
        String x = "adc";
        return result;
    }

    @RequestMapping("/add")
    public String add(){
        List<User> us = new ArrayList<User>();
        User u = new User();
        u.setUsername("MarK");
        us.add(u);
        u = new User();
        u.setUsername("Fawofolo");
        us.add(u);
        userService.saveUsers(us);
        return "index2";
    }
    @RequestMapping("/json")
    @ResponseBody
    public List<User> json(){
        return userService.getAllUsernames();
    }

    @RequestMapping("/string")
    @ResponseBody
    public String string() {
        String x = "adcadc";
        return x;
    }
}

