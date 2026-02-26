-- 证券期货分析平台 - 数据库初始化脚本
-- 使用方式: mysql -u root -p < schema.sql

CREATE DATABASE IF NOT EXISTS sampledb DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE sampledb;

-- 用户表
CREATE TABLE IF NOT EXISTS t_user (
    user_id       INT          AUTO_INCREMENT PRIMARY KEY,
    user_name     VARCHAR(30)  NOT NULL COMMENT '用户名',
    password      VARCHAR(32)  NOT NULL COMMENT '密码',
    credits       INT          DEFAULT 0 COMMENT '积分',
    last_visit    DATETIME              COMMENT '最后登录时间',
    last_ip       VARCHAR(23)           COMMENT '最后登录IP',
    UNIQUE KEY uk_user_name (user_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- 登录日志表
CREATE TABLE IF NOT EXISTS t_login_log (
    login_log_id  INT          AUTO_INCREMENT PRIMARY KEY,
    user_id       INT          NOT NULL COMMENT '用户ID',
    ip            VARCHAR(23)           COMMENT '登录IP',
    login_datetime DATETIME             COMMENT '登录时间',
    KEY idx_user_id (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录日志表';
