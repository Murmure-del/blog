package com.develop.controller.user;

import com.develop.pojo.User;
import com.develop.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserLoginController {

    @Autowired
    private UserServiceImpl userService;

    @GetMapping("/login")
    public String toLogin(){
        return "redirect:/login.html";
    }

    @PostMapping("/login")
    public String login(String username, String password, HttpSession session, Model model){
        String result = userService.UserResult(username,password);
        if (result!=null){
            session.setAttribute("username",result);
            return "admin/index";
        }else {
            System.out.println("==========login============");
            model.addAttribute("msg","用户名或密码错误！");
            return "admin/login";
        }
    }
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("username");
        return "redirect:/login.html";
    }
}
