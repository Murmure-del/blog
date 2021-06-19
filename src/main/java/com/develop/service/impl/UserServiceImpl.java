package com.develop.service.impl;

import com.develop.mapper.UserMapper;
import com.develop.pojo.User;
import com.develop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;


    @Override
    public User queryUserByName(String name) {
        return userMapper.queryUserByName(name);
    }

    @Override
    public User UserLogin(String name, String password) {
        return userMapper.UserLogin(name,password);
    }

    public String UserResult(String name,String password) {
        User user = UserLogin(name,password);
        if (user!=null){
            return user.getId();
        }else {
            return null;
        }
    }
}
