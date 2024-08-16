

-- MySQL NULL Values
-- https://www.w3schools.com/mysql/mysql_null_values.asp
-- 
-- MySQL Operators
-- https://www.w3schools.com/mysql/mysql_operators.asp



--10. 挑選供應商資料中，傳真號碼為空值(NULL)的資料
SELECT SupplierID,Fax FROM suppliers;

SELECT SupplierID,Fax FROM suppliers
WHERE Fax = 'NULL' --=>找不到 => 因現在寫的是NULL字串 

SELECT SupplierID,Fax FROM suppliers
WHERE Fax = NULL --=>找不到 =>因MySQL說，挑選NULL的時候， 不可以用 等於

-- 因MySQL說，挑選NULL的時候， 要用 IS
SELECT SupplierID,Fax FROM suppliers
WHERE Fax IS NULL;

--因MySQL說，挑選 不是NULL，要用 IS NOT
SELECT SupplierID,Fax FROM suppliers
WHERE Fax IS NOT NULL;

-- NULL 和空字串不一樣

--15. 討論幾種不等於的寫法 != 、 <> 、 not

-- 只會挑一筆
SELECT SupplierID,City FROM suppliers WHERE SupplierID = 1;

-- 不是一號，所以挑剩餘的28筆
SELECT SupplierID,City FROM suppliers WHERE SupplierID != 1;

-- 不是一號，所以挑剩餘的28筆
SELECT SupplierID,City FROM suppliers WHERE SupplierID <> 1;

-- 不是一號，所以挑剩餘的28筆
SELECT SupplierID,City FROM suppliers WHERE NOT SupplierID = 1;

-- 目標:挑選20號到29號的供應商
SELECT SupplierID,City FROM suppliers WHERE SupplierID >= 20;
SELECT SupplierID,City FROM suppliers WHERE NOT SupplierID < 20;

-- >以上用SupplierID進行挑選，沒有實際的情境，只是為了練習語法

--20. 挑選供應商資料中，傳真號碼不等於 '43844115' 的資料
SELECT SupplierID,Fax FROM suppliers;

-- 等於 '43844115' 的資料 => 1筆
SELECT SupplierID,Fax FROM suppliers WHERE Fax ='43844115';

-- 只有12筆資料，沒有包含NULL
SELECT SupplierID,Fax FROM suppliers
WHERE Fax !='43844115';

-- 不等於 '43844115' 的資料 =>28筆 (正確)
SELECT SupplierID,Fax FROM suppliers
WHERE Fax !='43844115' OR Fax IS NULL ;

--25. 排序的欄位挑選 Fax 觀察執行結果

-- 執行指令前
-- 1.會排序，NULL會被排一起
     1-1 NULL 排在最前面
     1-2 NULL 排在最後面
     1-3 NULL 排在最中面 
   2.不會排序，NULL會穿插著出現  


SELECT * FROM suppliers;
 
SELECT Fax,SupplierID FROM suppliers ORDER BY Fax ASC;
SELECT Fax,SupplierID FROM suppliers ORDER BY Fax DESC;


--30. 別名是否可以在 order by 中使用？
--     Ans : 可以 
SELECT SupplierID, City           FROM suppliers ORDER BY City ; 
SELECT SupplierID, City AS APPLE FROM suppliers ORDER BY APPLE ; 

-- 
--    別名是否可以在   where  中使用？
--     Ans : 不可以
SELECT SupplierID,City          FROM suppliers WHERE City  = 'Tokyo';
SELECT SupplierID,City AS APPLE FROM suppliers WHERE APPLE = 'Tokyo';

SELECT SupplierID,City          FROM suppliers WHERE  City LIKE %o% ORDER BY City;

