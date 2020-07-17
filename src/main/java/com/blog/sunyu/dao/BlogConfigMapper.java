package com.blog.sunyu.dao;


import com.blog.sunyu.entity.BlogConfig;
import java.util.List;

public interface BlogConfigMapper {
    List<BlogConfig> selectAll();

    BlogConfig selectByPrimaryKey(String configName);

    int updateByPrimaryKeySelective(BlogConfig record);

}