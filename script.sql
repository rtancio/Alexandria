USE [alexandria]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 02/06/2010 22:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[ImageUrl] [nvarchar](255) NOT NULL,
	[Image] [varbinary](max) NOT NULL,
	[Author] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 02/06/2010 22:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02/06/2010 22:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Street] [nvarchar](255) NULL,
	[Country] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ZipCode] [nvarchar](255) NULL,
	[HouseNumber] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hibernate_unique_key]    Script Date: 02/06/2010 22:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hibernate_unique_key](
	[next_hi] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersWaitingBooks]    Script Date: 02/06/2010 22:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersWaitingBooks](
	[User] [bigint] NOT NULL,
	[Book] [bigint] NOT NULL,
	[Index] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[User] ASC,
	[Index] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersRecommendedBooks]    Script Date: 02/06/2010 22:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersRecommendedBooks](
	[User] [bigint] NOT NULL,
	[Book] [bigint] NOT NULL,
	[Index] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[User] ASC,
	[Index] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersReadingBooks]    Script Date: 02/06/2010 22:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersReadingBooks](
	[Book] [bigint] NOT NULL,
	[User] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[User] ASC,
	[Book] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BooksAuthors]    Script Date: 02/06/2010 22:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BooksAuthors](
	[Book] [bigint] NOT NULL,
	[Author] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Book] ASC,
	[Author] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscriptions]    Script Date: 02/06/2010 22:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscriptions](
	[Id] [bigint] NOT NULL,
	[NumberOfPossibleBooksOut] [int] NOT NULL,
	[CreditCard] [nvarchar](255) NOT NULL,
	[MonthlyCost] [decimal](19, 5) NOT NULL,
	[Start] [datetime] NOT NULL,
	[End] [datetime] NOT NULL,
	[User] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FKBF5E66AF26F632C9]    Script Date: 02/06/2010 22:45:46 ******/
