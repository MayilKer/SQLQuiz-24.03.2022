Create Database Academy
use academy
Create table Groups(
Id int identity Primary key,
Name nvarchar(25)

)
Create table Students(
Id int identity Primary key,
Name nvarchar(25),
Surname nvarchar(25),
GroupId int  references Groups 

)
Alter table Students
Add Grade int

Insert into Groups(Name)
VALUES('P224'),
('P124'),
('P221')
Insert into Students(Name,Surname,GroupId)
vALUES('Altan','Ibrahimli',1),
('Metin','Agayev',2),
('Mayil','Kerimov',3),
('Ferid','Aliyev',3)

Select * from Students s inner Join Groups g on s.GroupId = g.Id where g.Name='P224'
Select g.Name,Count(s.Id)  as [say] from Students s inner join Groups g on  s.GroupId = g.ID group by g.Name
Create view usv_GroupV
AS
Select s.Name,s.Surname,g.Id as [Qrup],s.Grade from Students s join Groups g on s.GroupId = g.Id
select * from usv_GroupV
create procedure usp_Check
@Grade int 
as
begin
select* from Students where Grade>@Grade
end
exec usp_Check 30
