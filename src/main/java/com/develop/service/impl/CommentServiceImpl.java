package com.develop.service.impl;

import com.develop.mapper.CommentMapper;
import com.develop.pojo.Article;
import com.develop.pojo.Comment;
import com.develop.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public List<Comment> getCommentByArticleId(String id) {
        return commentMapper.getCommentByArticleId(id);
    }

    @Override
    public List<Comment> getCommentLimit(Map<String, Object> map) {
        return commentMapper.getCommentLimit(map);
    }

    @Override
    public int deleteById(String id) {
        return commentMapper.deleteById(id);
    }

    @Override
    public int insertComment(Comment comment) {
        return commentMapper.insertComment(comment);
    }

    @Override
    public int deleteAll() {
        return commentMapper.deleteAll();
    }


    public List<Comment> queryCommentLimit(int limit,String field,String sort){
        Map<String, Object> map = new HashMap<>();
        map.put("limit",limit);
        map.put("sort",sort);
        map.put("field",field);
        return getCommentLimit(map);
    }

}
