package com.develop.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Article {
    private String id;
    private String title;
    private String content;
    private String description;
    private String photo;
    private Integer views;
    private Date create_time;
    private Date update_time;
    private Integer like_counts;
    private Integer comment_counts;
    private boolean flag;
    private boolean appreciate;
    private boolean share_statement;
    private boolean comment_abled;
    private boolean publishd;
    private boolean recommend;
    private Types type;
    private User user;
}
