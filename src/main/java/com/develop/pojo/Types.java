package com.develop.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Types {
    private String id;
    private String name;
    private String content;
    private int blog_counts;
}
