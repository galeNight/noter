USE [DatingApp]
GO


CREATE TABLE [dbo].[UserProfile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[BirthDate] [datetime] NOT NULL,
	[Height] [int] NOT NULL,
	[AboutMe] [nvarchar](255) NULL,
	[CityId] [int] NULL,
	[GenderId] [int] NULL,
	[UsersId] [int] NULL
	)


ALTER TABLE [dbo].[UserProfile] ADD  DEFAULT ((0)) FOR [Height]
GO

ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO

ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD FOREIGN KEY([GenderId])
REFERENCES [dbo].[Gender] ([Id])
GO

ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD FOREIGN KEY([UsersId])
REFERENCES [dbo].[Account] ([Id])
GO

ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD CHECK  (([BirthDate]<=dateadd(year,(-18),getdate())))
GO


