

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

    select * from lab07;    


--20. 更新異動日期欄位 UpdateDate，執行後有多少資料被異動了？


--21. 更新 類別編號 為1號的平均單價為 10 元


--29. delete 特定資料


--30. 執行 delete 資料表指令 ，然後再次重新新增資料
--	   觀察流水號的變化


--31. 執行 truncate 資料表指令 ，然後再次重新新增資料
--	   觀察流水號的變化


--32. 執行 drop 資料表指令 ，然後再次重新新增資料
--	  觀察流水號的變化
