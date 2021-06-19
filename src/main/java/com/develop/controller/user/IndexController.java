package com.develop.controller.user;

import com.develop.pojo.Article;
import com.develop.pojo.Label;
import com.develop.pojo.Types;
import com.develop.service.impl.ArticleServiceImpl;
import com.develop.service.impl.LabelServiceImpl;
import com.develop.service.impl.TypesServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private ArticleServiceImpl articleService;

    @Autowired
    private TypesServiceImpl typesService;

    @Autowired
    private LabelServiceImpl labelService;

    @RequestMapping("/types")
    public String types(){
        return "types";
    }

    @RequestMapping("/index")
    public String index(Model model){
        List<Article> articleAll = articleService.queryArticleLimit(10,"views");

        System.out.println("articleAll==============>"+articleAll);
        List<Types> types = typesService.queryTypeLimit(5,"blog_counts");
        List<Label> labels = labelService.queryLabelLimit(5,"blog_counts");
        //所有分类
        model.addAttribute("types",types);
        //所有标签
        model.addAttribute("labels",labels);
        //所有文章
        model.addAttribute("articles",articleAll);
        model.addAttribute("articleLen",articleAll.size());
        return "index";
    }


}
