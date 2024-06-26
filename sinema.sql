USE [master]
GO
/****** Object:  Database [Sinema]    Script Date: 28.03.2024 13:58:50 ******/
CREATE DATABASE [Sinema]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sinema', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Sinema.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sinema_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Sinema_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Sinema] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sinema].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sinema] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sinema] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sinema] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sinema] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sinema] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sinema] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sinema] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sinema] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sinema] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sinema] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sinema] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sinema] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sinema] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sinema] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sinema] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sinema] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sinema] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sinema] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sinema] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sinema] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sinema] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sinema] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sinema] SET RECOVERY FULL 
GO
ALTER DATABASE [Sinema] SET  MULTI_USER 
GO
ALTER DATABASE [Sinema] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sinema] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sinema] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sinema] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sinema] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sinema] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sinema', N'ON'
GO
ALTER DATABASE [Sinema] SET QUERY_STORE = ON
GO
ALTER DATABASE [Sinema] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Sinema]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 28.03.2024 13:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieCategory]    Script Date: 28.03.2024 13:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieCategory](
	[MovieId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_MovieCategory] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 28.03.2024 13:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MovieName] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Duration] [smallint] NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Saloons]    Script Date: 28.03.2024 13:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Saloons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SalonName] [nvarchar](50) NOT NULL,
	[Capacity] [int] NOT NULL,
 CONSTRAINT [PK_Saloons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 28.03.2024 13:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Session] [time](7) NULL,
 CONSTRAINT [PK_Sessions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Theatres]    Script Date: 28.03.2024 13:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Theatres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NULL,
	[SaloonId] [int] NULL,
	[SessionId] [int] NULL,
	[WeekId] [int] NULL,
 CONSTRAINT [PK_Theatres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Weeks]    Script Date: 28.03.2024 13:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weeks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Week] [varchar](50) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_Weeks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (1, N'Crime')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (2, N'Drama')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (3, N'Adventure')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (4, N'Comedy')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (5, N'Sci-Fi')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (6, N'Action')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (7, N'Animation')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (8, N'Fantasy')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[MovieCategory] ([MovieId], [CategoryId]) VALUES (1, 1)
