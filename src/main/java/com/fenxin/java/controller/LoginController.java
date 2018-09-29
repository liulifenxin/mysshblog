package com.fenxin.java.controller;

import com.fenxin.java.entity.User;
import com.fenxin.java.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(HttpServletRequest request, HttpSession session, String username, String password) {

        return "/front/Audit_first_page";
    }

    @RequestMapping("/doLogin")
    @ResponseBody
    public String doLogin(HttpSession session, String number, String password, HttpServletRequest request, String code) {
        System.out.println("/front/priceQuery start");
        User user = null;
        user = userService.getUserByName(number);
        System.out.println(user.getId() + user.getUsername());
        if(user.getUsername().equals("password")) {
            return "{\"success\":true,\"type\":8}";
        }
        System.out.println("/front/priceQuery end");
        return "{\"success\":true,\"type\":8}";
    }

    @RequestMapping({"/loginJump"})
    public String loginJump(HttpServletRequest request, HttpSession session, String username, String password) {
        User user = null;
        if (password != null && !password.equals("")) {
            if (user != null) {
                session.setAttribute("user", user);
                return "/front/priceQuery";
            }
        }

        return "/front/Audit_first_page";
    }
}