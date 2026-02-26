-- 初始测试数据
USE sampledb;

INSERT INTO t_user (user_name, password, credits) VALUES ('admin', '123456', 0)
ON DUPLICATE KEY UPDATE user_name = user_name;
