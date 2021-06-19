package com.develop.mapper;

import com.develop.pojo.Article;
import com.develop.pojo.Types;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface TypesMapper {

    //添加一个分类
    int insertTypes(Types types);

    //删除一个分类
    int deleteTypes(@Param("id") String id);

    //根据id查询分类
    Types queryTypes(@Param("id") String id);

    //查询所有分类
    List<Types> queryAll();

    //查询分类的指定前几个，根据自定义字段排序
    List<Types> getTypeLimit(Map<String,Object> map);

    //修改分类
    int updateTypes(Types types);
}
