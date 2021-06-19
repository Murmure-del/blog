package com.develop.service;

import com.develop.pojo.Article;
import com.develop.pojo.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CommentService {

    //查询出该文章下所有的评论
    List<Comment> getCommentByArticleId(String id);

    //查询该文章指定前几个，根据自定义字段排序
    List<Comment> getCommentLimit(Map<String,Object> map);

    //根据id删除评论
    int deleteById(String id);

    //添加一条评论
    int insertComment(Comment comment);

    //删除所有评论
    int deleteAll();
}
