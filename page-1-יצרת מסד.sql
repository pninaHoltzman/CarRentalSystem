-- DROP DATABASE [CarsRental];
-- CREATE DATABASE  [CarsRental];

USE [CarsRental];

DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Cars;
DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS Car_Types;


CREATE TABLE Customers (
 Customer_Id int primary key identity(1,1) not null
,First_Name nvarchar(200)
,Last_Name  nvarchar(200)
,Phone nvarchar(10)
,birth_Year int
,Is_Trabel_Maker bit default 0
);

CREATE TABLE Companies (
 Company_Id int primary key identity(1,1) not null
,Company_Name nvarchar(200)
);

CREATE TABLE Car_Types (
 Car_Type_Id int primary key identity(1,1) not null
,Car_Type_Name nvarchar(200)
);

CREATE TABLE Cars (
 Car_Id int primary key identity(1,1) not null
,Car_number varchar(9)
,Company_Id int 
,foreign key(Company_Id) REFERENCES Companies(Company_Id)
,Car_Type_Id int 
,foreign key(Car_Type_Id) REFERENCES Car_Types(Car_Type_Id)
,Price int
);

CREATE TABLE Orders(
 Order_Id int primary key identity(1,1) not null
,Car_Id int
,foreign key(Car_Id) REFERENCES Cars(Car_Id)
,Customer_Id int
,foreign key(Customer_Id) REFERENCES Customers(Customer_Id)
,Date_From datetime
,Date_To datetime
,Actual_Date_To datetime
);
--------------------------------------------------מילוי טבלאות

--------טבלת לקוחות
INSERT INTO [dbo].[Customers]([First_Name],[Last_Name],[Phone],birth_Year)values('תמר','פריצקי','052834567',1990);
INSERT INTO [dbo].[Customers]([First_Name],[Last_Name],[Phone],birth_Year)values('דוד','כהן','0563234567',2004);
INSERT INTO [dbo].[Customers]([First_Name],[Last_Name],[Phone],birth_Year)values('נתנאל','לוי','024834567',2017);
INSERT INTO [dbo].[Customers]([First_Name],[Last_Name],[Phone],birth_Year)values('אלחנן','ישראל','0569834567',2020);
INSERT INTO [dbo].[Customers]([First_Name],[Last_Name],[Phone],birth_Year)values('שמואל','הולצמן','0523634567',2000);
INSERT INTO [dbo].[Customers]([First_Name],[Last_Name],[Phone],birth_Year)values('ליבי','מורה','053414567',1995);
INSERT INTO [dbo].[Customers]([First_Name],[Last_Name],[Phone],birth_Year)values('פנינה','פוברסקי','0528734567',1999);
INSERT INTO [dbo].[Customers]([First_Name],[Last_Name],[Phone],birth_Year)values('דסי','דייטש','0523544567',1794);
INSERT INTO [dbo].[Customers]([First_Name],[Last_Name],[Phone],birth_Year)values('משה','כהן','0556789123',1864);
INSERT INTO [dbo].[Customers]([First_Name],[Last_Name],[Phone],birth_Year)values('דוד' ,'חיים','0504896312',1925);
INSERT INTO [dbo].[Customers]([First_Name],[Last_Name],[Phone],birth_Year)values('שרה','לוי','0523698714',1982);
INSERT INTO [dbo].[Customers]([First_Name],[Last_Name],[Phone],birth_Year)values('יעל','אמסלם','0549876252',1985);
INSERT INTO [dbo].[Customers]([First_Name],[Last_Name],[Phone],birth_Year)values('מירב' ,'סוסבסקי','0589766489',1996);
INSERT INTO [dbo].[Customers]([First_Name],[Last_Name],[Phone],birth_Year)values('זלמן','פוקס','0523698741',1964);
INSERT INTO [dbo].[Customers]([First_Name],[Last_Name],[Phone],birth_Year)values('שני ','ברגיג','0583228654',1890);
INSERT INTO [dbo].[Customers]([First_Name],[Last_Name],[Phone],birth_Year)values(' אריאל ','ברמן','0556449123',1952);
INSERT INTO [dbo].[Customers]([First_Name],[Last_Name],[Phone],birth_Year)values(' אבי ','שנפ','0556789011',1935);
INSERT INTO [dbo].[Customers]([First_Name],[Last_Name],[Phone],birth_Year)values(' רונית ','צמח','0556719918',2000);
INSERT INTO [dbo].[Customers]([First_Name],[Last_Name],[Phone],birth_Year)values('דניאלה ','שרון ','0246789123',2001);
INSERT INTO [dbo].[Customers]([First_Name],[Last_Name],[Phone],birth_Year)values('יעקב','שוורץ','0532266800',1864);
INSERT INTO [dbo].[Customers]([First_Name],[Last_Name],[Phone],birth_Year)values(' אור ','רזניק','0456789122',2002);
INSERT INTO [dbo].[Customers]([First_Name],[Last_Name],[Phone],birth_Year)values('מיכל ','ששון','0556776743',2003);

