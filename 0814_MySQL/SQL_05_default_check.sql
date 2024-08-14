

-- MySQL DEFAULT Constraint
-- https://www.w3schools.com/MySQL/mysql_default.asp
-- 
-- MySQL CHECK Constraint
-- https://www.w3schools.com/MySQL/mysql_check.asp


-- 10. 定義欄位的預設值
--
-- 目標：當飲料店店鋪名稱沒有輸入，給預設值文字
-- 
-- 方法：
--     a. 介面: 資料表> 結構> 選擇某欄位> 修改> 預設值(下拉 定義：)> 輸入文字
--     
--     b. 語法：參考上方連結 MySQL DEFAULT Constraint

ALTER TABLE Persons
ALTER City SET DEFAULT 'Sandnes';

ALTER TABLE shop
ALTER shop_name SET DEFAULT '喬巴';

-- 20. 資料寫入前的檢查
-- 


-- 目標：假設飲料店資本額必須要大於 10
-- 
-- 方法：
--     a. 介面: 無
-- 
--     b. 語法：參考上方連結 MySQL CHECK Constraint
ALTER TABLE Persons
ADD CHECK (Age>=18);

ALTER TABLE shop 
ADD CHECK (shop_capital>=10);