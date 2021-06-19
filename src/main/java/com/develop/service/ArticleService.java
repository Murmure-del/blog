package com.develop.service;

import com.develop.pojo.Article;
import org.springframework.lang.Nullable;

import java.util.List;
import java.util.Map;


public interface ArticleService {
    //查询所有文章
    List<Article> getArticleAll(String types);

    //查询所有文章根据like_counts字段排序
    List<Article> getArticleLimit(Map<String,Object> map);

    //删除文章
    int deleteById(String id);

    //修改文章
    int updateArticle(Article article);

    //添加文章
    int insertArticle(Article article);

    //根据ID搜索文章
    Article getArticleById(String id);

}
