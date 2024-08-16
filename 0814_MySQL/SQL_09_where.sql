

-- MySQL WHERE Clause
-- https://www.w3schools.com/MySQL/mysql_where.asp
-- 
-- MySQL AND, OR and NOT Operators
-- https://www.w3schools.com/MySQL/mysql_and_or.asp
-- 
-- MySQL LIKE Operator
-- https://www.w3schools.com/MySQL/mysql_like.asp
-- 
-- MySQL BETWEEN Operator
-- https://www.w3schools.com/MySQL/mysql_between.asp
-- 
-- MySQL IN Operator
-- https://www.w3schools.com/MySQL/mysql_in.asp

-- WHERE
-- 1. WHERE 欄位 =  值

--10. 請挑選國家(Country)來自日本(Japan)的供應商
先撈全部資料
SELECT * FROM suppliers;

再下WHERE
SELECT * FROM suppliers WHERE Country = Japan ;
關鍵字   關鍵字   資料表  關鍵字  column   值(判斷是字串還是數字，字串要加單引號)
-- #1054 - Unknown column 'Japan' in 'where clause'

Japan加上單引號 => 成功
SELECT * FROM suppliers WHERE Country = 'Japan' ;
SELECT * FROM suppliers WHERE Country = 'USA' ;
-- 挑到6筆資料
SELECT * FROM suppliers WHERE Country = 'USA' OR Country = 'Japan' ;

-- AND語法怪怪，挑到0筆資料
SELECT * FROM suppliers WHERE Country = 'USA' AND Country = 'Japan' ;



--15. 請挑選 ContactTitle = 'Sales Manager' 
--    且國家來自 'France' 或者 'Germany'
--    的供應商資料
-- 失敗 =>條件和條件之間不會用逗號
SELECT * FROM suppliers WHERE ContactTitle = 'Sales Manager' , Country = 'France' OR 'Germany';
-- 多挑選了一樣
SELECT * FROM suppliers WHERE ContactTitle = 'Sales Manager' AND Country = 'Germany' OR Country = 'France';
-- 正確(兩個寫法都可以)
SELECT * FROM suppliers WHERE ContactTitle = 'Sales Manager' AND Country = 'Germany' OR  ContactTitle = 'Sales Manager' AND Country = 'France';

SELECT * FROM suppliers 
WHERE ContactTitle = 'Sales Manager' 
AND ( Country = 'Germany' OR  Country = 'France');
-- ==>加上小括號的時機 ==> 有OR的時候

-- 先把欄位縮成只有要挑的資料
SELECT SupplierID, ContactTitle, Country FROM suppliers

--底下的練習28結束後上來新增的寫法 
SELECT SupplierID, ContactTitle, Country FROM suppliers
WHERE ContactTitle = 'Sales Manager'
AND Country IN ( 'Germany' , 'France') ;

--20. 將資料進行模糊比對
-- 只要一部分的資料是符合的

--  情境: 找 許雅婷
SELECT * FROM 學生 WHERE 學生姓名 = '許雅婷'
--  情境: 找 雅婷
SELECT * FROM 學生 WHERE 學生姓名 = '%雅婷'
--  情境: 找 婷
SELECT * FROM 學生 WHERE 學生姓名 = '%婷%'

SELECT SupplierID, Country FROM suppliers WHERE Country

-- 國家名稱有a
SELECT SupplierID, Country FROM suppliers 
WHERE Country LIKE 'a' --找不到資料

-- 百分比再a後面 =>字首有A 
SELECT SupplierID, Country FROM suppliers WHERE Country LIKE 'a%'; 
-- 百分比再a前面 =>國家名字結尾有A
SELECT SupplierID, Country FROM suppliers WHERE Country LIKE '%a'; 
-- 百分比包夾a =>A有出現
SELECT SupplierID, Country FROM suppliers WHERE Country LIKE '%a%'; 


--25. 練習使用區間的範圍取得
--    => 例如：供應商編號介於 3 到 7 之間的
-- 方法A:一個一個打
SELECT SupplierID, Country FROM suppliers
WHERE SupplierID = 3 OR SupplierID = 3
   OR SupplierID = 5 OR SupplierID = 6 OR SupplierID = 7

-- 方法B
-- WHERE條件的值，是連續不中斷 => 欄位 BETWEEN 數字A AND 數字B
SELECT SupplierID, Country FROM suppliers
WHERE SupplierID BETWEEN 3 AND 7;

-- 用數字比較
SELECT SupplierID, Country FROM suppliers
WHERE SupplierID >= 3 AND SupplierID <=7;


--28. 練習搜尋同一(資料行||欄位)中的多重值
--    => 例如：供應商城市在大阪(Osaka)或東京(Tokyo)
SELECT SupplierID, City FROM suppliers
-- 方法A
SELECT SupplierID, City FROM suppliers
WHERE city = 'Osaka' OR city = 'Tokyo'

-- 方法B
-- 欄位 IN ( 值1, 值2, 值3, .....)
SELECT SupplierID, City FROM suppliers
WHERE city IN ( 'Osaka' , 'Tokyo') 


