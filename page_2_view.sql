---טבלת דמה לכל סוגי הרכבים
CREATE OR ALTER VIEW Cars_Properties
AS
  SELECT C.*
         ,T.Car_Type_Name
		 ,CC.Company_Name
  FROM Cars C
  LEFT JOIN Car_Types T ON T.Car_Type_Id = C.Car_Type_Id
  LEFT JOIN Companies CC ON CC.Company_Id = C.Company_Id


  ---טבלת דמה לרכבים שלא היו בשימוש כלל
CREATE OR ALTER VIEW Never_Used_Cars
AS
  SELECT C.Car_Id
  FROM Cars C
  EXCEPT
  SELECT O.Car_Id
  FROM Orders O
 ---טבלת דמה לרכבים בשימוש
CREATE OR ALTER VIEW In_Use_Cars
AS
  SELECT C.Car_Id
  FROM Cars C
  INNER JOIN Orders O on C.Car_Id=O.Car_Id
  where O.Actual_Date_To IS NOT NULL



 ---טבלת דמה של רכבים  פנויים
CREATE OR ALTER VIEW Actual_Cars
AS
 SELECT CP.*
 FROM Cars_Properties CP INNER JOIN
 (SELECT Car_Id 
  FROM Cars_Properties
  EXCEPT
  SELECT Car_Id
  FROM In_Use_Cars ) C
  ON CP.Car_Id=C.Car_Id

