

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
-- ANS：２０２４／０８／１５　測試OK 
INSERT INTO lab06 (ProductID, ProductName, Price)
VALUES (1 , 'apple', 120)

--12. 透過語法新增一筆價格為 100 的資料，觀察 ProductID
-- ANS：因為有設定AUTO_INCREMENT，所以ProductID會變成2號

INSERT INTO lab06 (ProductName, Price)
VALUES ('bee', 100)


--20. 建立資料表與部分資料後，如何透過語法增加欄位？ 
--    => 例如增加新增日期 CreateDate

--w3school語法 
ALTER TABLE table_name
ADD column_name datatype;

-- 實際打的語法
ALTER TABLE lab06
ADD CreateDate DATETIME;

-- 檢查
select * from lab06;

--21. 增加以後再重新撈資料庫的資料
--    先前的資料列中， CreateDate 欄位是否會有值? 
-- ANS:沒有 顯示NULL



--22. 再追加一個有預設值的欄位，例如異動時間 UpdateDate
--    先前的資料列中， UpdateDate 欄位是否會有值? 
--    Ans：有，顯示現在
ALTER TABLE table_name ADD column_name datatype;
ALTER TABLE lab06      ADD UpdateDate DATETIME DEFAULT NOW();
SELECT * FROM lab06

-- 問MySQL現在幾點=> NOW()


--28. 新增時若欄位順序沒有一致，是否會引發錯誤訊息？
INSERT INTO 資料表名稱(欄位一,欄位二, .......)
VALUES (欄位一你想要寫入的值,欄位二你想要寫入的值,......)

-- 資料表的欄位跟寫入的欄位是一致的
INSERT INTO lab06 (ProductID, ProductName, Price, CreateDate, UpdateDate)
VALUES (3 ,'fish',300, now(), now())

-- 資料表的欄位跟寫入的欄位不一致

INSERT INTO lab06 ( CreateDate, UpdateDate, ProductID, ProductName, Price)
VALUES (now(), now(), 4, 'egg', 15)


-- 會有很多錯誤的寫法
-- MySQL 很生氣，我們觀察錯誤訊息
-- MySQL 沒有生氣，，我們要觀察MySQL寫了什麼東西進去

--結果:: MySQL 寫了很多警告
 Warning: #1264 Out of range value for column 'ProductID' at row 1
 Warning: #1265 Data truncated for column 'ProductName' at row 1
 Warning: #1264 Out of range value for column 'Price' at row 1

INSERT INTO lab06 ( CreateDate, UpdateDate, ProductID, ProductName, Price)
VALUES (now(), now(), now(), now(), now())

--30. insert 語法介紹完畢後，請練習寫入2~3筆資料到 shop 和 shop_employee
--  * 若寫入資料有問題，請紀錄並思考是否為 PK、FK、UNIQUE、DEFAULT、CHECK 等設定的影響？

INSERT INTO shop (shop_id, shop_name, shop_address, shop_phone, shop_capital)
VALUES ('A', '鼎泰豐-台中大遠百', '台中市西區公益路二段251號', 0911222333, 50000 )

SELECT * FROM shop

-- 另一種寫法
INSERT INTO shop
VALUES ('D', '鼎泰豐-宜蘭', '宜蘭縣西區公益路二段251號', 0911222334, 80000 )
-- 另一種寫法
INSERT INTO shop
VALUES ('E', '鼎泰豐-台東', '台東縣西區公益路二段251號', 0911222334, 80000 ),
        ('F', '鼎泰豐-新竹', '新竹縣西區公益路二段251號', 0911222334, 80000)


-- ok，因為其他欄位都可以是空的
INSERT INTO shop (shop_id) VALUES ('G')

-- err , 因為Check =>shop_capital 的值不能小於10
INSERT INTO shop (shop_id, shop_capital) VALUES('G', 9)

-- 這個寫法OK
INSERT INTO shop_emp (emp_id, emp_name, emp_phone, shop_id)
VALUES (1, '蘋果', 0911222333,'A')

SELECT * FROM shop_emp

-- err : 因為shop_id不可為空 (但錯誤訊息沒有很清楚)
INSERT INTO shop_emp (emp_id, emp_name, emp_phone斯)
VALUES (2, '胖丁', '0911222334')

-- err : 因為emp_phone 需 UNIQUE
INSERT INTO shop_emp (emp_id, emp_name, emp_phone, shop_id)
VALUES (3, '卡比獸', '0911222334','A')


