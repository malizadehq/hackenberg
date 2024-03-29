USE [FOE]
GO
/****** Object:  Table [dbo].[DB_Rules]    Script Date: 02/14/2012 22:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_Rules]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_Rules](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Effect] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DB_Maps]    Script Date: 02/14/2012 22:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_Maps]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_Maps](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DB_Users]    Script Date: 02/14/2012 22:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_Users](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NULL,
 CONSTRAINT [PK__Users__3214EC0703317E3D] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DB_Countries]    Script Date: 02/14/2012 22:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_Countries]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_Countries](
	[Id] [uniqueidentifier] NOT NULL,
	[MapId] [uniqueidentifier] NOT NULL,
	[ControlledBy] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Points] [int] NOT NULL,
 CONSTRAINT [PK__Countrie__3214EC070EA330E9] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DB_Friends]    Script Date: 02/14/2012 22:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_Friends]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_Friends](
	[UserId] [uniqueidentifier] NOT NULL,
	[FriendId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[FriendId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DB_Games]    Script Date: 02/14/2012 22:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_Games]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_Games](
	[Id] [uniqueidentifier] NOT NULL,
	[MapId] [uniqueidentifier] NOT NULL,
	[GermanPlayer] [uniqueidentifier] NOT NULL,
	[JapanesePlayer] [uniqueidentifier] NOT NULL,
	[AmericanPlayer] [uniqueidentifier] NOT NULL,
	[EnglishPlayer] [uniqueidentifier] NOT NULL,
	[RussianPlayer] [uniqueidentifier] NOT NULL,
	[Phase] [int] NULL,
	[Turn] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__DB_Games__3214EC0738996AB5] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DB_Stats]    Script Date: 02/14/2012 22:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_Stats]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_Stats](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[GamesPlayed] [int] NULL,
	[InfantryKilled] [int] NULL,
	[TanksKilled] [int] NULL,
	[FightersKilled] [int] NULL,
	[BombersKilled] [int] NULL,
	[BattleshipsKilled] [int] NULL,
	[TransportsKilled] [int] NULL,
	[SubsKilled] [int] NULL,
	[GamesWon] [int] NULL,
	[GamesLost] [int] NULL,
	[InfantryLost] [int] NULL,
	[TanksLost] [int] NULL,
	[FightersLost] [int] NULL,
	[BombersLost] [int] NULL,
	[BattleshipsLost] [int] NULL,
	[TransportsLost] [int] NULL,
	[SubsLost] [int] NULL,
	[InfantryBuilt] [int] NULL,
	[TanksBuilt] [int] NULL,
	[FightersBuilt] [int] NULL,
	[BombersBuilt] [int] NULL,
	[BattleshipsBuilt] [int] NULL,
	[TransportsBuilt] [int] NULL,
	[SubsBuilt] [int] NULL,
	[MoneyEarned] [int] NULL,
	[MoneySpent] [int] NULL,
	[BattlesFought] [int] NULL,
	[BattlesWon] [int] NULL,
	[BattlesLost] [int] NULL,
	[InvasionsFought] [int] NULL,
	[InvasionsWon] [int] NULL,
	[InvasionsLost] [int] NULL,
	[CountriesLost] [int] NULL,
	[CountriesTaken] [int] NULL,
 CONSTRAINT [PK_DB_Stats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DB_LoginSessions]    Script Date: 02/14/2012 22:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_LoginSessions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_LoginSessions](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Timeout] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DB_Invites]    Script Date: 02/14/2012 22:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_Invites]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_Invites](
	[Id] [uniqueidentifier] NOT NULL,
	[InvitingUser] [uniqueidentifier] NULL,
	[InvitedUser] [uniqueidentifier] NULL,
	[Status] [int] NULL,
	[GameId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_DB_Invites] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DB_Structures]    Script Date: 02/14/2012 22:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_Structures]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_Structures](
	[Id] [uniqueidentifier] NOT NULL,
	[CountryId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Effect] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__Structur__3214EC073B75D760] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DB_GameRules]    Script Date: 02/14/2012 22:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_GameRules]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_GameRules](
	[RuleId] [uniqueidentifier] NOT NULL,
	[GameId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GameId] ASC,
	[RuleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DB_GameMembers]    Script Date: 02/14/2012 22:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_GameMembers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_GameMembers](
	[UserId] [uniqueidentifier] NOT NULL,
	[GameId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[GameId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DB_Forces]    Script Date: 02/14/2012 22:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_Forces]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_Forces](
	[Id] [uniqueidentifier] NOT NULL,
	[CountryId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DefenceStrength] [int] NOT NULL,
	[OffenceStrength] [int] NOT NULL,
 CONSTRAINT [PK__Forces__3214EC071273C1CD] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  ForeignKey [FK__Countries__Contr__20C1E124]    Script Date: 02/14/2012 22:46:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Countries__Contr__20C1E124]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Countries]'))
ALTER TABLE [dbo].[DB_Countries]  WITH CHECK ADD  CONSTRAINT [FK__Countries__Contr__20C1E124] FOREIGN KEY([ControlledBy])
REFERENCES [dbo].[DB_Users] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Countries__Contr__20C1E124]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Countries]'))
ALTER TABLE [dbo].[DB_Countries] CHECK CONSTRAINT [FK__Countries__Contr__20C1E124]
GO
/****** Object:  ForeignKey [FK__DB_Countr__MapId__20C1E124]    Script Date: 02/14/2012 22:46:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Countr__MapId__20C1E124]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Countries]'))
ALTER TABLE [dbo].[DB_Countries]  WITH CHECK ADD FOREIGN KEY([MapId])
REFERENCES [dbo].[DB_Maps] ([Id])
GO
/****** Object:  ForeignKey [FK__DB_Forces__Count__571DF1D5]    Script Date: 02/14/2012 22:46:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Forces__Count__571DF1D5]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Forces]'))
ALTER TABLE [dbo].[DB_Forces]  WITH CHECK ADD  CONSTRAINT [FK__DB_Forces__Count__571DF1D5] FOREIGN KEY([CountryId])
REFERENCES [dbo].[DB_Countries] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Forces__Count__571DF1D5]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Forces]'))
ALTER TABLE [dbo].[DB_Forces] CHECK CONSTRAINT [FK__DB_Forces__Count__571DF1D5]
GO
/****** Object:  ForeignKey [FK__DB_Friend__Frien__3E52440B]    Script Date: 02/14/2012 22:46:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Friend__Frien__3E52440B]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Friends]'))
ALTER TABLE [dbo].[DB_Friends]  WITH CHECK ADD FOREIGN KEY([FriendId])
REFERENCES [dbo].[DB_Users] ([Id])
GO
/****** Object:  ForeignKey [FK__DB_Friend__UserI__3D5E1FD2]    Script Date: 02/14/2012 22:46:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Friend__UserI__3D5E1FD2]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Friends]'))
ALTER TABLE [dbo].[DB_Friends]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[DB_Users] ([Id])
GO
/****** Object:  ForeignKey [FK__DB_GameMe__GameI__33D4B598]    Script Date: 02/14/2012 22:46:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_GameMe__GameI__33D4B598]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_GameMembers]'))
ALTER TABLE [dbo].[DB_GameMembers]  WITH CHECK ADD FOREIGN KEY([GameId])
REFERENCES [dbo].[DB_Games] ([Id])
GO
/****** Object:  ForeignKey [FK__DB_GameMe__UserI__32E0915F]    Script Date: 02/14/2012 22:46:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_GameMe__UserI__32E0915F]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_GameMembers]'))
ALTER TABLE [dbo].[DB_GameMembers]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[DB_Users] ([Id])
GO
/****** Object:  ForeignKey [FK__DB_GameRu__GameI__4316F928]    Script Date: 02/14/2012 22:46:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_GameRu__GameI__4316F928]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_GameRules]'))
ALTER TABLE [dbo].[DB_GameRules]  WITH CHECK ADD  CONSTRAINT [FK__DB_GameRu__GameI__4316F928] FOREIGN KEY([GameId])
REFERENCES [dbo].[DB_Games] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_GameRu__GameI__4316F928]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_GameRules]'))
ALTER TABLE [dbo].[DB_GameRules] CHECK CONSTRAINT [FK__DB_GameRu__GameI__4316F928]
GO
/****** Object:  ForeignKey [FK__DB_GameRu__RuleI__239E4DCF]    Script Date: 02/14/2012 22:46:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_GameRu__RuleI__239E4DCF]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_GameRules]'))
ALTER TABLE [dbo].[DB_GameRules]  WITH CHECK ADD FOREIGN KEY([RuleId])
REFERENCES [dbo].[DB_Rules] ([Id])
GO
/****** Object:  ForeignKey [FK__DB_Games__Americ__3F466844]    Script Date: 02/14/2012 22:46:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Games__Americ__3F466844]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games]  WITH CHECK ADD  CONSTRAINT [FK__DB_Games__Americ__3F466844] FOREIGN KEY([AmericanPlayer])
REFERENCES [dbo].[DB_Users] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Games__Americ__3F466844]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games] CHECK CONSTRAINT [FK__DB_Games__Americ__3F466844]
GO
/****** Object:  ForeignKey [FK__DB_Games__Englis__403A8C7D]    Script Date: 02/14/2012 22:46:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Games__Englis__403A8C7D]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games]  WITH CHECK ADD  CONSTRAINT [FK__DB_Games__Englis__403A8C7D] FOREIGN KEY([EnglishPlayer])
REFERENCES [dbo].[DB_Users] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Games__Englis__403A8C7D]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games] CHECK CONSTRAINT [FK__DB_Games__Englis__403A8C7D]
GO
/****** Object:  ForeignKey [FK__DB_Games__German__3D5E1FD2]    Script Date: 02/14/2012 22:46:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Games__German__3D5E1FD2]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games]  WITH CHECK ADD  CONSTRAINT [FK__DB_Games__German__3D5E1FD2] FOREIGN KEY([GermanPlayer])
REFERENCES [dbo].[DB_Users] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Games__German__3D5E1FD2]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games] CHECK CONSTRAINT [FK__DB_Games__German__3D5E1FD2]
GO
/****** Object:  ForeignKey [FK__DB_Games__Japane__286302EC]    Script Date: 02/14/2012 22:46:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Games__Japane__286302EC]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games]  WITH CHECK ADD FOREIGN KEY([JapanesePlayer])
REFERENCES [dbo].[DB_Users] ([Id])
GO
/****** Object:  ForeignKey [FK__DB_Games__MapId__3B75D760]    Script Date: 02/14/2012 22:46:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Games__MapId__3B75D760]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games]  WITH CHECK ADD  CONSTRAINT [FK__DB_Games__MapId__3B75D760] FOREIGN KEY([MapId])
REFERENCES [dbo].[DB_Maps] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Games__MapId__3B75D760]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games] CHECK CONSTRAINT [FK__DB_Games__MapId__3B75D760]
GO
/****** Object:  ForeignKey [FK__DB_Games__Russia__412EB0B6]    Script Date: 02/14/2012 22:46:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Games__Russia__412EB0B6]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games]  WITH CHECK ADD  CONSTRAINT [FK__DB_Games__Russia__412EB0B6] FOREIGN KEY([RussianPlayer])
REFERENCES [dbo].[DB_Users] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Games__Russia__412EB0B6]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games] CHECK CONSTRAINT [FK__DB_Games__Russia__412EB0B6]
GO
/****** Object:  ForeignKey [FK__DB_Invite__GameI__37A5467C]    Script Date: 02/14/2012 22:46:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Invite__GameI__37A5467C]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Invites]'))
ALTER TABLE [dbo].[DB_Invites]  WITH CHECK ADD FOREIGN KEY([GameId])
REFERENCES [dbo].[DB_Games] ([Id])
GO
/****** Object:  ForeignKey [FK__DB_Invite__Invit__2E1BDC42]    Script Date: 02/14/2012 22:46:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Invite__Invit__2E1BDC42]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Invites]'))
ALTER TABLE [dbo].[DB_Invites]  WITH CHECK ADD FOREIGN KEY([InvitedUser])
REFERENCES [dbo].[DB_Users] ([Id])
GO
/****** Object:  ForeignKey [FK__DB_Invite__Invit__2F10007B]    Script Date: 02/14/2012 22:46:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Invite__Invit__2F10007B]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Invites]'))
ALTER TABLE [dbo].[DB_Invites]  WITH CHECK ADD FOREIGN KEY([InvitingUser])
REFERENCES [dbo].[DB_Users] ([Id])
GO
/****** Object:  ForeignKey [FK__DB_LoginS__UserI__300424B4]    Script Date: 02/14/2012 22:46:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_LoginS__UserI__300424B4]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_LoginSessions]'))
ALTER TABLE [dbo].[DB_LoginSessions]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[DB_Users] ([Id])
GO
/****** Object:  ForeignKey [FK__DB_Stats__UserId__3B75D760]    Script Date: 02/14/2012 22:46:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Stats__UserId__3B75D760]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Stats]'))
ALTER TABLE [dbo].[DB_Stats]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[DB_Users] ([Id])
GO
/****** Object:  ForeignKey [FK__DB_Struct__Count__5812160E]    Script Date: 02/14/2012 22:46:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Struct__Count__5812160E]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Structures]'))
ALTER TABLE [dbo].[DB_Structures]  WITH CHECK ADD  CONSTRAINT [FK__DB_Struct__Count__5812160E] FOREIGN KEY([CountryId])
REFERENCES [dbo].[DB_Countries] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Struct__Count__5812160E]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Structures]'))
ALTER TABLE [dbo].[DB_Structures] CHECK CONSTRAINT [FK__DB_Struct__Count__5812160E]
GO


/* Hard Coded default values that will always be in the database as mock values. */

IF NOT EXISTS (SELECT * FROM dbo.DB_Users WHERE Id = '{00000000-0000-0000-0000-000000000001}')
BEGIN
INSERT INTO dbo.DB_Users
VALUES('{00000000-0000-0000-0000-000000000001}', 'Mock_User', 'password')
END

IF NOT EXISTS (SELECT * FROM dbo.DB_Maps WHERE Id = '{00000000-0000-0000-0000-000000000001}')
BEGIN
INSERT INTO dbo.DB_Maps
VALUES('{00000000-0000-0000-0000-000000000001}', 'DefaultMap')
END