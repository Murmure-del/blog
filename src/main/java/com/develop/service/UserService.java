package com.develop.service;

import com.develop.pojo.User;

public interface UserService {

    //根据名字查询用户
    User queryUserByName(String name);

    User UserLogin(String name, String password);
}
