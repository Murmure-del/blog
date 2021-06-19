package com.develop.mapper;


import com.develop.pojo.Article;
import com.develop.pojo.Comment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface CommentMapper {

    //查询出该文章下所有的评论
    List<Comment> getCommentByArticleId(@Param("article_id") String id);

    //查询该文章指定前几个，根据自定义字段排序
    List<Comment> getCommentLimit(Map<String,Object> map);

    //根据id删除评论
    int deleteById(@Param("id") String id);

    //添加一条评论
    int insertComment(Comment comment);

    //删除所有评论
    int deleteAll();
}
