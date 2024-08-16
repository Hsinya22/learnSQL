-- 10. 供應商資料表有幾個供應商

SELECT SupplierID , City FROM suppliers;

-- 請機器人算總共有幾筆資料
SELECT COUNT(*) FROM suppliers;

-- 更改顯示名稱
SELECT COUNT(*) AS supplierCount FROM suppliers;


-- 15. 供應商資料表中，統計每個國家對應的供應商數量
-- 無法算出
SELECT Country , COUNT(*) FROM suppliers
-- 可以算出 
SELECT Country , COUNT(*) FROM suppliers GROUP BY Country;
-- 更改標題
SELECT Country AS myCountry , COUNT(*) AS Y FROM suppliers GROUP BY Country;

--
SELECT Country AS myCountry , COUNT(*) AS Y FROM suppliers GROUP BY Country
ORDER BY Y DESC;

-- 16. 延續15，完成數量統計後，選出供應商數量大於 1 的國家

-- (X) total 別名不能使用 #1054 - Unknown column 'total' in 'where clause'
SELECT Country AS myCountry , COUNT(*) AS total 
FROM suppliers 
WHERE total >1 --別名不能使用
GROUP BY Country
ORDER BY total DESC;


--出現錯誤 不能使用WHERE #1111 - Invalid use of group function
SELECT Country AS myCountry , COUNT(*) AS total 
FROM suppliers 
WHERE COUNT(*) >1 
GROUP BY Country
ORDER BY total DESC;

-- OK 使用HAVING 
  SELECT Country AS myCountry , COUNT(*) AS total 
    FROM suppliers 
GROUP BY Country
  HAVING total >1 
ORDER BY total DESC;
-- ok
 SELECT Country AS myCountry , COUNT(*) AS total 
    FROM suppliers 
GROUP BY Country
  HAVING COUNT(*) >1 
ORDER BY total DESC;
-- ok
  SELECT Country AS myCountry , COUNT(*) AS total 
    FROM suppliers 
GROUP BY Country
  HAVING COUNT(*) >1 
ORDER BY COUNT(*)  DESC;

--把所有關鍵字湊再一起
  SELECT Country AS myCountry , COUNT(*) AS total 
    FROM suppliers 
   WHERE Country IN ('USA' , 'Japan', 'UK')
GROUP BY Country
  HAVING COUNT(*) >1 
ORDER BY COUNT(*)  DESC
   LIMIT 0,1

  SELECT 欄位 || 資料
    FROM 資料表
   WHERE 對資料表講條件 || 處理GROUP BY 前的資料

GROUP BY 彙總
  HAVING 對彙總後的結果 講條件 | 處理GROUP BY 後面的資料
         EX: 把一個班的女生分為北部和南部人 =>GROUP BY
         ，接著把人數大於5的留下來 =>HAVING

ORDER BY 排序
   LIMIT 取得資料表一部分的資料 || 一小塊區間的資料
         如果使用者查詢到的資料有830萬筆的話..


-- 20. 如果想要知道客戶有多少訂單，在哪一個資料表裡面？
SELECT * FROM orders;

SELECT CustomerID , COUNT(*) 
  FROM orders 
  GROUP BY CustomerID
  ORDER BY COUNT(*) DESC --依照訂單多寡排序

-- 22. 訂單資料表是否有紀錄總金額？ Ans : 
--     訂單明細資料表是否有紀錄小計金額？ Ans : 
-- 尋找有幾筆沒打折
 --2155
 SELECT Count(*) FROM orderdetails  WHERE Discount = 0

 --2155
SELECT Count(*) FROM orderdetails


--把其中10248 資料改為打8折
-- 在做UPDATE之前，要先確認要新增的那筆資料的資料型態

UPDATE orderdetails SET Discount = 0.8 WHERE OrderID = 10248; 
--=> 因為double(8,0) =>0個浮點數 =>Discount顯示1
UPDATE orderdetails SET Discount = 80 WHERE OrderID = 10248;

SELECT * , (UnitPrice * Quantity * Discount / 100) AS 小計
FROM orderdetails 
--出現怪怪 沒打折的小計 顯示0

-- 80改為20
UPDATE orderdetails SET Discount = 20 WHERE OrderID = 10248;
SELECT * , (UnitPrice * Quantity * (100-Discount) / 100) AS 小計
FROM orderdetails 


 
-- 30. 訂單編號 10847 一共購買了幾個產品？
SELECT COUNT(*) FROM orderdetails WHERE OrderID = 10847; -- 6筆
SELECT * FROM orderdetails WHERE OrderID = 10847; --知道是哪6筆 1 19 37 45 60 71

-- 31. 延續 30，該如何得知產品名稱？
SELECT * FROM products WHERE ProductID IN (1 ,19 ,37 ,45 ,60 ,71); 
 
 
SELECT OrderID ,ProductID FROM orderdetails WHERE  OrderID = 10847;
SELECT ProductID , ProductName FROM products;
-- err
SELECT OrderID ,ProductID ,ProductName
FROM orderdetails AS apple
JOIN products AS bee  ON apple.ProductID = bee.ProductID
WHERE  OrderID = 10847;

--ok ,在資料表使用別名
SELECT OrderID ,apple.ProductID ,ProductName
FROM orderdetails AS apple
JOIN products AS bee  ON apple.ProductID = bee.ProductID
WHERE  OrderID = 10847;

 --OK, 未使用別名
SELECT OrderID ,orderdetails.ProductID ,ProductName
FROM orderdetails 
JOIN products         ON orderdetails.ProductID = products.ProductID
WHERE  OrderID = 10847;
--再多一個資料表
SELECT orders.OrderID ,orderdetails.ProductID ,ProductName, orders.CustomerID
FROM orderdetails 
JOIN products         ON orderdetails.ProductID = products.ProductID
JOIN orders           ON orders.OrderID =  orderdetails.OrderID
WHERE  orders.OrderID = 10847;



-- 40. 觀察 Employees 資料表可以知道，員工的主管也包含在其中；
--     請幫忙整理出員工以及員工的主管姓名

--再介面輸入
--把資料表設別名
--叫出員工名字
SELECT e.EmployeeID, e.FirstName, e.ReportsTo 
FROM employees AS e


--整理出員工主管名字
SELECT a.EmployeeID, a.FirstName, a.ReportsTo  FROM employees AS a
SELECT b.EmployeeID, b.FirstName,              FROM employees AS b

SELECT a.EmployeeID, a.FirstName AS EmployeeName, a.ReportsTo
      ,b.FirstName AS BossName
FROM employees AS a
JOIN employees AS b ON a.ReportsTo =   b.EmployeeID

需要JOIN的時刻
=>把兩張表排再一起來看




