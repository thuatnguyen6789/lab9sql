USE AdventureWorks2019
GO

--Tao mot thu tuc luu tru lay ra toan bo nhan vien vao lam theo nam co tham so dau vao la mot nam
CREATE PROCEDURE sp_DisplayEmployeesHireYear
	@HireYear int
AS
SELECT * FROM HumanResources.Employee
WHERE DATEPART(YY, HireDate)=@HireYear
GO

DROP PROCEDURE sp_DisplayEmployeesHireYear
GO

--De chay thu tuc nay can phai truyen tham so vao la nam ma nhan vien vao lam
EXECUTE sp_DisplayEmployeesHireYear 2011
GO

--Tao thu tuc luu tru dem so nguoi vao lam trong mot nam xac dinh co tham so dau vao la mot nam
--Tham so dau ra la so nguoi vao lam trong nam nay
CREATE PROCEDURE sp_EmployeesHireYearCount
	@HireYear int,
	@Count int OUTPUT
AS
SELECT @Count=COUNT(*) FROM HumanResources.Employee
WHERE DATEPART(YY, HireDate)=@HireYear
GO

DROP PROCEDURE sp_EmployeesHireYearCount
GO

--Chay thu tuc luu tru can phai truyen vao 1 tham so dau vao va mot tham so dau ra
DECLARE @Number int
EXECUTE sp_EmployeesHireYearCount 2011, @Number OUTPUT
PRINT @Number
GO

--Tao thu tuc luu tru dem so nguoi vao lam trong mot nam xac dinh co tham so dau vao la mot nam, ham tra ve so nguoi vao lam nam do
CREATE PROCEDURE sp_EmployeesHireYearCount2
	@HireYear int
AS
DECLARE @Count int
SELECT @Count=COUNT(*) FROM HumanResources.Employee
WHERE DATEPART(YY, HireDate)=@HireYear
RETURN @Count
GO

DROP PROCEDURE sp_EmployeesHireYearCount2
GO

--Chay thu tuc luu tru can phai truyen vao 1 tham so dau vao lay ve so nguoi lam trong nam do
DECLARE @Number int
EXECUTE @Number = sp_EmployeesHireYearCount2 2011
PRINT @Number
GO

--Tao bang tam #Students
CREATE TABLE #Students(
RollNo varchar(6) CONSTRAINT PK_Students PRIMARY KEY,
FullName nvarchar(100),
Birthday datetime constraint DF_StudentsBirthday DEFAULT
DATEADD(yy, -18, GETDATE())
)
GO

--Tao thu tuc luu tru tam de chen du lieu vao bang tam
CREATE PROCEDURE #spInsertStudents
	@rollNo varchar(6),
	@fullName nvarchar(100),
	@birthday datetime
AS BEGIN
	IF(@birthday IS NULL)
		SET @birthday=DATEADD(YY, -18, GETDATE())
	INSERT INTO #Students(RollNo, FullName, Birthday)
		VALUES(@rollNo, @fullName, @birthday)
END
GO

--Su dung thu tuc luu tru de chen du lieu vao bang tam
EXEC #spStudents 'A12345', 'abc', NULL
EXEC #spStudents 'A54321', 'abc', '12/24/2011'
SELECT * FROM #Students

--Tao thu tuc luu tru tam de xoa du lieu tu bang tam theo RollNo
CREATE PROCEDURE #spDeleteStudents
	@rollNo varchar(6)
AS BEGIN
	DELETE FROM #Students WHERE RollNo=@rollNo
END

--Xoa du lieu su dung thu tuc luu tru
EXECUTE #spDeleteStudents 'A12345'
GO

--Tao mot thu tuc luu tru su dung lenh RETURN de tra ve mot so nguyen
CREATE PROCEDURE Cal_Square @num int=0 AS
BEGIN
	RETURN(@num * @num);
END
GO

--Chay thu tuc luu tru
DECLARE @square int;
EXEC @square = Cal_Square 10;
PRINT @square;
GO

--Xem dinh nghia thu tuc luu tru bang ham OBJECT_DEFINITION
SELECT
OBJECT_DEFINITION(OBJECT_ID('HumanResources.uspUpdateEmployeePersonalInfo')) AS DEFINITION

--Xem dinh nghia thu tuc luu tru bang
SELECT definition FROM sys.sql_modules
WHERE
object_id=OBJECT_ID('HumanResources.uspUpdateEmployeePersonalInfo')
GO

--Thu tuc luu tru he thong xem cac thanh phan ma thu tuc luu tru phu thuoc
sp_depends 'HumanResources.uspUpdateEmployeePersonalInfo'
GO

USE AdventureWorks2019
GO

--Tao thu tuc luu tru sp_DisplayEmployees
CREATE PROCEDURE sp_DisplayEmployees AS
SELECT * FROM HumanResources.Employee
GO

--Thay doi thu tuc luu tru sp_DisplayEmployees
ALTER PROCEDURE sp_DisplayEmployees AS
SELECT * FROM HumanResources.Employee
WHERE Gender='F'
GO

--Chay thu tuc luu tru sp_DisplayEmployees
EXEC sp_DisplayEmployees
GO

--Xoa mot thu tuc luu tru
DROP PROCEDURE sp_DisplayEmployees
GO

CREATE PROCEDURE sp_EmployeeHire
AS
BEGIN
--Hien thi
EXECUTE sp_DisplayEmployeesHireYear 2010
DECLARE @Number int
EXECUTE sp_EmployeesHireYearCount 2010, @Number OUTPUT
PRINT N'So nhan vien vao lam nam 2010 la: ' +
CONVERT(varchar(3), @Number)
END
GO

--Chay thu tuc luu tru
EXEC sp_EmployeeHire
GO

DROP PROCEDURE sp_EmployeeHire
GO

--Thay doi thu tuc luu tru sp_EmployeeHire co khoi TRY...CATCH
ALTER PROCEDURE sp_EmployeeHire
	@HireYear int
AS
BEGIN
	BEGIN TRY
		EXECUTE sp_DisplayEmployeesHireYear @HireYear
		DECLARE @Number int

--Loi xay ra o day co thu tuc sp_EmployeesHireYearCount chi truyen 2 tham so ma ta truyen 3
		EXECUTE sp_EmployeesHireYearCount @HireYear, @Number OUTPUT, '123'
		PRINT N'So nhan vien vao lam nam la: ' +
CONVERT(varchar(3), @Number)
	END TRY
	BEGIN CATCH
		PRINT N'Co loi xay ra trong khi thuc hien thu tuc luu tru'
	END CATCH
	PRINT N'Ket thuc thu tuc luu tru'
END 
GO

--Chay thu tuc sp_EmployeeHire
EXEC sp_EmployeeHire 2010
GO

--Thay doi thu tuc luu tru sp_EmployeeHire su dung ham @ERROR
ALTER PROCEDURE sp_EmployeeHire
	@HireYear int
AS
BEGIN 
	EXECUTE sp_DisplayEmployeesHireYear @HireYear
	DECLARE @Number int
--Loi xay ra o day co thu tuc sp_EmployeesHireYearCount chi truyen 2 tham so ma ta truyen 3
	EXECUTE sp_EmployeesHireYearCount @HireYear, @Number OUTPUT,
'123'
	IF @@ERROR <> 0
		PRINT N'Co loi xay ra trong khi thuc hien thu tuc luu tru'
	PRINT N'So nhan vien vao lam nam la: ' +
CONVERT(varchar(3), @Number)
END
GO

--Chay thu tuc sp_EmployeeHire
EXEC sp_EmployeeHire 2010
GO