USE [Hackenberg]
GO
/****** Object:  Table [dbo].[DB_Rules]    Script Date: 01/25/2012 17:14:40 ******/
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
/****** Object:  Table [dbo].[DB_Maps]    Script Date: 01/25/2012 17:14:40 ******/
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
/****** Object:  Table [dbo].[DB_Forces]    Script Date: 01/25/2012 17:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_Forces]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_Forces](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DefenceStrength] [int] NOT NULL,
	[OffenceStrength] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DB_Users]    Script Date: 01/25/2012 17:14:40 ******/
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
/****** Object:  Table [dbo].[DB_Structures]    Script Date: 01/25/2012 17:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_Structures]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_Structures](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Effect] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DB_Sessions]    Script Date: 01/25/2012 17:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_Sessions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_Sessions](
	[Id] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DB_SessionMembers]    Script Date: 01/25/2012 17:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_SessionMembers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_SessionMembers](
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
/****** Object:  Table [dbo].[DB_Countries]    Script Date: 01/25/2012 17:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_Countries]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_Countries](
	[Id] [uniqueidentifier] NOT NULL,
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
/****** Object:  Table [dbo].[DB_Games]    Script Date: 01/25/2012 17:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_Games]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_Games](
	[Id] [uniqueidentifier] NOT NULL,
	[SessionId] [uniqueidentifier] NOT NULL,
	[MapId] [uniqueidentifier] NOT NULL,
	[Phase] [int] NULL,
	[Turn] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK__Games__3214EC070AD2A005] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DB_GameRules]    Script Date: 01/25/2012 17:14:40 ******/
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
/****** Object:  Table [dbo].[DB_MapCountries]    Script Date: 01/25/2012 17:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_MapCountries]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_MapCountries](
	[MapId] [uniqueidentifier] NOT NULL,
	[CountryId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MapId] ASC,
	[CountryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DB_CountryStructures]    Script Date: 01/25/2012 17:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_CountryStructures]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_CountryStructures](
	[CountryId] [uniqueidentifier] NOT NULL,
	[StructureId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC,
	[StructureId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DB_CountryForces]    Script Date: 01/25/2012 17:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DB_CountryForces]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DB_CountryForces](
	[ForceId] [uniqueidentifier] NOT NULL,
	[CountryId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC,
	[ForceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  ForeignKey [FK__Countries__Contr__20C1E124]    Script Date: 01/25/2012 17:14:40 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Countries__Contr__20C1E124]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Countries]'))
ALTER TABLE [dbo].[DB_Countries]  WITH CHECK ADD  CONSTRAINT [FK__Countries__Contr__20C1E124] FOREIGN KEY([ControlledBy])
REFERENCES [dbo].[DB_Users] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Countries__Contr__20C1E124]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Countries]'))
ALTER TABLE [dbo].[DB_Countries] CHECK CONSTRAINT [FK__Countries__Contr__20C1E124]
GO
/****** Object:  ForeignKey [FK__CountryFo__Count__164452B1]    Script Date: 01/25/2012 17:14:40 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__CountryFo__Count__164452B1]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_CountryForces]'))
ALTER TABLE [dbo].[DB_CountryForces]  WITH CHECK ADD  CONSTRAINT [FK__CountryFo__Count__164452B1] FOREIGN KEY([CountryId])
REFERENCES [dbo].[DB_Countries] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__CountryFo__Count__164452B1]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_CountryForces]'))
ALTER TABLE [dbo].[DB_CountryForces] CHECK CONSTRAINT [FK__CountryFo__Count__164452B1]
GO
/****** Object:  ForeignKey [FK__CountryFo__Force__15502E78]    Script Date: 01/25/2012 17:14:40 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__CountryFo__Force__15502E78]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_CountryForces]'))
ALTER TABLE [dbo].[DB_CountryForces]  WITH CHECK ADD FOREIGN KEY([ForceId])
REFERENCES [dbo].[DB_Forces] ([Id])
GO
/****** Object:  ForeignKey [FK__CountrySt__Count__3E52440B]    Script Date: 01/25/2012 17:14:40 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__CountrySt__Count__3E52440B]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_CountryStructures]'))
ALTER TABLE [dbo].[DB_CountryStructures]  WITH CHECK ADD FOREIGN KEY([CountryId])
REFERENCES [dbo].[DB_Countries] ([Id])
GO
/****** Object:  ForeignKey [FK__CountrySt__Struc__3F466844]    Script Date: 01/25/2012 17:14:40 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__CountrySt__Struc__3F466844]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_CountryStructures]'))
ALTER TABLE [dbo].[DB_CountryStructures]  WITH CHECK ADD FOREIGN KEY([StructureId])
REFERENCES [dbo].[DB_Structures] ([Id])
GO
/****** Object:  ForeignKey [FK__GameRules__GameI__267ABA7A]    Script Date: 01/25/2012 17:14:40 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__GameRules__GameI__267ABA7A]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_GameRules]'))
ALTER TABLE [dbo].[DB_GameRules]  WITH CHECK ADD  CONSTRAINT [FK__GameRules__GameI__267ABA7A] FOREIGN KEY([GameId])
REFERENCES [dbo].[DB_Games] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__GameRules__GameI__267ABA7A]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_GameRules]'))
ALTER TABLE [dbo].[DB_GameRules] CHECK CONSTRAINT [FK__GameRules__GameI__267ABA7A]
GO
/****** Object:  ForeignKey [FK__GameRules__RuleI__276EDEB3]    Script Date: 01/25/2012 17:14:40 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__GameRules__RuleI__276EDEB3]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_GameRules]'))
ALTER TABLE [dbo].[DB_GameRules]  WITH CHECK ADD FOREIGN KEY([RuleId])
REFERENCES [dbo].[DB_Rules] ([Id])
GO
/****** Object:  ForeignKey [FK__Games__MapId__38996AB5]    Script Date: 01/25/2012 17:14:40 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Games__MapId__38996AB5]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games]  WITH CHECK ADD FOREIGN KEY([MapId])
REFERENCES [dbo].[DB_Maps] ([Id])
GO
/****** Object:  ForeignKey [FK__Games__SessionId__1920BF5C]    Script Date: 01/25/2012 17:14:40 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Games__SessionId__1920BF5C]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games]  WITH CHECK ADD  CONSTRAINT [FK__Games__SessionId__1920BF5C] FOREIGN KEY([SessionId])
REFERENCES [dbo].[DB_Sessions] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Games__SessionId__1920BF5C]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_Games]'))
ALTER TABLE [dbo].[DB_Games] CHECK CONSTRAINT [FK__Games__SessionId__1920BF5C]
GO
/****** Object:  ForeignKey [FK__MapCountr__Count__2F10007B]    Script Date: 01/25/2012 17:14:40 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__MapCountr__Count__2F10007B]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_MapCountries]'))
ALTER TABLE [dbo].[DB_MapCountries]  WITH CHECK ADD  CONSTRAINT [FK__MapCountr__Count__2F10007B] FOREIGN KEY([CountryId])
REFERENCES [dbo].[DB_Countries] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__MapCountr__Count__2F10007B]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_MapCountries]'))
ALTER TABLE [dbo].[DB_MapCountries] CHECK CONSTRAINT [FK__MapCountr__Count__2F10007B]
GO
/****** Object:  ForeignKey [FK__MapCountr__MapId__2E1BDC42]    Script Date: 01/25/2012 17:14:40 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__MapCountr__MapId__2E1BDC42]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_MapCountries]'))
ALTER TABLE [dbo].[DB_MapCountries]  WITH CHECK ADD FOREIGN KEY([MapId])
REFERENCES [dbo].[DB_Maps] ([Id])
GO
/****** Object:  ForeignKey [FK__SessionMe__Sessi__060DEAE8]    Script Date: 01/25/2012 17:14:40 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__SessionMe__Sessi__060DEAE8]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_SessionMembers]'))
ALTER TABLE [dbo].[DB_SessionMembers]  WITH CHECK ADD FOREIGN KEY([SessionId])
REFERENCES [dbo].[DB_Sessions] ([Id])
GO
/****** Object:  ForeignKey [FK__SessionMe__UserI__07020F21]    Script Date: 01/25/2012 17:14:40 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__SessionMe__UserI__07020F21]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_SessionMembers]'))
ALTER TABLE [dbo].[DB_SessionMembers]  WITH CHECK ADD  CONSTRAINT [FK__SessionMe__UserI__07020F21] FOREIGN KEY([UserId])
REFERENCES [dbo].[DB_Users] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__SessionMe__UserI__07020F21]') AND parent_object_id = OBJECT_ID(N'[dbo].[DB_SessionMembers]'))
ALTER TABLE [dbo].[DB_SessionMembers] CHECK CONSTRAINT [FK__SessionMe__UserI__07020F21]
GO
