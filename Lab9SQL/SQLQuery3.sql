CREATE DATABASE CaliforniaToys
GO

USE CaliforniaToys
GO

CREATE TABLE Toys(
ProductCode varchar(5) PRIMARY KEY,
Name varchar(30),
Category varchar(30),
Manufacturer varchar(40),
AgeRange varchar(15),
UnitPrice money,
Netweight int,
QtyOnHand int
)
GO

INSERT INTO Toys(ProductCode, Name, Category, Manufacturer, AgeRange, UnitPrice, Netweight, QtyOnHand) VALUES('A11', 'CON QUAY', 'NANG DONG', 'AMERICA', 'CHILDS', 12, 350, 25);
INSERT INTO Toys(ProductCode, Name, Category, Manufacturer, AgeRange, UnitPrice, Netweight, QtyOnHand) VALUES('B11', 'XEP HINH', 'THONG MINH', 'ITALY', 'CHILDS', 15, 650, 30);
INSERT INTO Toys(ProductCode, Name, Category, Manufacturer, AgeRange, UnitPrice, Netweight, QtyOnHand) VALUES('A12', 'SIEU NHAN', 'GAME BO', 'JAPAN', 'TEEN', 10, 450, 27);
INSERT INTO Toys(ProductCode, Name, Category, Manufacturer, AgeRange, UnitPrice, Netweight, QtyOnHand) VALUES('C15', 'DUA XE', 'GIAI TRI', 'CHINA', 'TEEN', 5, 550, 32);
INSERT INTO Toys(ProductCode, Name, Category, Manufacturer, AgeRange, UnitPrice, Netweight, QtyOnHand) VALUES('B14', 'TRONG CAY', 'CHAM CHI', 'VIETNAM', 'AUDULT', 50, 840, 50);
INSERT INTO Toys(ProductCode, Name, Category, Manufacturer, AgeRange, UnitPrice, Netweight, QtyOnHand) VALUES('C11', 'BI A ', 'THE THAO', 'CHINA', 'TEEN', 45, 120, 37);
INSERT INTO Toys(ProductCode, Name, Category, Manufacturer, AgeRange, UnitPrice, Netweight, QtyOnHand) VALUES('D10', 'DO HANG', 'MUA SAM', 'VIETNAM', 'AUDULT', 53, 560, 40);
INSERT INTO Toys(ProductCode, Name, Category, Manufacturer, AgeRange, UnitPrice, Netweight, QtyOnHand) VALUES('D34', 'THANH KIEM', 'NANG DONG', 'JAPAN', 'CHILDS', 32, 455, 26);
INSERT INTO Toys(ProductCode, Name, Category, Manufacturer, AgeRange, UnitPrice, Netweight, QtyOnHand) VALUES('F15', 'OTO', 'THE THAO', 'GERMANY', 'TEEN', 20, 570, 56);
INSERT INTO Toys(ProductCode, Name, Category, Manufacturer, AgeRange, UnitPrice, Netweight, QtyOnHand) VALUES('G9', 'IQ GAME', 'TRI TUE', 'VIETNAM', 'TEEN', 100, 440, 34);
INSERT INTO Toys(ProductCode, Name, Category, Manufacturer, AgeRange, UnitPrice, Netweight, QtyOnHand) VALUES('A111', 'MAY BAY', 'SO THICH', 'CHINA', 'CHILDS', 10, 575, 33);
INSERT INTO Toys(ProductCode, Name, Category, Manufacturer, AgeRange, UnitPrice, Netweight, QtyOnHand) VALUES('H12', 'LO LEM', 'GAME TOP', 'AMERICA', 'GIRLS', 60, 240, 41);
INSERT INTO Toys(ProductCode, Name, Category, Manufacturer, AgeRange, UnitPrice, Netweight, QtyOnHand) VALUES('E16', 'DIEN THOAI', 'THONG MINH', 'VIETNAM', 'BOYS', 45, 500, 62);
INSERT INTO Toys(ProductCode, Name, Category, Manufacturer, AgeRange, UnitPrice, Netweight, QtyOnHand) VALUES('N113', 'XE CAU', 'NANG DONG', 'CHINA', 'TEEN', 54, 510, 47);
INSERT INTO Toys(ProductCode, Name, Category, Manufacturer, AgeRange, UnitPrice, Netweight, QtyOnHand) VALUES('M11', 'CUU HOA', 'PHAN UNG', 'ITALY', 'BOYS', 56, 490, 75);
GO

SELECT * FROM Toys
GO

CREATE PROCEDURE HeavyToys AS
SELECT * FROM Toys
WHERE Netweight > 500
GO

EXECUTE HeavyToys
GO

CREATE PROCEDURE PriceIncrease AS
SELECT * FROM Toys
GO

EXECUTE PriceIncrease
GO

DROP PROCEDURE PriceIncrease
GO
