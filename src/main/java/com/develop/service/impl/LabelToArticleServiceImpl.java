package com.develop.service.impl;

import com.develop.mapper.LabelToArticleMapper;
import com.develop.pojo.Label;
import com.develop.pojo.LabelToArticle;
import com.develop.service.LabelToArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class LabelToArticleServiceImpl implements LabelToArticleService {

    @Autowired
    private LabelToArticleMapper labelToArticleMapper;

    //将获取的标签id转化为一个字符串
    public StringBuffer toStringLabel(String id){
        List<LabelToArticle> LabelToArticles = queryLabelAll(id);
        if (LabelToArticles==null)return null ;
        StringBuffer sb = new StringBuffer();
        for (LabelToArticle labelToArticle : LabelToArticles) {
            sb.append(labelToArticle.getLabel_id()).append(",");
        }
        return sb;
    }

    @Override
    public List<LabelToArticle> queryLabelAll(String article_id) {
        return labelToArticleMapper.queryLabelAll(article_id);
    }

    @Override
    public List<LabelToArticle> queryArticleAll(String label_id) {
        return labelToArticleMapper.queryArticleAll(label_id);
    }

    @Override
    public List<LabelToArticle> queryAll() {
        return labelToArticleMapper.queryAll();
    }

    @Override
    public int deleteLabelAll(String article_id) {
        return labelToArticleMapper.deleteLabelAll(article_id);
    }

    @Override
    public int deleteArticleAll(String label_id) {
        return labelToArticleMapper.deleteArticleAll(label_id);
    }

    @Override
    public int insertLabel(List<LabelToArticle> list) {
        return labelToArticleMapper.insertLabel(list);
    }

    public int saveLabelToArticle(String articleID,String labelID){
        ArrayList<LabelToArticle> list = new ArrayList<>();
        String[] split = labelID.split(",");
        for (String s : split) {
            if (!"".equals(s)){
                list.add(new LabelToArticle(articleID,s));
            }
        }
        return insertLabel(list);
    }

}
