DROP TABLE IF EXISTS `tb_admin_user`;
CREATE TABLE `tb_admin_user` (
  `admin_user_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `login_user_name` VARCHAR(50) NOT NULL COMMENT '管理员登陆名称',
  `login_password` VARCHAR(50) NOT NULL COMMENT '管理员登陆密码',
  `nick_name` VARCHAR(50) NOT NULL COMMENT '管理员显示昵称',
  `locked` TINYINT(4) DEFAULT '0' COMMENT '是否锁定 0未锁定 1已锁定无法登陆',
  PRIMARY KEY (`admin_user_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT  INTO `tb_admin_user`(`admin_user_id`,`login_user_name`,`login_password`,`nick_name`,`locked`) 
VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e','Sun',0);

DROP TABLE IF EXISTS `tb_blog`;
CREATE TABLE `tb_blog` (
  `blog_id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '博客表主键id',
  `blog_title` VARCHAR(200) NOT NULL COMMENT '博客标题',
  `blog_sub_url` VARCHAR(200) NOT NULL COMMENT '博客自定义路径url',
  `blog_cover_image` VARCHAR(200) NOT NULL COMMENT '博客封面图',
  `blog_content` MEDIUMTEXT NOT NULL COMMENT '博客内容',
  `blog_category_id` INT(11) NOT NULL COMMENT '博客分类id',
  `blog_category_name` VARCHAR(50) NOT NULL COMMENT '博客分类(冗余字段)',
  `blog_tags` VARCHAR(200) NOT NULL COMMENT '博客标签',
  `blog_status` TINYINT(4) NOT NULL DEFAULT '0' COMMENT '0-草稿 1-发布',
  `blog_views` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `enable_comment` TINYINT(4) NOT NULL DEFAULT '0' COMMENT '0-允许评论 1-不允许评论',
  `is_deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT '是否删除 0=否 1=是',
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`blog_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT  INTO `tb_blog`(`blog_id`,`blog_title`,`blog_sub_url`,`blog_cover_image`,`blog_content`,`blog_category_id`,`blog_category_name`,`blog_tags`,`blog_status`,`blog_views`,`enable_comment`,`is_deleted`,`create_time`,`update_time`) VALUES 
(1,'我是Sun','about','/admin/dist/img/rand/32.jpg',
'## About me
\n\n我是Sun，一名大学生，一直渴望进步，一直努力活着，为了人生不留遗憾，为了路途充满欢乐，希望自己做的事情可以给自己带来力量。
\n\n总有一天，你会明白：你的委屈要自己消化，你的故事不用逢人就讲起；真正理解你的没有几个，大多人只会站在他们自己的立场，偷看你的笑话；你能做的就是-把秘密藏起来，然后一步一步变得越来越强大。\n\n
## Contact\n\n
- 我的邮箱：2429831566@qq.com
\n- 我的网站：http://SunYublog.site\n\n## 
Quote\n\n- Steve Jobs\n\n> Stay hungry,Stay foolish\n\n- Kahlil Gibran\n\n>The FIRST TIME WHEN I saw her being meek that she might attain height.<br>\nThe SECOND TIME WHEN I saw her limping BEFORE the crippled.<br>\nThe third TIME WHEN she was given TO choose BETWEEN the hard AND the easy, AND she chose the easy.<br>\nThe fourth TIME WHEN she COMMITTED a wrong, AND comforted herself that others also COMMIT wrong.<br>\nThe fifth TIME WHEN she forbore FOR weakness, AND attributed her patience TO strength.<br>\nThe sixth TIME WHEN she despised the ugliness of a face, AND knew NOT that it was ONE of her own masks.<br>\nAND the seventh TIME WHEN she sang a song of praise, AND deemed it a virtue.',
20,'About','沉舟侧畔千帆过,病树前头万木春',
1,219,0,0,'2020-06-12 08:30:00','2020-06-15 08:31:00');



DROP TABLE IF EXISTS `tb_blog_category`;
CREATE TABLE `tb_blog_category` (
  `category_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '分类表主键',
  `category_name` VARCHAR(50) NOT NULL COMMENT '分类的名称',
  `category_icon` VARCHAR(50) NOT NULL COMMENT '分类的图标',
  `category_rank` INT(11) NOT NULL DEFAULT '1' COMMENT '分类的排序值 被使用的越多数值越大',
  `is_deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT '是否删除 0=否 1=是',
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`category_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT  INTO `tb_blog_category`(`category_id`,`category_name`,`category_icon`,`category_rank`,`is_deleted`,`create_time`) VALUES 
(20,'About','/admin/dist/img/category/10.png',8,0,'2020-06-20 00:28:49');
INSERT  INTO `tb_blog_category`(`category_id`,`category_name`,`category_icon`,`category_rank`,`is_deleted`,`create_time`) VALUES 
(21,'日常随笔','/admin/dist/img/category/02.png',8,0,'2020-06-20 00:28:49');
INSERT  INTO `tb_blog_category`(`category_id`,`category_name`,`category_icon`,`category_rank`,`is_deleted`,`create_time`) VALUES 
(22,'SpringBoot','/admin/dist/img/category/06.png',8,0,'2020-06-20 00:28:49');
INSERT  INTO `tb_blog_category`(`category_id`,`category_name`,`category_icon`,`category_rank`,`is_deleted`,`create_time`) VALUES 
(23,'Git','/admin/dist/img/category/10.png',8,0,'2020-06-20 00:28:49');

DROP TABLE IF EXISTS `tb_blog_comment`;
CREATE TABLE `tb_blog_comment` (
  `comment_id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `blog_id` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '关联的blog主键',
  `commentator` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '评论者名称',
  `email` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '评论人的邮箱',
  `website_url` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '网址',
  `comment_body` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '评论内容',
  `comment_create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论提交时间',
  `commentator_ip` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '评论时的ip地址',
  `reply_body` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '回复内容',
  `reply_create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '回复时间',
  `comment_status` TINYINT(4) NOT NULL DEFAULT '0' COMMENT '是否审核通过 0-未审核 1-审核通过',
  `is_deleted` TINYINT(4) DEFAULT '0' COMMENT '是否删除 0-未删除 1-已删除',
  PRIMARY KEY (`comment_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT  INTO `tb_blog_comment`
(`comment_id`,`blog_id`,`commentator`,`email`,`website_url`,`comment_body`,`comment_create_time`,`commentator_ip`,`reply_body`,`reply_create_time`,`comment_status`,`is_deleted`)  
VALUES (26,1,'Sun','2429831566@qq.com','','镇楼','2020-06-23 10:12:19','','','2020-06-23 21:13:31',1,0);


DROP TABLE IF EXISTS `tb_blog_tag`;
CREATE TABLE `tb_blog_tag` (
  `tag_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '标签表主键id',
  `tag_name` VARCHAR(100) NOT NULL COMMENT '标签名称',
  `is_deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT '是否删除 0=否 1=是',
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`tag_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT  INTO `tb_blog_tag`(`tag_id`,`tag_name`,`is_deleted`,`create_time`) VALUES (61,'SpringBoot',0,'2020-06-20 10:55:14');
INSERT  INTO `tb_blog_tag`(`tag_id`,`tag_name`,`is_deleted`,`create_time`) VALUES (62,'Git',0,'2020-06-20 10:55:14');
INSERT  INTO `tb_blog_tag`(`tag_id`,`tag_name`,`is_deleted`,`create_time`) VALUES (63,'You are my sunshine',0,'2020-06-20 10:55:14');

DROP TABLE IF EXISTS `tb_blog_tag_relation`;
CREATE TABLE `tb_blog_tag_relation` (
  `relation_id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '关系表id',
  `blog_id` BIGINT(20) NOT NULL COMMENT '博客id',
  `tag_id` INT(11) NOT NULL COMMENT '标签id',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`relation_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT  INTO `tb_blog_tag_relation`(`relation_id`,`blog_id`,`tag_id`,`create_time`) VALUES (101,1,63,'2020-06-13 11:45:42');


DROP TABLE IF EXISTS `tb_config`;
CREATE TABLE `tb_config` (
  `config_name` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '配置项的名称',
  `config_value` VARCHAR(200) NOT NULL DEFAULT '' COMMENT '配置项的值',
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`config_name`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT  INTO `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) VALUES 
('footerAbout','personal blog. have fun.','2020-06-17 18:57:52','2020-06-17 18:57:52');
INSERT  INTO `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) VALUES 
('footerCopyRight','2020 Sun','2020-06-17 18:57:52','2020-06-17 18:57:52');
INSERT  INTO `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) VALUES 
('footerICP','浙ICP备17008806号-3','2020-06-17 18:57:52','2020-06-17 18:57:52');
INSERT  INTO `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) VALUES 
('footerPoweredBy','https://github.com/studyerer','2020-06-17 18:57:52','2020-06-17 18:57:52');
INSERT  INTO `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) VALUES 
('footerPoweredByURL','https://github.com/studyerer','2020-06-17 18:57:52','2020-06-17 18:57:52');
INSERT  INTO `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) VALUES 
('websiteDescription','personal blog是SpringBoot2+Thymeleaf+Mybatis建造的个人博客网站.SpringBoot实战博客源码.个人博客搭建','2020-06-17 18:57:52','2020-06-17 18:57:52');
INSERT  INTO `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) VALUES 
('websiteIcon','/admin/dist/img/favicon.png','2020-06-17 18:57:52','2020-06-17 18:57:52');
INSERT  INTO `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) VALUES 
('websiteLogo','/admin/dist/img/logo2.png','2020-06-17 18:57:52','2020-06-17 18:57:52');
INSERT  INTO `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) VALUES 
('websiteName','personal blog','2020-06-17 18:57:52','2020-06-17 18:57:52');
INSERT  INTO `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) VALUES 
('yourAvatar','/admin/dist/img/13.png','2020-06-17 18:57:52','2020-06-17 18:57:52');
INSERT  INTO `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) VALUES 
('yourEmail','2429831566@qq.com','2020-06-17 18:57:52','2020-06-17 18:57:52');
INSERT  INTO `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) VALUES 
('yourName','Sun','2020-06-17 18:57:52','2020-06-17 18:57:52');


DROP TABLE IF EXISTS `tb_link`;
CREATE TABLE `tb_link` (
  `link_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '友链表主键id',
  `link_type` TINYINT(4) NOT NULL DEFAULT '0' COMMENT '友链类别 0-友链 1-推荐 2-个人网站',
  `link_name` VARCHAR(50) NOT NULL COMMENT '网站名称',
  `link_url` VARCHAR(100) NOT NULL COMMENT '网站链接',
  `link_description` VARCHAR(100) NOT NULL COMMENT '网站描述',
  `link_rank` INT(11) NOT NULL DEFAULT '0' COMMENT '用于列表排序',
  `is_deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT '是否删除 0-未删除 1-已删除',
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`link_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT  INTO `tb_link`(`link_id`,`link_type`,`link_name`,`link_url`,`link_description`,`link_rank`,`is_deleted`,`create_time`) VALUES 
(201,1,'Sun的CSDN','https://blog.csdn.net/emmastone','我的CSDN账户',10,0,'2020-06-17 18:57:52');
INSERT  INTO `tb_link`(`link_id`,`link_type`,`link_name`,`link_url`,`link_description`,`link_rank`,`is_deleted`,`create_time`) VALUES 
(202,2,'Sun的github','https://github.com/studyerer','我的github账户',10,0,'2020-06-17 18:57:52');