--טבלת סוג רכבים
INSERT INTO [dbo].[Car_Types]([Car_Type_Name])VALUES ('מנהלים');
INSERT INTO [dbo].[Car_Types]([Car_Type_Name])VALUES ('יוקרה');
INSERT INTO [dbo].[Car_Types]([Car_Type_Name])VALUES ('אברכים');
INSERT INTO [dbo].[Car_Types]([Car_Type_Name])VALUES ('מסחרי');
INSERT INTO [dbo].[Car_Types]([Car_Type_Name])VALUES ('ספורט');
INSERT INTO [dbo].[Car_Types]([Car_Type_Name])VALUES ('משפחתי');

--טבלת חברות 
INSERT INTO [dbo].[Companies]([Company_Name]) VALUES ('Mazda');
INSERT INTO [dbo].[Companies]([Company_Name]) VALUES ('Toyota');
INSERT INTO [dbo].[Companies]([Company_Name]) VALUES ('BMW');
INSERT INTO [dbo].[Companies]([Company_Name]) VALUES ('Jeep');
INSERT INTO [dbo].[Companies]([Company_Name]) VALUES ('Nissan');
INSERT INTO [dbo].[Companies]([Company_Name]) VALUES ('FORD');
INSERT INTO [dbo].[Companies]([Company_Name]) VALUES ('Honda');
INSERT INTO [dbo].[Companies]([Company_Name]) VALUES ('volvo');
INSERT INTO [dbo].[Companies]([Company_Name]) VALUES ('Skoda');
INSERT INTO [dbo].[Companies]([Company_Name]) VALUES ('Cadillac');
INSERT INTO [dbo].[Companies]([Company_Name]) VALUES ('MAN');
INSERT INTO [dbo].[Companies]([Company_Name]) VALUES ('Chevrolet');

--מילוי טבלת רכבים
INSERT INTO [dbo].[Cars] ([Car_number],[Company_Id],[Car_Type_Id],[Price])VALUES('121544345',1,2,100);
INSERT INTO [dbo].[Cars] ([Car_number],[Company_Id],[Car_Type_Id],[Price])VALUES('644548854',3,1,700);
INSERT INTO [dbo].[Cars] ([Car_number],[Company_Id],[Car_Type_Id],[Price])VALUES('35458456',3,2,600);
INSERT INTO [dbo].[Cars] ([Car_number],[Company_Id],[Car_Type_Id],[Price])VALUES('354478156',4,6,200);
INSERT INTO [dbo].[Cars] ([Car_number],[Company_Id],[Car_Type_Id],[Price])VALUES('35785456',4,6,650);
INSERT INTO [dbo].[Cars] ([Car_number],[Company_Id],[Car_Type_Id],[Price])VALUES('35445856',4,5,900);
INSERT INTO [dbo].[Cars] ([Car_number],[Company_Id],[Car_Type_Id],[Price])VALUES('35448756',5,5,700);
INSERT INTO [dbo].[Cars] ([Car_number],[Company_Id],[Car_Type_Id],[Price])VALUES('35789456',5,3,700);
INSERT INTO [dbo].[Cars] ([Car_number],[Company_Id],[Car_Type_Id],[Price])VALUES('282935456',9,4,500);
INSERT INTO [dbo].[Cars] ([Car_number],[Company_Id],[Car_Type_Id],[Price])VALUES('092835456',9,1,200);
INSERT INTO [dbo].[Cars] ([Car_number],[Company_Id],[Car_Type_Id],[Price])VALUES('347885456',10,6,900);
INSERT INTO [dbo].[Cars] ([Car_number],[Company_Id],[Car_Type_Id],[Price])VALUES('354567884',2,6,200);
INSERT INTO [dbo].[Cars] ([Car_number],[Company_Id],[Car_Type_Id],[Price])VALUES('35789456',7,4,300);
INSERT INTO [dbo].[Cars] ([Car_number],[Company_Id],[Car_Type_Id],[Price])VALUES('35451602',6,3,400);
INSERT INTO [dbo].[Cars] ([Car_number],[Company_Id],[Car_Type_Id],[Price])VALUES('354672856',11,3,400);
INSERT INTO [dbo].[Cars] ([Car_number],[Company_Id],[Car_Type_Id],[Price])VALUES('324565456',11,2,500);
INSERT INTO [dbo].[Cars] ([Car_number],[Company_Id],[Car_Type_Id],[Price])VALUES('30985456',8,4,650);
INSERT INTO [dbo].[Cars] ([Car_number],[Company_Id],[Car_Type_Id],[Price])VALUES('012451302',7,5,650);
INSERT INTO [dbo].[Cars] ([Car_number],[Company_Id],[Car_Type_Id],[Price])VALUES('54985456',8,1,600);

