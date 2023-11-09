create table Account(
UserId int identity(1,1) primary key,
Username nvarchar(50) not null,
Password1 nvarchar(50) not null,
Email nvarchar(50),
Userrole nvarchar(50)
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