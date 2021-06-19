package com.develop.service.impl;

import com.develop.mapper.ArticleMapper;
import com.develop.mapper.LabelToArticleMapper;
import com.develop.pojo.Article;
import com.develop.pojo.Comment;
import com.develop.pojo.LabelToArticle;
import com.develop.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

import static com.develop.utils.UUIDUtil.getUUID;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Autowired
    private LabelToArticleServiceImpl labelToArticleService;

    @Override
    public List<Article> getArticleAll(String types) {
        return null;
    }

    @Override
    public List<Article> getArticleLimit(Map<String, Object> map) {
        return articleMapper.getArticleLimit(map);
    }

    public List<Article> queryArticleLimit(int limit, String field){
        Map<String, Object> map = new HashMap<>();
        map.put("limit",limit);
        map.put("field",field);
        return getArticleLimit(map);
    }

    @Transactional
    @Override
    public int deleteById(String id) {
        int deleteLabel = labelToArticleService.deleteLabelAll(id);
        int deletearticle = articleMapper.deleteById(id);
        System.out.println(deletearticle+"\t"+deleteLabel);
        if (deleteLabel!=0 && deletearticle!=0)throw new RuntimeException("删除博客失败");
        return 1;
    }

    @Override
    public int updateArticle(Article article) {
        return articleMapper.updateArticle(article);
    }

    @Override
    public int insertArticle(Article article) {
        return articleMapper.insertArticle(article);
    }


    //添加博客
    //设置事务回滚
    @Transactional
    public boolean saveBlog(Article article,String labelID){
        Date tempTime = new Date();
        Article articleById = articleMapper.getArticleById(article.getId());
        if (articleById==null){
            //生成博客id    设置博客ID
            article.setId(getUUID());
            //设置博客创建时间
            article.setCreate_time(tempTime);
            //添加博客
            int insertArticle = insertArticle(article);
            //添加博客与标签之间的关系
            int saveLabelToArticle = labelToArticleService.saveLabelToArticle(article.getId(), labelID);
            if (insertArticle!=0 && saveLabelToArticle!=0)throw new RuntimeException("添加博客失败");
            return true;
        }else {
            //获取博客id
            String id = article.getId();
            //设置博客更新时间
            article.setUpdate_time(tempTime);
            //更新博客
            int update = updateArticle(article);
            //删除该博客与标签对应的关系
            int delete = labelToArticleService.deleteLabelAll(id);
            //添加该博客与标签的对应关系
            int save = labelToArticleService.saveLabelToArticle(id, labelID);
            System.out.println(update+"\t"+delete+"\t"+save);
            if (update==0 && save==0 && delete==0)throw new RuntimeException("修改博客失败");
            return true;
        }

    }


    @Override
    public Article getArticleById(String id) {
        return articleMapper.getArticleById(id);
    }
}
