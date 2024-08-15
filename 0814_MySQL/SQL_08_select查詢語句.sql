

-- MySQL SELECT Statement
-- https://www.w3schools.com/MySQL/mysql_select.asp
-- 
-- SELECT Statement
-- https://dev.mysql.com/doc/refman/8.0/en/select.html


--10. 練習：指定需要使用的資料庫
直接輸入 USE northwind; ==>會出現錯誤  Error: #1046 No database selected


--20. 定義並查看變數
-- JS宣告 -> let x = 100; console.log(x);
-- 只能英文開頭，可以有數字符號

-- MySQL宣告
   SET @x = 100;
   SELECT @x;

--PHP宣告
-- $color = "red";

--30. select 語法結構練習

    SELECT '皮卡丘';
    SELECT 1+1;
    SELECT NOW();

-- 1.SELECT 可以單獨存在
-- 2."挑" 後面那個值出來看看

JS -> function -> 函式 方法 函數 副程式
MySQL -> function
SELECT 的用法和console.log很像


-- ** 底下使用 northwind 北風資料庫 ** 

--40. 以供應商資料表(suppliers)為例子，練習挑選聯絡資訊等欄位
SELECT * FROM suppliers;
SELECT SupplierID, City FROM suppliers;

-- Q:老闆說中秋節要到，要寄禮物給供應商
-- A:

SELECT CompanyName,ContactName,
        ContactTitle,Address,City,Region,Country,PostalCode,
        Phone 
   FROM suppliers

CREATE TABLE `suppliers` (
  `SupplierID` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(40) NOT NULL,
  `ContactName` varchar(30) DEFAULT NULL,
  `ContactTitle` varchar(30) DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `Phone` varchar(24) DEFAULT NULL,
  `Fax` varchar(24) DEFAULT NULL,
  `HomePage` mediumtext DEFAULT NULL,
  PRIMARY KEY (`SupplierID`),
  KEY `CompanyName` (`CompanyName`),
  KEY `PostalCode` (`PostalCode`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci



--41. 欄位別名，觀察將兩個欄位合併後，查詢結果該欄位是否還有名稱？
--    => 以合併供應商資料表的國家(Country)-城市(City)為例子

SELECT Country, City FROM suppliers;

SELECT Country X, City Y FROM suppliers;
-- ==> 省略了AS  Country變為X  City變為Y

--err
SELECT Country+City FROM suppliers;

--OK 
SELECT CONCAT(放置想要和再一起的欄位)
SELECT CONCAT(Country,City)  FROM suppliers;

--皮卡丘 可以置換成你想要的符號
SELECT CONCAT(Country,'皮卡丘',City)  FROM suppliers;

--請把'胖丁' 換成你理想中想要給使用者看的文字
SELECT CONCAT(Country,'皮卡丘',City) AS '卡比獸' FROM suppliers;
SELECT CONCAT(Country,'皮卡丘',City) AS "卡比獸" FROM suppliers;
SELECT CONCAT(Country,'皮卡丘',City) AS `卡比獸6`FROM suppliers;
SELECT CONCAT(Country,'皮卡丘',City) '卡比獸' FROM suppliers;
SELECT CONCAT(Country,'皮卡丘',City) 卡比獸 FROM suppliers;
SELECT CONCAT(Country,'皮卡丘',City) APPPLE FROM suppliers;
SELECT CONCAT(Country,'皮卡丘',City) beeeee FROM suppliers;

以上命名都可以成功
但未來!!!!盡量不要讓中文出現在名字裡

--42. 供應商來自那些國家？
SELECT SupplierID, Country FROM suppliers; --

-- => 如何取得不重複的清單？ 

-- w3school語法--SELECT DISTINCT
--取得不重複 / 排除重複 /  留下不重複
--取得16筆資料
SELECT DISTINCT Country FROM suppliers;


--取得29筆資料
SELECT DISTINCT SupplierID,Country FROM suppliers;


--50. 挑選指定的欄位進行排序 --
ORDER BY 一定要放在FROM後面

SELECT Country,CompanyName,ContactName,
        ContactTitle,Address,City,Region,PostalCode,
        Phone 
   FROM suppliers
ORDER BY Country ASC
-- ASC：預設 ，小到大
-- DESC : 大到小

-- 指定人出來排
SELECT Country,CompanyName,ContactName,
        ContactTitle,Address,City,Region,PostalCode,
        Phone 
   FROM suppliers
ORDER BY Country DESC, CompanyName ASC

-----------------------------------------------------------

-- 因為這兩個欄位都真實存在，所以可以  Country SupplierID
SELECT Country FROM suppliers ORDER BY SupplierID; 

-- 1.排序的欄位盡量讓它 出現
-- 2.排序的欄位盡量讓它 待在左側


--60. 指定資料表回傳的 開始資料列 以及 資料筆數 
LIMIT 擷取某一段資料出來

-- 擷取前3筆資料
SELECT * FROM suppliers
LIMIT 3;

SELECT * FROM suppliers LIMIT 幾筆 OFFSET 哪裡();
SELECT * FROM suppliers LIMIT 6 OFFSET 3;

LIMIT: 控制筆數
OFFSET : 從第幾筆之後 
EX: OFFSET 3 => 從第3筆之後，擷取第4筆
