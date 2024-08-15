

-- MySQL UPDATE Statement
-- https://www.w3schools.com/MySQL/mysql_update.asp
-- 
-- MySQL DELETE Statement
-- https://www.w3schools.com/MySQL/mysql_delete.asp
-- 
-- MySQL DROP TABLE Statement
-- https://www.w3schools.com/MySQL/mysql_drop_table.asp



--10. 透過語法建立資料表
--	  確認所選取的資料庫為 Lab 後，貼上底下程式碼執行

    create table lab07
    (
        CategoryID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
        AvgPrice DECIMAL(5,2) NULL,
        Memo varchar(50) NULL,
        UpdateDate datetime NULL
    );

    insert into lab07 (AvgPrice) values (37.9791);
    insert into lab07 (AvgPrice) values (23.0625);
    insert into lab07 (AvgPrice) values (25.16);
    insert into lab07 (AvgPrice) values (28.73);
    insert into lab07 (AvgPrice) values (20.25);
    insert into lab07 (AvgPrice) values (54.0066);
    insert into lab07 (AvgPrice) values (32.37);
    insert into lab07 (AvgPrice) values (20.6825);

    insert into lab07 (AvgPrice) values (12345); --999.99
    insert into lab07 (AvgPrice) values (1234.5); --999.99
    insert into lab07 (AvgPrice) values (123.45); --123.45
    insert into lab07 (AvgPrice) values (12.345); --12.35
    select * from lab07;    
--  DECIMAL(5,2)
 5==> 一共有5個數字
 2==> 小數點後面有2個數字

--20. 更新異動日期欄位 UpdateDate，執行後有多少資料被異動了？
UPDATE lab07 SET UpdateDate = now()
-- 結果: 全部，因為沒加where講條件


--21. 更新 類別編號 為1號的平均單價為 10 元
UPDATE lab07 SET AvgPrice = 10
WHERE CategoryID = 1

--29. delete 特定資料
DELETE FROM table_name WHERE condition;

-- 10筆資料都會不見
DELETE FROM lab07


--30. 執行 delete 資料表指令 ，然後再次重新新增資料
--	   觀察流水號的變化
INSERT INTO lab07 (AvgPrice) VALUES (1);
-- 流水號從11接續開始


--31. 執行 truncate 資料表指令 ，然後再次重新新增資料
--	   觀察流水號的變化

-- 語法
TRUNCATE TABLE table_name;

-- 實測:資料全不見
TRUNCATE TABLE lab07;

-- 實測:　編號會重編
INSERT 


--32. 執行 drop 資料表指令 ，然後再次重新新增資料
--	  觀察流水號的變化




Q:報到第一天 INSERT
Q:找值日生 SELECT
Q:小專改題目 UPDATE
Q:學校畢業 - 狀態改變
Q:離職 - 狀態改變
Q:取消訂單 - 狀態改變