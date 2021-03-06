SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Item_Condition]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Item_Condition](
	[Item_Condition_Id] [numeric](18, 0) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_Item_Condition] PRIMARY KEY CLUSTERED 
(
	[Item_Condition_Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Payment_Method]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Payment_Method](
	[Payment_Method_id] [numeric](18, 0) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_Payment_Method] PRIMARY KEY CLUSTERED 
(
	[Payment_Method_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Shipment_Mode]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Shipment_Mode](
	[Shipment_Mode_Id] [numeric](18, 0) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_Shipment_Mode] PRIMARY KEY CLUSTERED 
(
	[Shipment_Mode_Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Shipment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Shipment](
	[Shipment_Id] [numeric](18, 0) NOT NULL,
	[Shipment_Mode_Id] [numeric](18, 0) NOT NULL,
	[Cost] [float] NULL,
	[Comment] [varchar](max) NULL,
 CONSTRAINT [PK_Shipment] PRIMARY KEY CLUSTERED 
(
	[Shipment_Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Credit_Rating]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Credit_Rating](
	[Credit_Rating_Id] [numeric](18, 0) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_Credit_Rating] PRIMARY KEY CLUSTERED 
(
	[Credit_Rating_Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Item_Category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Item_Category](
	[Item_category_ID] [numeric](18, 0) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_Item_Category] PRIMARY KEY CLUSTERED 
(
	[Item_category_ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customer](
	[Customer_ID] [numeric](18, 0) NOT NULL,
	[Company_Name] [varbinary](50) NULL,
	[Address] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[Zipcode] [varchar](10) NULL,
	[State] [varchar](30) NULL,
	[Country] [varchar](30) NULL,
	[Phone] [varchar](20) NULL,
	[Fax] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[Business_Category_Id] [numeric](18, 0) NULL,
	[Login_ID] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Credit_Rating_ID] [numeric](18, 0) NOT NULL,
	[Join_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bid]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Bid](
	[Bid_Id] [numeric](18, 0) NOT NULL,
	[Item_Id] [numeric](18, 0) NOT NULL,
	[Customer_Id] [numeric](18, 0) NOT NULL,
	[Amount] [float] NOT NULL,
	[Payment_Id] [numeric](18, 0) NULL,
	[Shipment_Id] [numeric](18, 0) NULL,
	[Comment] [varchar](max) NULL,
 CONSTRAINT [PK_Bid] PRIMARY KEY CLUSTERED 
(
	[Bid_Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Item]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Item](
	[Item_Id] [numeric](18, 0) NOT NULL,
	[Customer_Id] [numeric](18, 0) NOT NULL,
	[Item_Category_Id] [numeric](18, 0) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
	[Quantity] [numeric](18, 0) NOT NULL,
	[Price] [float] NOT NULL,
	[Item_Condition_Id] [numeric](18, 0) NOT NULL,
	[Bidding_Start_Date] [datetime] NULL,
	[Bidding_End_Date] [datetime] NULL,
	[Successful_Bid_Id] [numeric](18, 0) NULL,
	[Comment] [varchar](max) NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Item_Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Shipment_Item]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Shipment_Item](
	[Shipment_Id] [numeric](18, 0) NOT NULL,
	[Item_Id] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Shipment_Item] PRIMARY KEY CLUSTERED 
(
	[Shipment_Id] ASC,
	[Item_Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Payment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Payment](
	[Payment_Id] [numeric](18, 0) NOT NULL,
	[Payment_Method_Id] [numeric](18, 0) NOT NULL,
	[Payment_Date] [datetime] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[Payment_Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customer_Credit_Rating]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Credit_Rating] FOREIGN KEY([Credit_Rating_ID])
REFERENCES [dbo].[Credit_Rating] ([Credit_Rating_Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Credit_Rating]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customer_Item_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Item_Category] FOREIGN KEY([Business_Category_Id])
REFERENCES [dbo].[Item_Category] ([Item_category_ID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Item_Category]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bid_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bid]'))
ALTER TABLE [dbo].[Bid]  WITH CHECK ADD  CONSTRAINT [FK_Bid_Customer] FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Bid] CHECK CONSTRAINT [FK_Bid_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bid_Payment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bid]'))
ALTER TABLE [dbo].[Bid]  WITH CHECK ADD  CONSTRAINT [FK_Bid_Payment] FOREIGN KEY([Payment_Id])
REFERENCES [dbo].[Payment] ([Payment_Id])
GO
ALTER TABLE [dbo].[Bid] CHECK CONSTRAINT [FK_Bid_Payment]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bid_Shipment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bid]'))
ALTER TABLE [dbo].[Bid]  WITH CHECK ADD  CONSTRAINT [FK_Bid_Shipment] FOREIGN KEY([Shipment_Id])
REFERENCES [dbo].[Shipment] ([Shipment_Id])
GO
ALTER TABLE [dbo].[Bid] CHECK CONSTRAINT [FK_Bid_Shipment]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Item_Bid]') AND parent_object_id = OBJECT_ID(N'[dbo].[Item]'))
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Bid] FOREIGN KEY([Successful_Bid_Id])
REFERENCES [dbo].[Bid] ([Bid_Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Bid]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Item_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Item]'))
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Customer] FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Item_Item]') AND parent_object_id = OBJECT_ID(N'[dbo].[Item]'))
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Item] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Item] ([Item_Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Item]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Item_Item_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[Item]'))
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Item_Category] FOREIGN KEY([Item_Category_Id])
REFERENCES [dbo].[Item_Category] ([Item_category_ID])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Item_Category]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Item_Item_Condition]') AND parent_object_id = OBJECT_ID(N'[dbo].[Item]'))
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Item_Condition] FOREIGN KEY([Item_Condition_Id])
REFERENCES [dbo].[Item_Condition] ([Item_Condition_Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Item_Condition]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Shipment_Item_Item]') AND parent_object_id = OBJECT_ID(N'[dbo].[Shipment_Item]'))
ALTER TABLE [dbo].[Shipment_Item]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Item_Item] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Item] ([Item_Id])
GO
ALTER TABLE [dbo].[Shipment_Item] CHECK CONSTRAINT [FK_Shipment_Item_Item]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Shipment_Item_Shipment]') AND parent_object_id = OBJECT_ID(N'[dbo].[Shipment_Item]'))
ALTER TABLE [dbo].[Shipment_Item]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Item_Shipment] FOREIGN KEY([Shipment_Id])
REFERENCES [dbo].[Shipment] ([Shipment_Id])
GO
ALTER TABLE [dbo].[Shipment_Item] CHECK CONSTRAINT [FK_Shipment_Item_Shipment]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Payment_Payment_Method]') AND parent_object_id = OBJECT_ID(N'[dbo].[Payment]'))
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Payment_Method] FOREIGN KEY([Payment_Method_Id])
REFERENCES [dbo].[Payment_Method] ([Payment_Method_id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Payment_Method]
