

-- MySQL INSERT INTO Statement
-- https://www.w3schools.com/MySQL/mysql_insert.asp
-- 
-- MySQL ALTER TABLE Statement
-- https://www.w3schools.com/MySQL/mysql_alter.asp



--10. 透過語法建立資料表
--	 確認所選取的資料庫為 Lab 後，貼上底下程式碼執行

    create table lab06
    (
        ProductID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
        ProductName varchar(5),
        Price int NULL
    );

    select * from lab06;


--11. 透過語法新增資料，當資料欄位被定義為 AUTO_INCREMENT ，是否能再透過指令新增？


--12. 透過語法新增一筆價格為 100 的資料，觀察 ProductID



--20. 建立資料表與部分資料後，如何透過語法增加欄位？ 
--    => 例如增加新增日期 CreateDate


--21. 增加以後再重新撈資料庫的資料
--    先前的資料列中， CreateDate 欄位是否會有值? 


--22. 再追加一個有預設值的欄位，例如異動時間 UpdateDate
--    先前的資料列中， UpdateDate 欄位是否會有值? 


--28. 新增時若欄位順序沒有一致，是否會引發錯誤訊息？





--30. insert 語法介紹完畢後，請練習寫入2~3筆資料到 shop 和 shop_employee
--  * 若寫入資料有問題，請紀錄並思考是否為 PK、FK、UNIQUE、DEFAULT、CHECK 等設定的影響？