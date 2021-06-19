package com.develop;

import com.develop.mapper.LabelToArticleMapper;
import com.develop.pojo.*;
import com.develop.service.impl.ArticleServiceImpl;
import com.develop.service.impl.LabelToArticleServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@SpringBootTest
class BlogApplicationTests {

    @Autowired
    private ArticleServiceImpl articleService;


    @Autowired
    private LabelToArticleServiceImpl labelToArticleService;

//    @Test
//    void contextLoads() throws SQLException {
//
//
//        articleService.insertArticle(new Article(
//                "5","C++","Spring mvc","1drgsfdgfd",
//                "photo",10,new Date(),new Date() ,1,
//                1,false,false,false,
//                false,false,false,
//                new Types("1","mingz","sdfs",1),
//                new User("1","name","ddd",new Date(),0)));
//    }

    @Test
    public void test(){
        ArrayList<LabelToArticle> list = new ArrayList<>();
        list.add(new LabelToArticle("2","1"));
        list.add(new LabelToArticle("2","2"));
        list.add(new LabelToArticle("2","3"));
        labelToArticleService.insertLabel(list);
    }

}
