/*
CREATE DATABASE [YourDatabaseName]
ON PRIMARY 
(
    NAME = 'Intake43_Primary',
    FILENAME = 'D:\Intake43_Primary.mdf',
    SIZE = 10MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 10MB
),
FILEGROUP [YourFilegroupName]
(
    NAME = 'Intake43_Secondary',
    FILENAME = 'D:\Intake43_Secondary.ndf',
    SIZE = 10MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 10MB
)
LOG ON 
(
    NAME = 'Intake43_log',
    FILENAME = 'D:\Intake43_log.ldf',
    SIZE = 10MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 10MB
);
CREATE SCHEMA HR;
CREATE SCHEMA Sales;
CREATE TABLE HR.Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName NVARCHAR(100)
);

CREATE TABLE Sales.Orders
(
    OrderID INT PRIMARY KEY,
    OrderDate DATE
);
ALTER SCHEMA HR TRANSFER dbo.Employees;
*/
create table department 
(
id int identity(1,1) primary key,
name nvarchar(50)
);
insert into department values('pd');
insert into department values('os'),
('ui'),
('iot');
drop table Employee;
CREATE TABLE Employee (
    ID INT PRIMARY KEY IDENTITY(1,1), -- Auto-incrementing primary key
    FirstName NVARCHAR(50) NOT NULL,         -- First name of the employee
    LastName NVARCHAR(50) NOT NULL,          -- Last name of the employee
    DateOfBirth DATE,                        -- Date of birth
    Salary DECIMAL(18, 2),                   -- Salary with 2 decimal places
    IsActive BIT DEFAULT 1,                  -- Boolean flag to indicate if the employee is active
    ManagerID INT,                           -- Foreign key referencing another employee as manager
	Gender nchar(1) 
    CONSTRAINT FK_Employee_Manager FOREIGN KEY (ManagerID) 
        REFERENCES Employee(ID)      -- Self-referencing foreign key
);

-- Insert employees
INSERT INTO Employee (FirstName, LastName, DateOfBirth, Salary, IsActive, ManagerID,Gender)
VALUES 
('John', 'Doe', '1985-05-15', 75000.00, 1, NULL,'M'), -- John has no manager
('Jane', 'Smith', '1990-08-22',  65000.00, 1, 1,'M'),   -- Jane's manager is John (EmployeeID = 1)
('Alice', 'Johnson', '1995-12-10',  55000.00, 1, 1,'F'),
('John', 'Johnson', '1995-12-10',  55000.00, 1, 1,'M'); -- Alice's manager is John (EmployeeID = 1)
alter table employee
add did int
alter table employee
add constraint   department_fk foreign  key (did) references  department(id);

update employee 
set did=1
where Employee.ID=1;

select * from department;
select * from Employee;

select distinct FirstName
from Employee;
--define schemes --->table
/*
create schema intake45;
create table dbo.tb (id int);--adding table in dbo schema
create table intake45.tb (id int);--intake45
select * from tb;--dbo.tb
*/

--dml insert update ,delete,select
select * from department;
select * from Employee;
insert into   Employee
(FirstName,LastName,Salary,Gender,ManagerID)
values
--check in employee table has id value 10
('aya','ali',5000.00,'F',2);

select FirstName +' '+LastName as Fullname--2
from Employee;--1
--get unique first name
select  distinct FirstName ,LastName
from Employee;
select count(*),count(id),count(FirstName),count(did)
from Employee;
select * from Employee;

select *
from Employee --1
where FirstName like '%j___';--2
--start with 2 letters j any letters any count

select *
from Employee
where id!=2

select * 
from Employee
where Salary not in (55000,75000)
--where Salary =55000 or salary =75000
--where Salary between 50000 and 70000
--where salary >=50000 and salary <=70000

select max(Salary),min(Salary),avg(Salary)
from Employee
--cast
select FirstName+' '+id
from Employee


select  Salary/5000 --on the fly
from Employee


--self study
--datatypes,db files(ldf,mdf,secondry)
--cast,aggregation function (date,string)
--count(*) table no pk



