use DatingApp
go
create table Account(
UserId int identity(1,1) primary key,
Username nvarchar(50) not null,
Password1 nvarchar(50) not null,
Email nvarchar(50),
Userrole nvarchar(50)
)
go
create table city(
Cityid int primary key,
city nvarchar(50) not null
)
go
create table Gender(
Genderid int identity(1,1) primary key,
gender nvarchar(50) not null
)
go
Create table UserProfile(
Id int identity(1,1) primary key NOT NULL,
Username nvarchar(50) NOT NULL,
Brithdate datetime NOT NULL,
Height nvarchar(50) NOT NULL,
Aboutme nvarchar(255) null,
Cityid int null,
Genderid int null,
UserId int not null,
foreign key (Cityid) references City(Cityid),
foreign key (Genderid) references Gender(Genderid),
foreign key (USerId) references Account(UserId)
)









go
create proc Addacount
@Username NVARCHAR(50),
@Password1 NVARCHAR(50),
@Email NVARCHAR(50),
@Userrole NVARCHAR(50)
as
begin
insert into Account (Username,Password1,Email,UserRole)
values (@Username,@Password1, @Email,@Userrole)
end

go
create proc Authenticateuser
@Username nvarchar(50),
@Password1 nvarchar(50)
as
begin
select UserId,Username,Userrole
from Account
where Username =@Username and Password1=@Password1
end