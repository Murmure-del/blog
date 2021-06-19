package com.develop.controller.user.admin;

import com.develop.pojo.Article;
import com.develop.pojo.Label;
import com.develop.pojo.Types;
import com.develop.service.impl.ArticleServiceImpl;
import com.develop.service.impl.LabelServiceImpl;
import com.develop.service.impl.LabelToArticleServiceImpl;
import com.develop.service.impl.TypesServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

import static com.develop.utils.UUIDUtil.getUUID;

@Controller
@RequestMapping("/admin")
public class BlogController {

    @Autowired
    private ArticleServiceImpl articleService;

    @Autowired
    private TypesServiceImpl typesService;

    @Autowired
    private LabelServiceImpl labelService;

    @Autowired
    private LabelToArticleServiceImpl labelToArticleService;

    //进入后台index页面
    @RequestMapping("/blogs")
    public String blogs(Model model){
        List<Types> types = typesService.queryAll();
        model.addAttribute("types",types);
        List<Article> articles = articleService.queryArticleLimit(10,"views");
        model.addAttribute("articles",articles);
        return "/admin/blogs";
    }

    //进入添加文章
    @GetMapping("/blogs/input")
    public String blogInput(Model model){

        getTypesAndLabels(model);
        //博客文章
        model.addAttribute("article",new Article());
        return "/admin/blogs-input";
    }

    //添加文章
    @PostMapping("/blog/input")
    public String saveBlog(Article article, String labelID, RedirectAttributes attributes){
        System.out.println("article=============>"+article);
        //添加文章
        boolean flag = articleService.saveBlog(article,labelID);
        if (flag) {
            attributes.addFlashAttribute("message", "操作成功");
        } else {
            attributes.addFlashAttribute("message", "操作失败");
        }
        return "redirect:/admin/blogs";
    }



    //进入文章编辑页面
    @GetMapping("/blogs/{id}/input")
    public String edits(@PathVariable("id") String id,Model model){
        getTypesAndLabels(model);
        Article article = articleService.getArticleById(id);
        System.out.println(article.getId());
        //根据文章ID将标签ID转为字符串，初始化编辑页面
        StringBuffer labelID = labelToArticleService.toStringLabel(article.getId());
        //获取所有标签
        model.addAttribute("labelID",labelID);
        model.addAttribute("article",article);
        return "/admin/blogs-input";
    }

    //文章删除页面
    @GetMapping("/blogs/{id}/delete")
    public String delete(@PathVariable("id") String id){
        System.out.println("delete");
        int article = articleService.deleteById(id);
        return "/admin/blogs";
    }

    public void getTypesAndLabels(Model model){
        //标签
        model.addAttribute("labels",labelService.getLabelAll());

        //分类
        model.addAttribute("types",typesService.queryAll());
    }
}
