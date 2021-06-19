package com.develop.utils;

import java.util.UUID;

public class UUIDUtil {
    /**
     * 去掉-的UUID
     *
     * @return 32位的字符串
     */
    public static String getUUID() {
        return UUID.randomUUID().toString().replace("-", "");
    }

}