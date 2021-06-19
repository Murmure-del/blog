package com.develop.controller.user.admin;

import com.alibaba.fastjson.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import static com.develop.utils.UUIDUtil.getUUID;

@RestController
@RequestMapping("/article")
public class UploadFileImage {
    //博客图片上传问题
    @RequestMapping("/file/upload")
    public JSONObject fileUpload(@RequestParam(value = "editormd-image-file", required = true) MultipartFile file, HttpServletRequest request) throws IOException, IOException {
        //上传路径保存设置

        //获得SpringBoot当前项目的路径：System.getProperty("user.dir")
        String path = System.getProperty("user.dir")+"/upload/";

        //按照月份进行分类：
        Calendar instance = Calendar.getInstance();
        String year = (instance.get(Calendar.YEAR) )+"";
        String month = (instance.get(Calendar.MONTH) + 1)+"";
        String day = (instance.get(Calendar.DAY_OF_MONTH))+"";
        System.out.println(year+"\t"+month+"\t"+day);

        path = path+"article/"+year+"/"+month+"/"+day;

        File realPath = new File(path);
        if (!realPath.exists()){
            realPath.mkdirs();
        }

        //上传文件地址
        System.out.println("上传文件保存地址："+realPath);

        //解决文件名字问题：我们使用uuid;
        String filename = "image-"+getUUID();
        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
        String name = file.getName();

        System.out.println("name=====>"+name);
        file.transferTo(new File(realPath +"/"+ filename));

        //给editormd进行回调
        JSONObject res = new JSONObject();
        res.put("url","/upload/"+year+"/"+month+"/"+day+"/"+ filename);
        res.put("success", 1);
        res.put("message", "upload success!");

        return res;
    }

    //博客首图上传问题
    /*
     * 采用file.Transto 来保存上传的文件
     */
    @RequestMapping("/photo/upload")
    public JSONObject  fileUploadPhoto(@RequestParam("files") MultipartFile[]  files, HttpServletRequest request) throws IOException {

        //上传路径保存设置
//        String path = request.getServletContext().getRealPath("/upload/firstImage/")+request.getSession().getAttribute("username");
        String path = System.getProperty("user.dir")+"/upload/firstImage/"+request.getSession().getAttribute("username");

        File realPath = new File(path);
        if (!realPath.exists()){
            realPath.mkdirs();
        }
        //上传文件地址
        System.out.println("上传文件保存地址："+realPath);
        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
        ArrayList<String> filesNames = new ArrayList<>();
        for (MultipartFile file : files) {
            file.transferTo(new File(realPath +"/"+ file.getOriginalFilename()));
            filesNames.add("/upload/temp/"+file.getOriginalFilename());
            System.out.println(file.getOriginalFilename());
        }
        JSONObject json = new JSONObject();
        json.put("path",filesNames);
        return json;
    }
}
