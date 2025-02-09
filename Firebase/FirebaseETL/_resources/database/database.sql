/****** Object:  Table [dbo].[DIM_ARTICLE]    Script Date: 16/1/2021 19:52:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_ARTICLE](
	[ArticleCode] [nvarchar](10) NOT NULL,
	[ProvitionalCode] [nvarchar](7) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](20) NOT NULL,
	[GroupCategory] [nvarchar](20) NULL,
	[GroupDivision] [nvarchar](20) NULL,
 CONSTRAINT [PK_DIM_ARTICLE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_CLIENT]    Script Date: 16/1/2021 19:52:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_CLIENT](
	[ClientCode] [nvarchar](5) NOT NULL,
	[Name] [nvarchar](15) NULL,
	[ChannelCode] [int] NULL,
	[Route] [nvarchar](20) NULL,
	[ZoneCode] [int] NULL,
	[Country] [nvarchar](5) NULL,
	[Currency] [nvarchar](5) NULL,
	[Seller] [int] NULL,
	[CreditLimit] [decimal](18, 2) NULL,
	[Phone] [nvarchar](15) NULL,
	[PaymentConditionsCode] [nvarchar](30) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ChannelName] [nvarchar](20) NULL,
	[ChannelPriority] [nvarchar](15) NULL,
	[ZoneName] [nvarchar](20) NULL,
	[ZoneTerm] [int] NULL,
 CONSTRAINT [PK_DIM_CLIENT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_GROUP]    Script Date: 16/1/2021 19:52:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_GROUP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Category] [nvarchar](20) NULL,
	[Division] [nvarchar](20) NULL,
 CONSTRAINT [PK_DIM_BRAND] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_SELLER]    Script Date: 16/1/2021 19:52:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_SELLER](
	[SellerCode] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Comission] [int] NULL,
	[Blocked] [nchar](1) NULL,
	[Active] [nchar](1) NULL,
	[Email] [nvarchar](20) NULL,
	[Collector] [nchar](1) NULL,
	[Promoter] [nchar](1) NULL,
	[Type] [nvarchar](20) NULL,
	[Channel] [nvarchar](20) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DIM_SELLER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_TIME]    Script Date: 16/1/2021 19:52:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_TIME](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Month] [nvarchar](10) NOT NULL,
	[MonthNumeric] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[Day] [int] NOT NULL,
	[DollarSell] [decimal](18, 4) NOT NULL,
	[DollarBuy] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_DIM_TIME] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_GOALS]    Script Date: 16/1/2021 19:52:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_GOALS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SellerID] [int] NOT NULL,
	[TimeID] [int] NOT NULL,
	[Amount] [decimal](18, 4) NOT NULL,
	[GroupID] [int] NOT NULL,
 CONSTRAINT [PK_FACT_GOALS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_SALES]    Script Date: 16/1/2021 19:52:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_SALES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ArticleID] [int] NOT NULL,
	[SellerID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
	[TimeID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPriceColones] [decimal](18, 4) NOT NULL,
	[TotalColones] [decimal](18, 4) NOT NULL,
	[TaxColones] [decimal](18, 4) NOT NULL,
	[ProfitColones] [decimal](18, 4) NOT NULL,
	[UnitPriceDollars] [decimal](18, 4) NOT NULL,
	[TotalDollars] [decimal](18, 4) NOT NULL,
	[ProfitDollars] [decimal](18, 4) NOT NULL,
	[TaxDollars] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_FACT_SALES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 16/1/2021 19:52:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [sysname] NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED 
(
	[principal_id] ASC,
	[name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[FACT_GOALS]  WITH CHECK ADD  CONSTRAINT [FK_FACT_GOALS_DIM_GROUP] FOREIGN KEY([GroupID])
REFERENCES [dbo].[DIM_GROUP] ([ID])
GO
ALTER TABLE [dbo].[FACT_GOALS] CHECK CONSTRAINT [FK_FACT_GOALS_DIM_GROUP]
GO
ALTER TABLE [dbo].[FACT_GOALS]  WITH CHECK ADD  CONSTRAINT [FK_FACT_GOALS_DIM_SELLER] FOREIGN KEY([SellerID])
REFERENCES [dbo].[DIM_SELLER] ([ID])
GO
ALTER TABLE [dbo].[FACT_GOALS] CHECK CONSTRAINT [FK_FACT_GOALS_DIM_SELLER]
GO
ALTER TABLE [dbo].[FACT_GOALS]  WITH CHECK ADD  CONSTRAINT [FK_FACT_GOALS_DIM_TIME] FOREIGN KEY([TimeID])
REFERENCES [dbo].[DIM_TIME] ([ID])
GO
ALTER TABLE [dbo].[FACT_GOALS] CHECK CONSTRAINT [FK_FACT_GOALS_DIM_TIME]
GO
ALTER TABLE [dbo].[FACT_SALES]  WITH CHECK ADD  CONSTRAINT [FK_FACT_SALES_DIM_ARTICLE] FOREIGN KEY([ArticleID])
REFERENCES [dbo].[DIM_ARTICLE] ([ID])
GO
ALTER TABLE [dbo].[FACT_SALES] CHECK CONSTRAINT [FK_FACT_SALES_DIM_ARTICLE]
GO
ALTER TABLE [dbo].[FACT_SALES]  WITH CHECK ADD  CONSTRAINT [FK_FACT_SALES_DIM_CLIENT] FOREIGN KEY([ClientID])
REFERENCES [dbo].[DIM_CLIENT] ([ID])
GO
ALTER TABLE [dbo].[FACT_SALES] CHECK CONSTRAINT [FK_FACT_SALES_DIM_CLIENT]
GO
ALTER TABLE [dbo].[FACT_SALES]  WITH CHECK ADD  CONSTRAINT [FK_FACT_SALES_DIM_SELLER] FOREIGN KEY([SellerID])
REFERENCES [dbo].[DIM_SELLER] ([ID])
GO
ALTER TABLE [dbo].[FACT_SALES] CHECK CONSTRAINT [FK_FACT_SALES_DIM_SELLER]
GO
ALTER TABLE [dbo].[FACT_SALES]  WITH CHECK ADD  CONSTRAINT [FK_FACT_SALES_DIM_TIME] FOREIGN KEY([TimeID])
REFERENCES [dbo].[DIM_TIME] ([ID])
GO
ALTER TABLE [dbo].[FACT_SALES] CHECK CONSTRAINT [FK_FACT_SALES_DIM_TIME]
GO
