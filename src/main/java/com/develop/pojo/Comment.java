package com.develop.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
    private String id;
    private String reply_id;
    private String name;
    private String content;
    private Date comment_date;
    private int like_counts;
    private int reply_counts;
    private String article_id;
}
