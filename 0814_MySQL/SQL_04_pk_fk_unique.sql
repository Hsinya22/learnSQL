-- MySQL PRIMARY KEY Constraint
-- https://www.w3schools.com/MySQL/mysql_primarykey.asp
-- 
-- MySQL FOREIGN KEY Constraint
-- https://www.w3schools.com/MySQL/mysql_foreignkey.asp
-- 
-- MySQL UNIQUE Constraint
-- https://www.w3schools.com/MySQL/mysql_unique.asp
-- 
-- MySQL AUTO INCREMENT Field
-- https://www.w3schools.com/MySQL/mysql_autoincrement.asp


-- Q:每一張資料表都一定要有PK嗎?
-- A:對 (Y)

-- Q:每一張資料表都一定要有FK嗎?
-- A:不一定 (N)

ALTER TABLE shop ADD PRIMARY KEY (shop_id);

-- 10. 定義 primary key 主索引鍵
--
-- 目標：設定 shop_employee 和 shop 這兩張資料表的 primary key 
--
-- 方法：
--     a. 介面: 資料表> 結構> 某欄位列> 動作> 更多> 主鍵
-- 
--     b. 介面: 資料表> 結構> 勾選欄位> 表格下方> 主鍵
-- 
--     c. 語法: 參考上方連結 MySQL PRIMARY KEY Constraint

-- 因為已經有資料表了，所以這樣不行
-- **千萬** 不要有那就先刪除的想法
-- 如果資料表已經有資料，那資料會全部不見
CREATE TABLE shop (
    shop_id CHAR(1),
    shop_name VARCHAR(20),
    shop_address VARCHAR(20),
    shop_phone CHAR(10),
    shop_capital INT,
    PRIMARY KEY (shop_id)
)

-- 20. 定義 foreign key 外部索引鍵
--
-- 目標：設定 shop_employee 資料表的 foreign key 
--
-- 方法：
--     a. 介面: 資料表> 結構> 表格上方> 關聯檢視
--     
--     b. 語法：參考上方連結 MySQL FOREIGN KEY Constraint

ALTER TABLE shop_emp ADD FOREIGN KEY (shop_id) REFERENCES shop(shop_id)





-- 30. 不允許出現重複值 UNIQUE
-- 
--     a. 介面: 資料表> 結構> 某欄位列> 動作> 更多> 獨一|唯一
--     
--     b. 介面: 資料表> 結構> 勾選欄位> 表格下方> 獨一|唯一
-- 
--     c. 語法: 參考上方連結 MySQL UNIQUE Constraint
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    UNIQUE (ID)
);

-- 新增UNIQUE到現有資料表=>選擇庫 裡面的SQL =>
ALTER TABLE Persons
ADD UNIQUE (ID);


-- 到SQL 檢視剛剛新增的UNIQUE

CREATE TABLE `shop_emp` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(20) NOT NULL,
  `emp_phone` char(10) NOT NULL,
  `shop_id` char(1) NOT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `emp_phone` (`emp_phone`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `shop_emp_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
