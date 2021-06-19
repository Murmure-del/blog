package com.develop.service;

import com.develop.mapper.LabelToArticleMapper;
import com.develop.pojo.LabelToArticle;

import java.util.List;

public interface LabelToArticleService {

    //查询标签id
    List<LabelToArticle> queryLabelAll(String article_id);

    //查询文章id
    List<LabelToArticle> queryArticleAll(String label_id);

    //查询所有
    List<LabelToArticle> queryAll();

    //删除标签id
    int deleteLabelAll(String article_id);

    //删除文章id
    int deleteArticleAll(String label_id);

    //添加标签
    int insertLabel(List<LabelToArticle> list);
}
