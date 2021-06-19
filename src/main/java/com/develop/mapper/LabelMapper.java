package com.develop.mapper;

import com.develop.pojo.Article;
import com.develop.pojo.Label;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface LabelMapper {

    //根据文章id查询出该文章下所有的标签
    List<Label> getArticleToLabel(@Param("article_id") String article_id);

    //查询出所有的标签
    List<Label> getLabelAll();


    //查询标签的指定前几个，根据自定义字段排序
    List<Label> getLabelLimit(Map<String,Object> map);


    //添加标签
    int insertLabel(Label label);
}
