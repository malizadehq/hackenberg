USE [Hackenberg]
GO
/****** Object:  Table [dbo].[DB_Users]    Script Date: 01/26/2012 13:02:38 ******/
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
 CONSTRAINT [PK__Users__3214EC0703317E3D] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DB_Rules]    Script Date: 01/26/2012 13:02:38 ******/
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
/****** Object:  Table [dbo].[DB_Maps]    Script Date: 01/26/2012 13:02:38 ******/
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
/****** Object:  Table [dbo].[DB_GameSessions]    Script Date: 01/26/2012 13:02:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_GameSessions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_GameSessions](
	[Id] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DB_GameSessionMembers]    Script Date: 01/26/2012 13:02:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_GameSessionMembers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_GameSessionMembers](
	[SessionId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DB_Games]    Script Date: 01/26/2012 13:02:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_Games]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_Games](
	[Id] [uniqueidentifier] NOT NULL,
	[GameSessionId] [uniqueidentifier] NOT NULL,
	[MapId] [uniqueidentifier] NOT NULL,
	[Phase] [int] NULL,
	[Turn] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[GermanPlayer] [uniqueidentifier] NOT NULL,
	[JapanesePlayer] [uniqueidentifier] NOT NULL,
	[AmericanPlayer] [uniqueidentifier] NOT NULL,
	[EnglishPlayer] [uniqueidentifier] NOT NULL,
	[RussianPlayer] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__Games__3214EC070AD2A005] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DB_Countries]    Script Date: 01/26/2012 13:02:38 ******/
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
/****** Object:  Table [dbo].[DB_Structures]    Script Date: 01/26/2012 13:02:38 ******/
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
/****** Object:  Table [dbo].[DB_GameRules]    Script Date: 01/26/2012 13:02:38 ******/
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
/****** Object:  Table [dbo].[DB_Forces]    Script Date: 01/26/2012 13:02:38 ******/
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
/****** Object:  ForeignKey [FK__Countries__Contr__20C1E124]    Script Date: 01/26/2012 13:02:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Countries__Contr__20C1E124]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Countries]'))
ALTER TABLE [dbo].[DB_Countries]  WITH CHECK ADD  CONSTRAINT [FK__Countries__Contr__20C1E124] FOREIGN KEY([ControlledBy])
REFERENCES [dbo].[DB_Users] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Countries__Contr__20C1E124]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Countries]'))
ALTER TABLE [dbo].[DB_Countries] CHECK CONSTRAINT [FK__Countries__Contr__20C1E124]
GO
/****** Object:  ForeignKey [FK__DB_Countr__MapId__5DCAEF64]    Script Date: 01/26/2012 13:02:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Countr__MapId__5DCAEF64]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Countries]'))
ALTER TABLE [dbo].[DB_Countries]  WITH CHECK ADD FOREIGN KEY([MapId])
REFERENCES [dbo].[DB_Maps] ([Id])
GO
/****** Object:  ForeignKey [FK__DB_Forces__Count__571DF1D5]    Script Date: 01/26/2012 13:02:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Forces__Count__571DF1D5]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Forces]'))
ALTER TABLE [dbo].[DB_Forces]  WITH CHECK ADD  CONSTRAINT [FK__DB_Forces__Count__571DF1D5] FOREIGN KEY([CountryId])
REFERENCES [dbo].[DB_Countries] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Forces__Count__571DF1D5]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Forces]'))
ALTER TABLE [dbo].[DB_Forces] CHECK CONSTRAINT [FK__DB_Forces__Count__571DF1D5]
GO
/****** Object:  ForeignKey [FK__GameRules__GameI__267ABA7A]    Script Date: 01/26/2012 13:02:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__GameRules__GameI__267ABA7A]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_GameRules]'))
ALTER TABLE [dbo].[DB_GameRules]  WITH CHECK ADD  CONSTRAINT [FK__GameRules__GameI__267ABA7A] FOREIGN KEY([GameId])
REFERENCES [dbo].[DB_Games] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__GameRules__GameI__267ABA7A]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_GameRules]'))
ALTER TABLE [dbo].[DB_GameRules] CHECK CONSTRAINT [FK__GameRules__GameI__267ABA7A]
GO
/****** Object:  ForeignKey [FK__GameRules__RuleI__276EDEB3]    Script Date: 01/26/2012 13:02:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__GameRules__RuleI__276EDEB3]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_GameRules]'))
ALTER TABLE [dbo].[DB_GameRules]  WITH CHECK ADD FOREIGN KEY([RuleId])
REFERENCES [dbo].[DB_Rules] ([Id])
GO
/****** Object:  ForeignKey [FK__DB_Games__Americ__66603565]    Script Date: 01/26/2012 13:02:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Games__Americ__66603565]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games]  WITH CHECK ADD FOREIGN KEY([AmericanPlayer])
REFERENCES [dbo].[DB_Users] ([Id])
GO
/****** Object:  ForeignKey [FK__DB_Games__Englis__6754599E]    Script Date: 01/26/2012 13:02:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Games__Englis__6754599E]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games]  WITH CHECK ADD FOREIGN KEY([EnglishPlayer])
REFERENCES [dbo].[DB_Users] ([Id])
GO
/****** Object:  ForeignKey [FK__DB_Games__GameSe__52593CB8]    Script Date: 01/26/2012 13:02:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Games__GameSe__52593CB8]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games]  WITH CHECK ADD  CONSTRAINT [FK__DB_Games__GameSe__52593CB8] FOREIGN KEY([GameSessionId])
REFERENCES [dbo].[DB_GameSessions] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Games__GameSe__52593CB8]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games] CHECK CONSTRAINT [FK__DB_Games__GameSe__52593CB8]
GO
/****** Object:  ForeignKey [FK__DB_Games__German__6477ECF3]    Script Date: 01/26/2012 13:02:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Games__German__6477ECF3]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games]  WITH CHECK ADD FOREIGN KEY([GermanPlayer])
REFERENCES [dbo].[DB_Users] ([Id])
GO
/****** Object:  ForeignKey [FK__DB_Games__Japane__656C112C]    Script Date: 01/26/2012 13:02:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Games__Japane__656C112C]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games]  WITH CHECK ADD FOREIGN KEY([JapanesePlayer])
REFERENCES [dbo].[DB_Users] ([Id])
GO
/****** Object:  ForeignKey [FK__DB_Games__Russia__68487DD7]    Script Date: 01/26/2012 13:02:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Games__Russia__68487DD7]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games]  WITH CHECK ADD FOREIGN KEY([RussianPlayer])
REFERENCES [dbo].[DB_Users] ([Id])
GO
/****** Object:  ForeignKey [FK__Games__MapId__38996AB5]    Script Date: 01/26/2012 13:02:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Games__MapId__38996AB5]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games]  WITH CHECK ADD  CONSTRAINT [FK__Games__MapId__38996AB5] FOREIGN KEY([MapId])
REFERENCES [dbo].[DB_Maps] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Games__MapId__38996AB5]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games] CHECK CONSTRAINT [FK__Games__MapId__38996AB5]
GO
/****** Object:  ForeignKey [FK__Games__SessionId__1920BF5C]    Script Date: 01/26/2012 13:02:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Games__SessionId__1920BF5C]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games]  WITH CHECK ADD  CONSTRAINT [FK__Games__SessionId__1920BF5C] FOREIGN KEY([GameSessionId])
REFERENCES [dbo].[DB_GameSessions] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Games__SessionId__1920BF5C]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games] CHECK CONSTRAINT [FK__Games__SessionId__1920BF5C]
GO
/****** Object:  ForeignKey [FK__SessionMe__Sessi__060DEAE8]    Script Date: 01/26/2012 13:02:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__SessionMe__Sessi__060DEAE8]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_GameSessionMembers]'))
ALTER TABLE [dbo].[DB_GameSessionMembers]  WITH CHECK ADD FOREIGN KEY([SessionId])
REFERENCES [dbo].[DB_GameSessions] ([Id])
GO
/****** Object:  ForeignKey [FK__SessionMe__UserI__07020F21]    Script Date: 01/26/2012 13:02:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__SessionMe__UserI__07020F21]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_GameSessionMembers]'))
ALTER TABLE [dbo].[DB_GameSessionMembers]  WITH CHECK ADD  CONSTRAINT [FK__SessionMe__UserI__07020F21] FOREIGN KEY([UserId])
REFERENCES [dbo].[DB_Users] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__SessionMe__UserI__07020F21]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_GameSessionMembers]'))
ALTER TABLE [dbo].[DB_GameSessionMembers] CHECK CONSTRAINT [FK__SessionMe__UserI__07020F21]
GO
/****** Object:  ForeignKey [FK__DB_Struct__Count__5812160E]    Script Date: 01/26/2012 13:02:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Struct__Count__5812160E]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Structures]'))
ALTER TABLE [dbo].[DB_Structures]  WITH CHECK ADD  CONSTRAINT [FK__DB_Struct__Count__5812160E] FOREIGN KEY([CountryId])
REFERENCES [dbo].[DB_Countries] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DB_Struct__Count__5812160E]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Structures]'))
ALTER TABLE [dbo].[DB_Structures] CHECK CONSTRAINT [FK__DB_Struct__Count__5812160E]
GO
