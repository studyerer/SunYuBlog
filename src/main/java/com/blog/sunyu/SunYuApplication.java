package com.blog.sunyu;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.blog.sunyu.dao")
@SpringBootApplication
public class SunYuApplication {

    public static void main(String[] args) {
        SpringApplication.run(SunYuApplication.class, args);
    }

}
