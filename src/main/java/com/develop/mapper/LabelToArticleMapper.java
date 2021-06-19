package com.develop.mapper;

import com.develop.pojo.LabelToArticle;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface LabelToArticleMapper {
    //查询标签id
    List<LabelToArticle> queryLabelAll(@Param("article_id") String article_id);

    //查询文章id
    List<LabelToArticle> queryArticleAll(String label_id);

    //查询所有
    List<LabelToArticle> queryAll();

    //删除标签id
    int deleteLabelAll(@Param("article_id") String article_id);

    //删除文章id
    int deleteArticleAll(@Param("label_id") String label_id);

    //添加标签
    int insertLabel(List<LabelToArticle> list);

}
