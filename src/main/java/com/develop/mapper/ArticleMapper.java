package com.develop.mapper;

import com.develop.pojo.Article;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface ArticleMapper {

    //根据分类查询所有文章
    List<Article> getArticleAll(String types);

    //查询所有文章根据自定义字段排序
    List<Article> getArticleLimit(Map<String,Object> map);

    //删除文章
    int deleteById(@Param("id") String id);

    //修改文章
    int updateArticle(Article article);

    //添加文章
    int insertArticle(Article article);

    //根据ID搜索文章
    Article getArticleById(@Param("id") String id);

    //根据文章标题，或者分类模糊搜索文章
//    List<Article> getArticleLike(String name);
}
