package com.blog.sunyu;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@MapperScan("com.blog.sunyu.dao")
@SpringBootApplication
public class SunYuApplication
//        extends SpringBootServletInitializer
{

//    @Override
//    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
//        return builder.sources(SunYuApplication.class);
//    }

    public static void main(String[] args) {
        SpringApplication.run(SunYuApplication.class, args);
    }

}