ALTER TABLE [dbo].[BooksAuthors]  WITH CHECK ADD  CONSTRAINT [FKBF5E66AF26F632C9] FOREIGN KEY([Book])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[BooksAuthors] CHECK CONSTRAINT [FKBF5E66AF26F632C9]
GO
/****** Object:  ForeignKey [FKBF5E66AF4CBDFC5D]    Script Date: 02/06/2010 22:45:46 ******/
ALTER TABLE [dbo].[BooksAuthors]  WITH CHECK ADD  CONSTRAINT [FKBF5E66AF4CBDFC5D] FOREIGN KEY([Author])
REFERENCES [dbo].[Authors] ([Id])
GO
ALTER TABLE [dbo].[BooksAuthors] CHECK CONSTRAINT [FKBF5E66AF4CBDFC5D]
GO
/****** Object:  ForeignKey [FKCA9B8A3CB63F0675]    Script Date: 02/06/2010 22:45:46 ******/
ALTER TABLE [dbo].[BooksAuthors]  WITH CHECK ADD  CONSTRAINT [FKCA9B8A3CB63F0675] FOREIGN KEY([Book])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[BooksAuthors] CHECK CONSTRAINT [FKCA9B8A3CB63F0675]
GO
/****** Object:  ForeignKey [FKCA9B8A3CD9009E55]    Script Date: 02/06/2010 22:45:46 ******/
ALTER TABLE [dbo].[BooksAuthors]  WITH CHECK ADD  CONSTRAINT [FKCA9B8A3CD9009E55] FOREIGN KEY([Author])
REFERENCES [dbo].[Authors] ([Id])
GO
ALTER TABLE [dbo].[BooksAuthors] CHECK CONSTRAINT [FKCA9B8A3CD9009E55]
GO
/****** Object:  ForeignKey [FKAC7E7D546BDD1425]    Script Date: 02/06/2010 22:45:46 ******/
ALTER TABLE [dbo].[Subscriptions]  WITH CHECK ADD  CONSTRAINT [FKAC7E7D546BDD1425] FOREIGN KEY([User])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FKAC7E7D546BDD1425]
GO
/****** Object:  ForeignKey [FK2AEDA86BDD1425]    Script Date: 02/06/2010 22:45:46 ******/
ALTER TABLE [dbo].[UsersReadingBooks]  WITH CHECK ADD  CONSTRAINT [FK2AEDA86BDD1425] FOREIGN KEY([User])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UsersReadingBooks] CHECK CONSTRAINT [FK2AEDA86BDD1425]
GO
/****** Object:  ForeignKey [FK2AEDA8B63F0675]    Script Date: 02/06/2010 22:45:46 ******/
ALTER TABLE [dbo].[UsersReadingBooks]  WITH CHECK ADD  CONSTRAINT [FK2AEDA8B63F0675] FOREIGN KEY([Book])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[UsersReadingBooks] CHECK CONSTRAINT [FK2AEDA8B63F0675]
GO
/****** Object:  ForeignKey [FKC217F9D426F632C9]    Script Date: 02/06/2010 22:45:46 ******/
ALTER TABLE [dbo].[UsersReadingBooks]  WITH CHECK ADD  CONSTRAINT [FKC217F9D426F632C9] FOREIGN KEY([Book])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[UsersReadingBooks] CHECK CONSTRAINT [FKC217F9D426F632C9]
GO
/****** Object:  ForeignKey [FKC217F9D42708A597]    Script Date: 02/06/2010 22:45:46 ******/
ALTER TABLE [dbo].[UsersReadingBooks]  WITH CHECK ADD  CONSTRAINT [FKC217F9D42708A597] FOREIGN KEY([User])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UsersReadingBooks] CHECK CONSTRAINT [FKC217F9D42708A597]
GO
/****** Object:  ForeignKey [FK49F2C02E26F632B0]    Script Date: 02/06/2010 22:45:46 ******/
ALTER TABLE [dbo].[UsersRecommendedBooks]  WITH CHECK ADD  CONSTRAINT [FK49F2C02E26F632B0] FOREIGN KEY([Book])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[UsersRecommendedBooks] CHECK CONSTRAINT [FK49F2C02E26F632B0]
GO
/****** Object:  ForeignKey [FK49F2C02E2708B591]    Script Date: 02/06/2010 22:45:46 ******/
ALTER TABLE [dbo].[UsersRecommendedBooks]  WITH CHECK ADD  CONSTRAINT [FK49F2C02E2708B591] FOREIGN KEY([User])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UsersRecommendedBooks] CHECK CONSTRAINT [FK49F2C02E2708B591]
GO
/****** Object:  ForeignKey [FKF207F7916BDD1425]    Script Date: 02/06/2010 22:45:46 ******/
ALTER TABLE [dbo].[UsersRecommendedBooks]  WITH CHECK ADD  CONSTRAINT [FKF207F7916BDD1425] FOREIGN KEY([User])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UsersRecommendedBooks] CHECK CONSTRAINT [FKF207F7916BDD1425]
GO
/****** Object:  ForeignKey [FKF207F791B63F0675]    Script Date: 02/06/2010 22:45:46 ******/
ALTER TABLE [dbo].[UsersRecommendedBooks]  WITH CHECK ADD  CONSTRAINT [FKF207F791B63F0675] FOREIGN KEY([Book])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[UsersRecommendedBooks] CHECK CONSTRAINT [FKF207F791B63F0675]
GO
/****** Object:  ForeignKey [FK49F2C02E26F632C9]    Script Date: 02/06/2010 22:45:46 ******/
ALTER TABLE [dbo].[UsersWaitingBooks]  WITH CHECK ADD  CONSTRAINT [FK49F2C02E26F632C9] FOREIGN KEY([Book])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[UsersWaitingBooks] CHECK CONSTRAINT [FK49F2C02E26F632C9]
GO
/****** Object:  ForeignKey [FK49F2C02E2708A597]    Script Date: 02/06/2010 22:45:46 ******/
ALTER TABLE [dbo].[UsersWaitingBooks]  WITH CHECK ADD  CONSTRAINT [FK49F2C02E2708A597] FOREIGN KEY([User])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UsersWaitingBooks] CHECK CONSTRAINT [FK49F2C02E2708A597]
GO
/****** Object:  ForeignKey [FKE0B262536BDD1425]    Script Date: 02/06/2010 22:45:46 ******/
ALTER TABLE [dbo].[UsersWaitingBooks]  WITH CHECK ADD  CONSTRAINT [FKE0B262536BDD1425] FOREIGN KEY([User])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UsersWaitingBooks] CHECK CONSTRAINT [FKE0B262536BDD1425]
GO
/****** Object:  ForeignKey [FKE0B26253B63F0675]    Script Date: 02/06/2010 22:45:46 ******/
ALTER TABLE [dbo].[UsersWaitingBooks]  WITH CHECK ADD  CONSTRAINT [FKE0B26253B63F0675] FOREIGN KEY([Book])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[UsersWaitingBooks] CHECK CONSTRAINT [FKE0B26253B63F0675]
GO
