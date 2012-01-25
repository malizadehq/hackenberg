USE [Hackenberg]
GO
/****** Object:  Table [dbo].[Rules]    Script Date: 01/25/2012 15:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rules]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Rules](
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
/****** Object:  Table [dbo].[Maps]    Script Date: 01/25/2012 15:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Maps]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Maps](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Forces]    Script Date: 01/25/2012 15:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Forces]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Forces](
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
/****** Object:  Table [dbo].[Users]    Script Date: 01/25/2012 15:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
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
/****** Object:  Table [dbo].[Structures]    Script Date: 01/25/2012 15:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Structures]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Structures](
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
/****** Object:  Table [dbo].[Sessions]    Script Date: 01/25/2012 15:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sessions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sessions](
	[Id] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SessionMembers]    Script Date: 01/25/2012 15:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SessionMembers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SessionMembers](
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
/****** Object:  Table [dbo].[Countries]    Script Date: 01/25/2012 15:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Countries]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Countries](
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
/****** Object:  Table [dbo].[Games]    Script Date: 01/25/2012 15:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Games]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Games](
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
/****** Object:  Table [dbo].[GameRules]    Script Date: 01/25/2012 15:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GameRules]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GameRules](
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
/****** Object:  Table [dbo].[MapCountries]    Script Date: 01/25/2012 15:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MapCountries]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MapCountries](
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
/****** Object:  Table [dbo].[CountryStructures]    Script Date: 01/25/2012 15:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CountryStructures]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CountryStructures](
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
/****** Object:  Table [dbo].[CountryForces]    Script Date: 01/25/2012 15:16:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CountryForces]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CountryForces](
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
/****** Object:  ForeignKey [FK__Countries__Contr__20C1E124]    Script Date: 01/25/2012 15:16:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Countries__Contr__20C1E124]') AND parent_object_id = OBJECT_ID(N'[dbo].[Countries]'))
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK__Countries__Contr__20C1E124] FOREIGN KEY([ControlledBy])
REFERENCES [dbo].[Users] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Countries__Contr__20C1E124]') AND parent_object_id = OBJECT_ID(N'[dbo].[Countries]'))
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK__Countries__Contr__20C1E124]
GO
/****** Object:  ForeignKey [FK__CountryFo__Count__164452B1]    Script Date: 01/25/2012 15:16:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__CountryFo__Count__164452B1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CountryForces]'))
ALTER TABLE [dbo].[CountryForces]  WITH CHECK ADD  CONSTRAINT [FK__CountryFo__Count__164452B1] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__CountryFo__Count__164452B1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CountryForces]'))
ALTER TABLE [dbo].[CountryForces] CHECK CONSTRAINT [FK__CountryFo__Count__164452B1]
GO
/****** Object:  ForeignKey [FK__CountryFo__Force__15502E78]    Script Date: 01/25/2012 15:16:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__CountryFo__Force__15502E78]') AND parent_object_id = OBJECT_ID(N'[dbo].[CountryForces]'))
ALTER TABLE [dbo].[CountryForces]  WITH CHECK ADD FOREIGN KEY([ForceId])
REFERENCES [dbo].[Forces] ([Id])
GO
/****** Object:  ForeignKey [FK__CountrySt__Count__3E52440B]    Script Date: 01/25/2012 15:16:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__CountrySt__Count__3E52440B]') AND parent_object_id = OBJECT_ID(N'[dbo].[CountryStructures]'))
ALTER TABLE [dbo].[CountryStructures]  WITH CHECK ADD FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
/****** Object:  ForeignKey [FK__CountrySt__Struc__3F466844]    Script Date: 01/25/2012 15:16:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__CountrySt__Struc__3F466844]') AND parent_object_id = OBJECT_ID(N'[dbo].[CountryStructures]'))
ALTER TABLE [dbo].[CountryStructures]  WITH CHECK ADD FOREIGN KEY([StructureId])
REFERENCES [dbo].[Structures] ([Id])
GO
/****** Object:  ForeignKey [FK__GameRules__GameI__267ABA7A]    Script Date: 01/25/2012 15:16:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__GameRules__GameI__267ABA7A]') AND parent_object_id = OBJECT_ID(N'[dbo].[GameRules]'))
ALTER TABLE [dbo].[GameRules]  WITH CHECK ADD  CONSTRAINT [FK__GameRules__GameI__267ABA7A] FOREIGN KEY([GameId])
REFERENCES [dbo].[Games] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__GameRules__GameI__267ABA7A]') AND parent_object_id = OBJECT_ID(N'[dbo].[GameRules]'))
ALTER TABLE [dbo].[GameRules] CHECK CONSTRAINT [FK__GameRules__GameI__267ABA7A]
GO
/****** Object:  ForeignKey [FK__GameRules__RuleI__276EDEB3]    Script Date: 01/25/2012 15:16:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__GameRules__RuleI__276EDEB3]') AND parent_object_id = OBJECT_ID(N'[dbo].[GameRules]'))
ALTER TABLE [dbo].[GameRules]  WITH CHECK ADD FOREIGN KEY([RuleId])
REFERENCES [dbo].[Rules] ([Id])
GO
/****** Object:  ForeignKey [FK__Games__MapId__38996AB5]    Script Date: 01/25/2012 15:16:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Games__MapId__38996AB5]') AND parent_object_id = OBJECT_ID(N'[dbo].[Games]'))
ALTER TABLE [dbo].[Games]  WITH CHECK ADD FOREIGN KEY([MapId])
REFERENCES [dbo].[Maps] ([Id])
GO
/****** Object:  ForeignKey [FK__Games__SessionId__1920BF5C]    Script Date: 01/25/2012 15:16:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Games__SessionId__1920BF5C]') AND parent_object_id = OBJECT_ID(N'[dbo].[Games]'))
ALTER TABLE [dbo].[Games]  WITH CHECK ADD  CONSTRAINT [FK__Games__SessionId__1920BF5C] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Sessions] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Games__SessionId__1920BF5C]') AND parent_object_id = OBJECT_ID(N'[dbo].[Games]'))
ALTER TABLE [dbo].[Games] CHECK CONSTRAINT [FK__Games__SessionId__1920BF5C]
GO
/****** Object:  ForeignKey [FK__MapCountr__Count__2F10007B]    Script Date: 01/25/2012 15:16:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__MapCountr__Count__2F10007B]') AND parent_object_id = OBJECT_ID(N'[dbo].[MapCountries]'))
ALTER TABLE [dbo].[MapCountries]  WITH CHECK ADD  CONSTRAINT [FK__MapCountr__Count__2F10007B] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__MapCountr__Count__2F10007B]') AND parent_object_id = OBJECT_ID(N'[dbo].[MapCountries]'))
ALTER TABLE [dbo].[MapCountries] CHECK CONSTRAINT [FK__MapCountr__Count__2F10007B]
GO
/****** Object:  ForeignKey [FK__MapCountr__MapId__2E1BDC42]    Script Date: 01/25/2012 15:16:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__MapCountr__MapId__2E1BDC42]') AND parent_object_id = OBJECT_ID(N'[dbo].[MapCountries]'))
ALTER TABLE [dbo].[MapCountries]  WITH CHECK ADD FOREIGN KEY([MapId])
REFERENCES [dbo].[Maps] ([Id])
GO
/****** Object:  ForeignKey [FK__SessionMe__Sessi__060DEAE8]    Script Date: 01/25/2012 15:16:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__SessionMe__Sessi__060DEAE8]') AND parent_object_id = OBJECT_ID(N'[dbo].[SessionMembers]'))
ALTER TABLE [dbo].[SessionMembers]  WITH CHECK ADD FOREIGN KEY([SessionId])
REFERENCES [dbo].[Sessions] ([Id])
GO
/****** Object:  ForeignKey [FK__SessionMe__UserI__07020F21]    Script Date: 01/25/2012 15:16:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__SessionMe__UserI__07020F21]') AND parent_object_id = OBJECT_ID(N'[dbo].[SessionMembers]'))
ALTER TABLE [dbo].[SessionMembers]  WITH CHECK ADD  CONSTRAINT [FK__SessionMe__UserI__07020F21] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__SessionMe__UserI__07020F21]') AND parent_object_id = OBJECT_ID(N'[dbo].[SessionMembers]'))
ALTER TABLE [dbo].[SessionMembers] CHECK CONSTRAINT [FK__SessionMe__UserI__07020F21]
GO
