--------------------------------שאילתות---------------------------
--פונקציה שמקבלת קוד רכב  
--והיא מפעילה סמן שעובר על כל המופעים של הקוד בטבלת ההזמנות וסוכמת את כמות הימים שהשתמשו בו
--אם היה בו שימוש של לפחות 100 ימים הרכב מועבר לטסט
CREATE OR ALTER FUNCTION fixed(@carId smallint)returns nvarchar(266)
AS
BEGIN
DECLARE @text nvarchar(266)
DECLARE @countDay SMALLINT =  0 ;
DECLARE crs  CURSOR
FOR SELECT [Date_From],[Actual_Date_To]
      FROM [Orders] o
     WHERE o.Car_Id=@carId
OPEN crs
   DECLARE @Date_From DATE,@Actual_Date_To DATE
   FETCH NEXT FROM crs  INTO @Date_From,@Actual_Date_To
   WHILE @@fetch_status=0
   BEGIN
      SELECT @countDay+=DATEDIFF(day,@Date_From, @Actual_Date_To)
   FETCH NEXT FROM crs
   INTO @Date_From,@Actual_Date_To
   END 
CLOSE crs
DEALLOCATE crs 
SELECT @text =  iif(@countDay>=100 , '🚗 יש לשלוח את הרכב לטסט' , 'הרכב תקין' )--caseמקוצר...
RETURN @text
END
go

--טריגר שמופעל בעת הכנסת תאריך לקיחה והחזרה ולא מאפשר הכנסה לא תקינה
CREATE OR ALTER TRIGGER INSERT_FROM_TO_DATE
   ON [dbo].[Orders]
AFTER INSERT
AS
  IF EXISTS ( SELECT * FROM INSERTED I WHERE I.Date_From < i.Date_To)
  BEGIN
     ROLLBACK;
       RAISERROR('תאריך החזרה לא יכול להיות קטן מתאריך הלקיחה',1,16)
  END
go

-- פרוצדורה שמסמנת לקוח כבעייתי במידה והחזיר את הרכב באיחור של לפחות 5 ימים לפחות 3 פעמים
CREATE OR ALTER PROCEDURE UPDATE_TRABEL_MAKER
AS
BEGIN
UPDATE C
 SET Is_Trabel_Maker = 1
FROM [dbo].[Customers] C
INNER JOIN
(SELECT O.Customer_Id
    FROM [dbo].[Orders] O
WHERE CONVERT(DATE,O.Actual_Date_To) > CONVERT(DATE,O.Date_To + 5)  -- הזמנות שחזרו מאוחר
GROUP BY O.Customer_Id
HAVING COUNT(*)>=3) Q ON C.Customer_Id =Q.Customer_Id
END
GO
exec[UPDATE_TRABEL_MAKER]
--פונקציה טבלאית שמקבלת סוג רכב ומחזירה את כל הרכבים האקטואלים מאותו סוג
CREATE OR ALTER FUNCTION stype_Cars(@Car_Taype_Name VARCHAR(200))RETURNS TABLE
AS
RETURN(
SELECT [Car_number],[Company_Name],[Price]
   FROM [dbo].[Actual_Cars] a
WHERE @Car_Taype_Name=a.Car_Type_Name)
GO

--שאילתה שמחזירה לכל חברה את המחיר מהגבוה לנמוך 
WITH q1 AS
(SELECT *, ROW_NUMBER() OVER(PARTITION BY [Company_Id] ORDER BY [Price] DESC)price_rating
  FROM [dbo].[Cars])
SELECT [Company_Name],[Car_Type_Name],cp.[Car_number],cp.[Price],price_rating
  FROM q1 join [dbo].[Cars_Properties]cp
  ON q1.Car_Id=cp.Car_Id