INSERT [dbo].[MovieCategory] ([MovieId], [CategoryId]) VALUES (1, 2)
INSERT [dbo].[MovieCategory] ([MovieId], [CategoryId]) VALUES (2, 3)
INSERT [dbo].[MovieCategory] ([MovieId], [CategoryId]) VALUES (2, 4)
INSERT [dbo].[MovieCategory] ([MovieId], [CategoryId]) VALUES (2, 5)
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([Id], [MovieName], [Description], [Duration]) VALUES (1, N'The Shawshank Redemption', N'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 142)
INSERT [dbo].[Movies] ([Id], [MovieName], [Description], [Duration]) VALUES (2, N'Back to the Future', N'Marty McFly, a 17-year-old high school student, is accidentally sent 30 years into the past in a time-traveling DeLorean invented by his close friend, the maverick scientist Doc Brown.', 150)
INSERT [dbo].[Movies] ([Id], [MovieName], [Description], [Duration]) VALUES (3, N'Forrest Gump', N'Forrest Gump, while not intelligent, has accidentally been present at many historic moments, but his true love, Jenny Curran, eludes him.', 130)
INSERT [dbo].[Movies] ([Id], [MovieName], [Description], [Duration]) VALUES (4, N'Fight Club', N'An insomniac office worker, looking for a way to change his life, crosses paths with a devil-may-care soap maker, forming an underground fight club that evolves into something much, much more.', 145)
INSERT [dbo].[Movies] ([Id], [MovieName], [Description], [Duration]) VALUES (5, N'The Lion King', N'Lion cub and future king Simba searches for his identity. His eagerness to please others and penchant for testing his boundaries sometimes gets him into trouble.', 14)
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[Saloons] ON 

INSERT [dbo].[Saloons] ([Id], [SalonName], [Capacity]) VALUES (1, N'A', 40)
INSERT [dbo].[Saloons] ([Id], [SalonName], [Capacity]) VALUES (2, N'B', 58)
INSERT [dbo].[Saloons] ([Id], [SalonName], [Capacity]) VALUES (3, N'C', 94)
INSERT [dbo].[Saloons] ([Id], [SalonName], [Capacity]) VALUES (4, N'D', 72)
SET IDENTITY_INSERT [dbo].[Saloons] OFF
GO
SET IDENTITY_INSERT [dbo].[Sessions] ON 

INSERT [dbo].[Sessions] ([Id], [Session]) VALUES (1, CAST(N'11:00:00' AS Time))
INSERT [dbo].[Sessions] ([Id], [Session]) VALUES (2, CAST(N'12:00:00' AS Time))
INSERT [dbo].[Sessions] ([Id], [Session]) VALUES (3, CAST(N'13:30:00' AS Time))
INSERT [dbo].[Sessions] ([Id], [Session]) VALUES (4, CAST(N'14:00:00' AS Time))
INSERT [dbo].[Sessions] ([Id], [Session]) VALUES (5, CAST(N'15:00:00' AS Time))
INSERT [dbo].[Sessions] ([Id], [Session]) VALUES (6, CAST(N'16:00:00' AS Time))
INSERT [dbo].[Sessions] ([Id], [Session]) VALUES (7, CAST(N'17:00:00' AS Time))
INSERT [dbo].[Sessions] ([Id], [Session]) VALUES (8, CAST(N'18:30:00' AS Time))
INSERT [dbo].[Sessions] ([Id], [Session]) VALUES (9, CAST(N'19:00:00' AS Time))
INSERT [dbo].[Sessions] ([Id], [Session]) VALUES (10, CAST(N'20:00:00' AS Time))
INSERT [dbo].[Sessions] ([Id], [Session]) VALUES (11, CAST(N'21:00:00' AS Time))
INSERT [dbo].[Sessions] ([Id], [Session]) VALUES (12, CAST(N'21:30:00' AS Time))
SET IDENTITY_INSERT [dbo].[Sessions] OFF
GO
SET IDENTITY_INSERT [dbo].[Theatres] ON 

INSERT [dbo].[Theatres] ([Id], [MovieId], [SaloonId], [SessionId], [WeekId]) VALUES (1, 1, 1, 1, 1)
INSERT [dbo].[Theatres] ([Id], [MovieId], [SaloonId], [SessionId], [WeekId]) VALUES (5, 1, 2, 1, 1)
INSERT [dbo].[Theatres] ([Id], [MovieId], [SaloonId], [SessionId], [WeekId]) VALUES (12, 2, 1, 1, 2)
INSERT [dbo].[Theatres] ([Id], [MovieId], [SaloonId], [SessionId], [WeekId]) VALUES (8, 3, 3, 1, 1)
INSERT [dbo].[Theatres] ([Id], [MovieId], [SaloonId], [SessionId], [WeekId]) VALUES (9, 3, 3, 4, 1)
INSERT [dbo].[Theatres] ([Id], [MovieId], [SaloonId], [SessionId], [WeekId]) VALUES (10, 3, 3, 4, 2)
SET IDENTITY_INSERT [dbo].[Theatres] OFF
GO
SET IDENTITY_INSERT [dbo].[Weeks] ON 

INSERT [dbo].[Weeks] ([Id], [Week], [StartDate], [EndDate]) VALUES (1, N'W32', CAST(N'2016-08-08' AS Date), CAST(N'2016-08-14' AS Date))
INSERT [dbo].[Weeks] ([Id], [Week], [StartDate], [EndDate]) VALUES (2, N'W33', CAST(N'2016-08-15' AS Date), CAST(N'2016-08-21' AS Date))
INSERT [dbo].[Weeks] ([Id], [Week], [StartDate], [EndDate]) VALUES (3, N'W34', CAST(N'2016-08-22' AS Date), CAST(N'2016-08-28' AS Date))
SET IDENTITY_INSERT [dbo].[Weeks] OFF
GO
/****** Object:  Index [IX_Theatres]    Script Date: 28.03.2024 13:58:51 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Theatres] ON [dbo].[Theatres]
(
	[MovieId] ASC,
	[SaloonId] ASC,
	[SessionId] ASC,
	[WeekId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Theatres_1]    Script Date: 28.03.2024 13:58:51 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Theatres_1] ON [dbo].[Theatres]
(
	[SaloonId] ASC,
	[SessionId] ASC,
	[WeekId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MovieCategory]  WITH CHECK ADD  CONSTRAINT [FK_MovieCategory_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[MovieCategory] CHECK CONSTRAINT [FK_MovieCategory_Categories]
GO
ALTER TABLE [dbo].[MovieCategory]  WITH CHECK ADD  CONSTRAINT [FK_MovieCategory_Movies] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
GO
ALTER TABLE [dbo].[MovieCategory] CHECK CONSTRAINT [FK_MovieCategory_Movies]
GO
ALTER TABLE [dbo].[Theatres]  WITH CHECK ADD  CONSTRAINT [FK_Theatres_Movies] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
GO
ALTER TABLE [dbo].[Theatres] CHECK CONSTRAINT [FK_Theatres_Movies]
GO
ALTER TABLE [dbo].[Theatres]  WITH CHECK ADD  CONSTRAINT [FK_Theatres_Saloons] FOREIGN KEY([SaloonId])
REFERENCES [dbo].[Saloons] ([Id])
GO
ALTER TABLE [dbo].[Theatres] CHECK CONSTRAINT [FK_Theatres_Saloons]
GO
ALTER TABLE [dbo].[Theatres]  WITH CHECK ADD  CONSTRAINT [FK_Theatres_Sessions] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Sessions] ([Id])
GO
ALTER TABLE [dbo].[Theatres] CHECK CONSTRAINT [FK_Theatres_Sessions]
GO
ALTER TABLE [dbo].[Theatres]  WITH CHECK ADD  CONSTRAINT [FK_Theatres_Weeks] FOREIGN KEY([WeekId])
REFERENCES [dbo].[Weeks] ([Id])
GO
ALTER TABLE [dbo].[Theatres] CHECK CONSTRAINT [FK_Theatres_Weeks]
GO
USE [master]
GO
ALTER DATABASE [Sinema] SET  READ_WRITE 
GO