--------------מילוי טבלת הזמנות
INSERT INTO [dbo].[Orders](Actual_Date_To,Car_Id,Customer_Id,Date_From,Date_To) VALUES (02-11-2024,1,1,22-10-2024,02-11-2024)
INSERT INTO [dbo].Orders(Car_Id,Customer_Id,Date_From,Date_To,Actual_Date_To) VALUES(14,13,'11-03-2023','06-04-2023','06-04-2023')
INSERT INTO [dbo].Orders(Car_Id,Customer_Id,Date_From,Date_To,Actual_Date_To) VALUES(12,3,'11-03-2020','12-04-2020','12-04-2020')
INSERT INTO [dbo].Orders(Car_Id,Customer_Id,Date_From,Date_To,Actual_Date_To) VALUES(9,2,'9-03-2024','10-04-2024','12-04-2024')
INSERT INTO [dbo].Orders(Car_Id,Customer_Id,Date_From,Date_To,Actual_Date_To) VALUES(8,8,'11-03-2024','12-06-2024','12-06-2024')
INSERT INTO [dbo].Orders(Car_Id,Customer_Id,Date_From,Date_To,Actual_Date_To) VALUES(10,6,'11-03-2024','12-04-2024','12-04-2024')
INSERT INTO [dbo].Orders(Car_Id,Customer_Id,Date_From,Date_To,Actual_Date_To) VALUES(1,8,'01-03-2024','01-04-2024','02-04-2024')
INSERT INTO [dbo].Orders(Car_Id,Customer_Id,Date_From,Date_To,Actual_Date_To) VALUES(3,5,'01-10-2024','01-12-2024','02-12-2024')
INSERT INTO [dbo].Orders(Car_Id,Customer_Id,Date_From,Date_To,Actual_Date_To) VALUES(11,2,'05-06-2024','06-06-2024','06-06-2024')
INSERT INTO [dbo].Orders(Car_Id,Customer_Id,Date_From,Date_To,Actual_Date_To) VALUES(17,5,'10-04-2024','11-05-2024','11-05-2024')
INSERT INTO [dbo].Orders(Car_Id,Customer_Id,Date_From,Date_To,Actual_Date_To) VALUES(17,17,'02-02-2023','02-17-2024','02-17-2024')
INSERT INTO [dbo].Orders(Car_Id,Customer_Id,Date_From,Date_To,Actual_Date_To) VALUES(12,18,'01-03-2024','02-03-2024','02-03-2024')
INSERT INTO [dbo].Orders(Car_Id,Customer_Id,Date_From,Date_To,Actual_Date_To) VALUES(1,18,'01-02-2024','02-03-2024','02-04-2024')
INSERT INTO [dbo].Orders(Car_Id,Customer_Id,Date_From,Date_To,Actual_Date_To) VALUES(3,18,'04-11-2024','04-11-2024','11-11-2024')
INSERT INTO [dbo].Orders(Car_Id,Customer_Id,Date_From,Date_To,Actual_Date_To) VALUES(13,18,'01-11-2020','06-12-2020','01-14-2020')
