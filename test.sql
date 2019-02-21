﻿/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2019-02-20 22:09:09
*/

drop database test; 
create database test;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for two_house_analysis_info
-- ----------------------------
DROP TABLE IF EXISTS `two_house_analysis_info`;
CREATE TABLE `two_house_analysis_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city_id` bigint(20) NOT NULL COMMENT '城市',
  `district` varchar(100) NOT NULL COMMENT '区县',
  `coummunity_id` bigint(20) NOT NULL COMMENT '小区id',
  `coummunity` varchar(255) NOT NULL COMMENT '小区名称',
  `address` varchar(255) DEFAULT NULL COMMENT '小区地址',
  `sale_date` date DEFAULT NULL COMMENT '上架时间',
  `analysis_date` date DEFAULT NULL COMMENT '统计时间（月份）',
  `sale_amount` decimal(10,0) DEFAULT NULL COMMENT '每平米售价（元）',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56020 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for two_house_real_analysis
-- ----------------------------
DROP TABLE IF EXISTS `two_house_real_analysis`;
CREATE TABLE `two_house_real_analysis` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市id(上海=1，苏州=2，武汉=3)',
  `district` varchar(50) NOT NULL COMMENT '区县',
  `community` varchar(50) NOT NULL COMMENT '小区',
  `wait_sale_count` int(11) DEFAULT '0' COMMENT '挂单数',
  `trade_count` int(11) DEFAULT '0' COMMENT '成交数',
  `trade_total_amount` decimal(10,0) DEFAULT '0' COMMENT '成交总价',
  `trade_avg_price` decimal(10,0) DEFAULT '0' COMMENT '成交均价',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_district_community` (`district`,`community`) USING BTREE,
  KEY `community_pk` (`community`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for two_house_sale_info
-- ----------------------------
DROP TABLE IF EXISTS `two_house_sale_info`;
CREATE TABLE `two_house_sale_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `house_id` bigint(20) NOT NULL,
  `city_id` bigint(20) NOT NULL COMMENT '城市id',
  `district` varchar(50) NOT NULL COMMENT '区县',
  `logo` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '图片',
  `sale_amount` decimal(10,0) DEFAULT NULL COMMENT '售价/单位',
  `unit` varchar(255) DEFAULT NULL COMMENT '价格单位规格',
  `community` varchar(80) DEFAULT NULL COMMENT '小区/楼盘',
  `house_year` int(10) DEFAULT NULL COMMENT '建房年份',
  `size` double DEFAULT NULL,
  `total_price` decimal(10,0) DEFAULT NULL COMMENT '总价',
  `style` varchar(50) DEFAULT NULL COMMENT '格局（2室一厅）',
  `up_sale_time` date DEFAULT NULL COMMENT '上架时间（挂牌）',
  `tag` varchar(200) DEFAULT NULL COMMENT '特色',
  `sale_title` varchar(255) DEFAULT NULL COMMENT '销售标题',
  `direction` varchar(20) DEFAULT NULL COMMENT '朝向（南）',
  `house_url` varchar(255) DEFAULT NULL COMMENT '房屋html页面',
  `get_time` datetime DEFAULT NULL COMMENT '拉取时间',
  `foor` varchar(50) DEFAULT NULL COMMENT '层高/层级',
  PRIMARY KEY (`id`),
  KEY `city_str_commuity` (`city_id`,`district`,`community`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2618354 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for two_house_trade_info
-- ----------------------------
DROP TABLE IF EXISTS `two_house_trade_info`;
CREATE TABLE `two_house_trade_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city_id` bigint(20) NOT NULL,
  `district` varchar(255) NOT NULL,
  `house_id` bigint(20) NOT NULL,
  `coummunity_id` bigint(20) NOT NULL COMMENT '小区编号',
  `coummunity` varchar(255) DEFAULT NULL COMMENT '小区',
  `style` varchar(30) DEFAULT NULL COMMENT '户型',
  `size` double DEFAULT NULL COMMENT '面积大小',
  `real_amount` decimal(10,0) DEFAULT NULL COMMENT '成交总金额',
  `avg_amount` decimal(10,0) DEFAULT NULL COMMENT '成交均价',
  `sale_price` decimal(10,0) DEFAULT NULL COMMENT '挂牌价格',
  `sale_days` int(11) DEFAULT NULL COMMENT '耗时天数',
  `trade_date` date DEFAULT NULL COMMENT '成交时间',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_houseid_city` (`city_id`,`coummunity_id`,`house_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=138978 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_wm_xauth_bind
-- ----------------------------
DROP TABLE IF EXISTS `t_wm_xauth_bind`;
CREATE TABLE `t_wm_xauth_bind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xauth_user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `xwechatid` varchar(100) NOT NULL DEFAULT '',
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `public_account_source` varchar(100) NOT NULL DEFAULT '' COMMENT '?',
  `wechatid` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '1',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `xauth_user_id` (`xauth_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_wm_xauth_user
-- ----------------------------
DROP TABLE IF EXISTS `t_wm_xauth_user`;
CREATE TABLE `t_wm_xauth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '1',
  `public_account_source` varchar(100) NOT NULL DEFAULT '' COMMENT '1',
  `xwechatid` varchar(100) NOT NULL DEFAULT '' COMMENT '1',
  `nick_name` varchar(100) NOT NULL DEFAULT '' COMMENT '1',
  `head_photo` varchar(255) NOT NULL DEFAULT '' COMMENT '1',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '1',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '1',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '1',
  PRIMARY KEY (`id`),
  KEY `xwechatid` (`xwechatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='2';

-- ----------------------------
-- Table structure for user_employee_1
-- ----------------------------
DROP TABLE IF EXISTS `user_employee_1`;
CREATE TABLE `user_employee_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
