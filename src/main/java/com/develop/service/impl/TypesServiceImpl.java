package com.develop.service.impl;

import com.develop.mapper.TypesMapper;
import com.develop.pojo.Article;
import com.develop.pojo.Types;
import com.develop.service.TypesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TypesServiceImpl implements TypesService {

    @Autowired
    private TypesMapper typesMapper;

    @Override
    public int insertTypes(Types types) {
        return typesMapper.insertTypes(types);
    }

    @Override
    public int deleteTypes(String id) {
        return typesMapper.deleteTypes(id);
    }

    @Override
    public Types queryTypes(String id) {
        return typesMapper.queryTypes(id);
    }

    @Override
    public List<Types> queryAll() {
        return typesMapper.queryAll();
    }

    @Override
    public int updateTypes(Types types) {
        return typesMapper.updateTypes(types);
    }

    @Override
    public List<Types> getTypeLimit(Map<String, Object> map) {
        return typesMapper.getTypeLimit(map);
    }

    public List<Types> queryTypeLimit(int limit,String field){
        HashMap<String, Object> map = new HashMap<>();
        map.put("limit",limit);
        map.put("field",field);
        return getTypeLimit(map);
    }
}
