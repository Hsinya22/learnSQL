-- 哪些指令可以重複執行
-- 不行重複執行
CREATE DATABASE Apple;
CREATE TABLE 自己決定的資料"表"名稱 (
  `欄位名稱` 資料型態,
  `欄位名稱` 資料型態,
  ...
) 
-- 可重複執行
SHOW CREATE TABLE shop





-- 產生資料庫的語法結構
CREATE DATABASE 自己決定的資料"庫"名稱 ;

-- 產生資料表的語法結構
CREATE TABLE 自己決定的資料"表"名稱 (
  `欄位名稱` 資料型態,
  `欄位名稱` 資料型態,
  ...
) 

CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);

透過語法新增資料: CREATE DATABASE LAB ;
透過介面建立資料表:直接用網頁進行操作


透過 指令 新增"飲料店鋪"資料表，先在VScode編輯sql指令，再貼到網頁去執行
-- 這裡在討論手打的SQL指令和介面產生的SQL指令的差異
-- 手打的SQL指令
CREATE TABLE shop (
    shop_id CHAR(1),
    shop_name VARCHAR(20),
    shop_address VARCHAR(20),
    shop_phone CHAR(10),
    shop_capital INT
)

-- 這是從PRIMARY KEY 複製來，有包含PRIMARY KEY的指令
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID)
);



在網頁的資料庫裡的SQL，填入 SHOW CREATE TABLE shop，查詢剛剛新增的sql指令，是以下的樣子
-- 介面產生的SQL指令
CREATE TABLE `shop` (
  `shop_id` char(1) DEFAULT NULL,
  `shop_name` varchar(20) DEFAULT NULL,
  `shop_address` varchar(20) DEFAULT NULL,
  `shop_phone` char(10) DEFAULT NULL,
  `shop_capital` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci


CREATE TABLE `shop_emp` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(20) NOT NULL,
  `emp_phone` char(10) NOT NULL,
  `shop_id` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci