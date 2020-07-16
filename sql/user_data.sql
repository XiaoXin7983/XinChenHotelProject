
USE market;
DROP TABLE IF EXISTS t_user;
CREATE TABLE t_user(
	id INT PRIMARY KEY AUTO_INCREMENT	-- 用户id
	, userName VARCHAR(30)			-- 用户账号
	, PASSWORD VARCHAR(30)			-- 用户密码
	, realName VARCHAR(20)			-- 用户姓名
	, gender TINYINT			-- 用户性别
	, birthday DATE 			-- 用户生日
	, phone VARCHAR(20)			-- 用户电话
	, address VARCHAR(200)			-- 用户地址
	, roleId INT 				-- 用户角色
);

INSERT INTO t_user VALUES(1, 'admin', '0000', '独孤求败', 1, 
    '1980-1-1', '19414141414', '襄阳城外', 0);
INSERT INTO t_user VALUES(2, 'apple', '0000', '东方不败', 0, 
    '1970-1-1', '10054400544', '黑木崖上', 1);
INSERT INTO t_user VALUES(3, 'cherry', '0000', '萧峰', 1, 
    '1990-1-1', '14494444944', '大草原上', 2);
INSERT INTO t_user VALUES(4, 'orange', '0000', '段誉', 1, 
    '2000-1-1', '18666669999', '天龙寺里', 3);
    
/*
	select * from t_user;
*/
  
