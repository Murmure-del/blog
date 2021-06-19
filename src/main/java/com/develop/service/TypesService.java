package com.develop.service;

import com.develop.pojo.Article;
import com.develop.pojo.Types;

import java.util.List;
import java.util.Map;

public interface TypesService {

    //添加一个分类
    int insertTypes(Types types);

    //删除一个分类
    int deleteTypes(String id);

    //根据id查询分类
    Types queryTypes(String id);

    //查询所有分类
    List<Types> queryAll();

    //修改分类
    int updateTypes(Types types);

    //查询分类的指定前几个，根据自定义字段排序
    List<Types> getTypeLimit(Map<String,Object> map);
}
