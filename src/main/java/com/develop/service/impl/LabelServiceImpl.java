package com.develop.service.impl;

import com.develop.mapper.LabelMapper;
import com.develop.pojo.Article;
import com.develop.pojo.Label;
import com.develop.pojo.Types;
import com.develop.service.LabelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class LabelServiceImpl implements LabelService {

    @Autowired
    private LabelMapper labelMapper;


    @Override
    public List<Label> getArticleToLabel(String id) {
        return labelMapper.getArticleToLabel(id);
    }

    @Override
    public List<Label> getLabelAll() {
        return labelMapper.getLabelAll();
    }

    @Override
    public List<Label> getLabelLimit(Map<String,Object> map) {
        return labelMapper.getLabelLimit(map);
    }

    @Override
    public int insertLabel(Label label) {
        return labelMapper.insertLabel(label);
    }

    public int insertLabels(String articleId,String name){
        Label label = new Label();


        return insertLabel(label);
    }




    public List<Label> queryLabelLimit(int limit,String field){
        HashMap<String, Object> map = new HashMap<>();
        map.put("limit",limit);
        map.put("field",field);
        return getLabelLimit(map);
    }
}
