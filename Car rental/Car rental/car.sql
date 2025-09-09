create table Customer_tbl
(
CustId int PRIMARY KEY IDENTITY(100,1)not null,
CustName varchar(20),
CustPhone varchar(10) not null,
CustCity varchar(10),
)
go
create table Order_tbl
(
CustId int PRIMARY KEY IDENTITY(100,1)not null,
--foreign key(CustId)REFERENCES Customer_tbl(CustId),
CarNumber varchar(10),
DateTaken date,
DateReturn date,
ActualReturn date,
)
go
create table Degree_tbl
(
DegreeId int PRIMARY KEy not null,
DailyPrice int,
)
go
create table CarType_tbl
(
CarId int PRIMARY KEY IDENTITY(20,5) not null,
DegreeId int,
foreign key(DegreeId)REFERENCES Degree_tbl(DegreeId),
Company varchar,
model varchar,
NumPlaces int,
SumStock int,
)
go
create table ActualCar_tbl
(
CarId int PRIMARY KEY IDENTITY(20,5) not null,
CarNumber varchar(10),
CurrentStatus varchar(70),
foreign key(CarId)REFERENCES CarType_tbl(CarId),
--foreign key(CarNumber)REFERENCES Order_tbl(CarNumber),
)

