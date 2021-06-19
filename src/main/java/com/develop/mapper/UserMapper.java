package com.develop.mapper;

import com.develop.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserMapper {

    //根据ID查询用户
    User queryUserByName(@Param("username") String name);

    /*用户登录*/
    User UserLogin(@Param("username") String name,@Param("password") String password);
}
