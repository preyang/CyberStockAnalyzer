USE [stub]
GO
/****** Object:  Table [dbo].[InvoicePayment]    Script Date: 03/13/2014 21:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvoicePayment](
	[InvoicePaymentId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[InvoiceId] [numeric](18, 0) NULL,
	[PaidAmount] [numeric](18, 2) NULL,
	[PaymentDate] [datetime] NULL,
	[PaymentMethod] [varchar](50) NULL,
	[CardNo] [varchar](50) NULL,
	[Comment] [varchar](100) NULL,
 CONSTRAINT [PK_InvoicePayment] PRIMARY KEY CLUSTERED 
(
	[InvoicePaymentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PackageMaster]    Script Date: 03/13/2014 21:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PackageMaster](
	[PackageId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[PackageName] [varchar](50) NULL,
	[PackageDesc] [varchar](50) NULL,
	[PackageDuration] [numeric](18, 0) NULL,
	[NoOfInvoice] [numeric](18, 0) NULL,
	[NoOfItem] [numeric](18, 0) NULL,
	[Price] [numeric](18, 2) NULL,
	[Term] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_PackageMaster] PRIMARY KEY CLUSTERED 
(
	[PackageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[PackageMaster] ON
INSERT [dbo].[PackageMaster] ([PackageId], [PackageName], [PackageDesc], [PackageDuration], [NoOfInvoice], [NoOfItem], [Price], [Term], [CreatedDate], [ModifiedDate]) VALUES (CAST(1 AS Numeric(18, 0)), N'Express', N'exprss edtion', CAST(10 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)), CAST(0.00 AS Numeric(18, 2)), N'no terms', CAST(0x0000A2EB00B255DF AS DateTime), CAST(0x0000A2EB00B37A10 AS DateTime))
SET IDENTITY_INSERT [dbo].[PackageMaster] OFF
/****** Object:  Table [dbo].[UserTypeMaster]    Script Date: 03/13/2014 21:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserTypeMaster](
	[UserTypeId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[UserType] [varchar](50) NULL,
 CONSTRAINT [PK_UserTypeMaster] PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[UserTypeMaster] ON
INSERT [dbo].[UserTypeMaster] ([UserTypeId], [UserType]) VALUES (CAST(1 AS Numeric(18, 0)), N'superadmin')
INSERT [dbo].[UserTypeMaster] ([UserTypeId], [UserType]) VALUES (CAST(2 AS Numeric(18, 0)), N'companyadmin')
SET IDENTITY_INSERT [dbo].[UserTypeMaster] OFF
/****** Object:  StoredProcedure [dbo].[Update_PackageMaster]    Script Date: 03/13/2014 21:15:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_PackageMaster] 
	-- Add the parameters for the stored procedure here
	@packageid numeric(18,0),
	@packagename varchar(50),
	@packagedesc varchar(50),
	@packageduration numeric(18, 0),
	@no_ofInvoice numeric(18,0),
	@no_ofItem numeric(18,0),
	@price numeric(18,0),
	@term varchar(50),
	@modifiedDate datetime

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	update PackageMaster set PackageName=@packagename,PackageDesc=@packagedesc,PackageDuration=@packageduration,NoOfInvoice=@no_ofInvoice, NoOfItem=@no_ofItem,Price=@price,Term=@term,ModifiedDate=@modifiedDate where PackageId=@packageid         
END
GO
/****** Object:  StoredProcedure [dbo].[Update_InvoicePayment]    Script Date: 03/13/2014 21:15:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_InvoicePayment]
	-- Add the parameters for the stored procedure here
	@InvoicePaymentId numeric(18,0),
    @PaidAmount numeric(18,2),
    @PaymentDate datetime,
    @PaymentMethod varchar,
    @CardNo varchar,
    @Comment varchar
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Update InvoicePayment set PaidAmount = @PaidAmount , PaymentDate = @PaymentDate ,PaymentMethod = @PaymentMethod ,CardNo = @CardNo ,Comment = @Comment where InvoicePaymentId = @InvoicePaymentId  
END
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 03/13/2014 21:15:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserMaster](
	[UserId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[EmailId] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Question] [varchar](50) NULL,
	[Answer] [varchar](50) NULL,
	[UserTypeId] [numeric](18, 0) NULL,
	[UserStatus] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[LastLoginDate] [datetime] NULL,
 CONSTRAINT [PK_UserMaster] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[UserMaster] ON
INSERT [dbo].[UserMaster] ([UserId], [UserName], [EmailId], [Password], [Question], [Answer], [UserTypeId], [UserStatus], [CreatedDate], [ModifiedDate], [LastLoginDate]) VALUES (CAST(17 AS Numeric(18, 0)), N'jayesh', N'jay@gmail.com', N'jhd420420', N'What was your School Name?', N'jhd', CAST(2 AS Numeric(18, 0)), 1, CAST(0x0000A2E7011A16BC AS DateTime), CAST(0x0000A2E7011A16BC AS DateTime), CAST(0x0000A2E7011A16BC AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [UserName], [EmailId], [Password], [Question], [Answer], [UserTypeId], [UserStatus], [CreatedDate], [ModifiedDate], [LastLoginDate]) VALUES (CAST(18 AS Numeric(18, 0)), N'invowebstub', N'invowebstub@yahoo.com', N'jhd420420', N'What was your School Name?', N'jhd', CAST(1 AS Numeric(18, 0)), 1, CAST(0x0000A2E7011A16BC AS DateTime), CAST(0x0000A2E7011A16BC AS DateTime), CAST(0x0000A2E7011A16BC AS DateTime))
SET IDENTITY_INSERT [dbo].[UserMaster] OFF
/****** Object:  StoredProcedure [dbo].[Update_UserTypeMaster]    Script Date: 03/13/2014 21:15:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_UserTypeMaster]
	-- Add the parameters for the stored procedure here
	@UserTypeId int,
	@UserType varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	update UserTypeMaster set UserType=@UserType where UserTypeId=@UserTypeId
END
GO
/****** Object:  StoredProcedure [dbo].[Select_PackageByID]    Script Date: 03/13/2014 21:15:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Select_PackageByID]
	@PackageId numeric(18, 0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From PackageMaster WHERE PackageId=@PackageId
END
GO
/****** Object:  StoredProcedure [dbo].[Select_Package]    Script Date: 03/13/2014 21:15:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Select_Package]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From PackageMaster
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_UserTypeMaster]    Script Date: 03/13/2014 21:15:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Atika,,Name>
-- Create date: <9th jan,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_UserTypeMaster]
	-- Add the parameters for the stored procedure here
	@usertype varchar(50)
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	insert into UserTypeMaster values(@usertype)
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_InvoicePayment]    Script Date: 03/13/2014 21:15:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_InvoicePayment]
	-- Add the parameters for the stored procedure here
	@InvoiceId numeric(18,0),
    @PaidAmount numeric(18,2),
    @PaymentDate datetime,
    @PaymentMethod varchar(50),
    @CardNo varchar(50),
    @Comment varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
INSERT INTO InvoicePayment VALUES
           (@InvoiceId
           ,@PaidAmount
           ,@PaymentDate
           ,@PaymentMethod
           ,@CardNo
           ,@Comment)
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_PackageMaster]    Script Date: 03/13/2014 21:15:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Atika
-- Create date: 9th Jan
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_PackageMaster]
	-- Add the parameters for the stored procedure here
	@packagename varchar(50),
	@packagedesc varchar(50),
	@packageduration numeric(18, 0),
	@no_ofInvoice numeric(18,0),
	@no_ofItem numeric(18,0),
	@price numeric(18,0),
	@term varchar(50),
	@createdDate datetime,
	@modifiedDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	insert into PackageMaster values(@packagename,@packagedesc,@packageduration,@no_ofInvoice,@no_ofItem,@price,@term,@createdDate,@modifiedDate)	
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_PackageMaster]    Script Date: 03/13/2014 21:15:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Delete_PackageMaster]
	-- Add the parameters for the stored procedure here
	@PackageId numeric(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Delete PackageMaster where PackageId=@PackageId
END
GO
/****** Object:  StoredProcedure [dbo].[LastUserId]    Script Date: 03/13/2014 21:15:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LastUserId]
	-- Add the parameters for the stored procedure here
	 @UserStatus bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT UserId From UserMaster Where UserStatus = @UserStatus ORDER BY UserId DESC
END
GO
/****** Object:  Table [dbo].[CompanyMaster]    Script Date: 03/13/2014 21:15:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanyMaster](
	[CompanyId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NULL,
	[InvoiceNoPrefix] [varchar](50) NULL,
	[CompAddress] [varchar](100) NULL,
	[CompanyLogo] [varchar](50) NULL,
	[ContactPersonName] [varchar](50) NULL,
	[ContactNo] [numeric](18, 0) NULL,
	[ContactEmail] [varchar](50) NULL,
	[Website] [varchar](50) NULL,
	[CompanyStatus] [bit] NULL,
	[UserId] [numeric](18, 0) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_CompanyMaster] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CompanyMaster] ON
INSERT [dbo].[CompanyMaster] ([CompanyId], [CompanyName], [InvoiceNoPrefix], [CompAddress], [CompanyLogo], [ContactPersonName], [ContactNo], [ContactEmail], [Website], [CompanyStatus], [UserId], [CreatedDate], [ModifiedDate]) VALUES (CAST(1 AS Numeric(18, 0)), N'Om', N'IWS', N'kalol', N'~/Img/ComImage/3.jpg', N'jayesh agrawal', CAST(7874841070 AS Numeric(18, 0)), N'jay@gmail.com', N'www.hello.com', 1, CAST(17 AS Numeric(18, 0)), CAST(0x0000A2E800977CBE AS DateTime), CAST(0x0000A2EC00BD8569 AS DateTime))
INSERT [dbo].[CompanyMaster] ([CompanyId], [CompanyName], [InvoiceNoPrefix], [CompAddress], [CompanyLogo], [ContactPersonName], [ContactNo], [ContactEmail], [Website], [CompanyStatus], [UserId], [CreatedDate], [ModifiedDate]) VALUES (CAST(2 AS Numeric(18, 0)), N'InvoWebStub', N'IWS', N'kalol', N'~/Img/ComImage/3.jpg', N'jayesh agrawal', CAST(7874841070 AS Numeric(18, 0)), N'jay@gmail.com', N'www.invowebstub.com', 1, CAST(18 AS Numeric(18, 0)), CAST(0x0000A2E800977CBE AS DateTime), CAST(0x0000A2EA00ED2325 AS DateTime))
SET IDENTITY_INSERT [dbo].[CompanyMaster] OFF
/****** Object:  StoredProcedure [dbo].[Insert_UserMaster]    Script Date: 03/13/2014 21:15:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_UserMaster]
	-- Add the parameters for the stored procedure here
	@UserName varchar(50),
	@EmailId varchar(50),
    @Password varchar(50),
    @Question varchar(50),
    @Answer varchar(50),
    @UserTypeId numeric(18,0),
    @UserStatus bit,
    @CreatedDate datetime,
    @ModifiedDate datetime,
    @LastLoginDate datetime
    AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.


    -- Insert statements for procedure here
	insert into UserMaster values(@UserName,@EmailId,@Password,@Question,@Answer,@UserTypeId,@UserStatus,@CreatedDate,@ModifiedDate,@LastLoginDate)
END
GO
/****** Object:  StoredProcedure [dbo].[Select_CheckEmail]    Script Date: 03/13/2014 21:15:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Select_CheckEmail]
	-- Add the parameters for the stored procedure here
	@EmailId varchar(50),
    @UserStatus bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT UserId From UserMaster Where UserStatus = @UserStatus And EmailId = @EmailId 
END
GO
/****** Object:  StoredProcedure [dbo].[Update_UserMaster]    Script Date: 03/13/2014 21:15:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:kishan
-- Create date:09-01-2014
-- Description:update
-- =============================================
CREATE PROCEDURE [dbo].[Update_UserMaster] 
	-- Add the parameters for the stored procedure here
	@UserId numeric(18,0),
	@UserName varchar(50),
	@EmailId varchar(50),
    @Password varchar(50),
    @Question varchar(50),
    @Answer varchar(50),
    @UserTypeId numeric(18,0),
    @UserStatus bit,
    @ModifiedDate datetime,
    @LastLoginDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	update UserMaster  set UserName =@UserName,EmailId= @EmailId,Password = @Password ,Question=@Question ,Answer= @Answer ,UserTypeId = @UserTypeId ,UserStatus = @UserStatus ,ModifiedDate = @ModifiedDate ,LastLoginDate = @LastLoginDate  where UserId =@UserId 
END
GO
/****** Object:  StoredProcedure [dbo].[Select_Company]    Script Date: 03/13/2014 21:15:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Select_Company] 
	-- Add the parameters for the stored procedure here
	 @CompanyStatus bit,
     @UserId numeric(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CompanyId, CompanyName, InvoiceNoPrefix, CompAddress, CompanyLogo, ContactPersonName, ContactNo, ContactEmail, Website  From CompanyMaster  Where CompanyStatus = @CompanyStatus And UserId = @UserId 
END
GO
/****** Object:  StoredProcedure [dbo].[Select_CheckUserLogin]    Script Date: 03/13/2014 21:15:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Select_CheckUserLogin]
	-- Add the parameters for the stored procedure here
	@EmailId varchar(50),
    @Password varchar(50),
    @UserStatus bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT u.UserId, u.UserName, u.UserTypeId, c.CompanyId From UserMaster u, CompanyMaster c Where u.UserStatus = @UserStatus And u.EmailId = @EmailId And u.Password = @Password  And c.UserId = u.UserId
END
GO
/****** Object:  StoredProcedure [dbo].[Select_AllCompany]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Select_AllCompany]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CompanyId, CompanyName, InvoiceNoPrefix, CompAddress, ContactPersonName, ContactNo, ContactEmail, Website, CompanyStatus  From CompanyMaster where CompanyName NOT IN ('InvoWebStub')
END
GO
/****** Object:  StoredProcedure [dbo].[Search_AllCompany]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Search_AllCompany]
	-- Add the parameters for the stored procedure here
	@search varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CompanyId, CompanyName, InvoiceNoPrefix, CompAddress, ContactPersonName, ContactNo, ContactEmail, Website, CompanyStatus  From CompanyMaster Where CompanyName Like '%'+ @search Or ContactPersonName Like '%'+ @search Or  CompanyName NOT IN ('InvoWebStub')
END
GO
/****** Object:  StoredProcedure [dbo].[Update_CompanyMaster]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:kishan
-- Create date:09-01-2014
-- Description:update
-- =============================================
CREATE PROCEDURE [dbo].[Update_CompanyMaster] 
	-- Add the parameters for the stored procedure here
	@CompanyId numeric(18,0),
	@CompanyName varchar(50),
    @InvoiceNoPrefix varchar(50),
    @CompAddress varchar(50),
    @CompanyLogo varchar(50),
    @ContactPersonName varchar(50),
    @ContactNo numeric(18,0),
    @ContactEmail varchar(50),
    @Website varchar(50),
    @CompanyStatus bit,
    @UserId numeric(18,0),
    @ModifiedDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Update CompanyMaster set CompanyName = @CompanyName ,InvoiceNoPrefix= @InvoiceNoPrefix ,CompAddress = @CompAddress ,CompanyLogo = @CompanyLogo ,ContactPersonName = @ContactPersonName ,ContactNo = @ContactNo , ContactEmail =@ContactEmail ,Website = @Website ,CompanyStatus =@CompanyStatus ,UserId = @UserId ,ModifiedDate = @ModifiedDate where CompanyId=@CompanyId  
END
GO
/****** Object:  StoredProcedure [dbo].[Update_ActiveCompanyMaster]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_ActiveCompanyMaster] 
	-- Add the parameters for the stored procedure here
	@CompanyId numeric(18,0), 
	@CompanyStatus bit,
	@ModifiedDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Update CompanyMaster set CompanyStatus =@CompanyStatus, ModifiedDate = @ModifiedDate where CompanyId=@CompanyId  
END
GO
/****** Object:  Table [dbo].[TaxMaster]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaxMaster](
	[TaxId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[TaxName] [varchar](50) NULL,
	[TaxDesc] [varchar](50) NULL,
	[TaxRate] [numeric](18, 2) NULL,
	[TaxStatus] [bit] NULL,
	[CompanyId] [numeric](18, 0) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_TaxMaster] PRIMARY KEY CLUSTERED 
(
	[TaxId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TaxMaster] ON
INSERT [dbo].[TaxMaster] ([TaxId], [TaxName], [TaxDesc], [TaxRate], [TaxStatus], [CompanyId], [CreatedDate], [ModifiedDate]) VALUES (CAST(7 AS Numeric(18, 0)), N'sale', N'sale tax', CAST(10.00 AS Numeric(18, 2)), 0, CAST(1 AS Numeric(18, 0)), CAST(0x0000A2E9018AA286 AS DateTime), CAST(0x0000A2EA0118DFBB AS DateTime))
SET IDENTITY_INSERT [dbo].[TaxMaster] OFF
/****** Object:  StoredProcedure [dbo].[Insert_CompanyMaster]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:kishan
-- Create date:09-01-2014
-- Description:insert
-- =============================================
CREATE PROCEDURE [dbo].[Insert_CompanyMaster] 
	-- Add the parameters for the stored procedure here
	  @CompanyName varchar(50),
      @InvoiceNoPrefix varchar(50),
      @CompAddress varchar(50),
      @CompanyLogo varchar(50),
      @ContactPersonName varchar(50),
      @ContactNo numeric(18,0),
      @ContactEmail varchar(50),
      @Website varchar(50),
      @CompanyStatus bit,
      @UserId numeric(18,0),
      @CreatedDate datetime,
      @ModifiedDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
    insert into CompanyMaster  values(@CompanyName ,@InvoiceNoPrefix ,@CompAddress,@CompanyLogo ,@ContactPersonName ,@ContactNo ,@ContactEmail ,@Website ,@CompanyStatus ,@UserId ,@CreatedDate ,@ModifiedDate) 

END
GO
/****** Object:  Table [dbo].[ItemMaster]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemMaster](
	[ItemId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](50) NULL,
	[ItemDesc] [varchar](100) NULL,
	[UnitPrice] [numeric](18, 2) NULL,
	[ProfitMargin] [numeric](18, 2) NULL,
	[FinalPrice] [numeric](18, 2) NULL,
	[IsTaxable] [bit] NULL,
	[CompanyId] [numeric](18, 0) NULL,
	[ItemStatus] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_ItemMaster] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvoiceMaster]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvoiceMaster](
	[InvoiceId] [numeric](18, 0) NOT NULL,
	[InvoiceNo] [varchar](50) NULL,
	[CompanyId] [numeric](18, 0) NULL,
	[CreatedDate] [datetime] NULL,
	[CustomerName] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[PhoneNo] [numeric](18, 0) NULL,
	[EmailId] [varchar](50) NULL,
	[SubTotalAmount] [numeric](18, 2) NULL,
	[TaxName1] [varchar](50) NULL,
	[TaxRate1] [numeric](18, 2) NULL,
	[TaxName2] [varchar](50) NULL,
	[TaxRate2] [numeric](18, 2) NULL,
	[DiscountRate] [numeric](18, 2) NULL,
	[AdditionCharge] [numeric](18, 2) NULL,
	[NetAmount] [numeric](18, 2) NULL,
	[Comment] [varchar](100) NULL,
	[SalePersonName] [varchar](50) NULL,
	[PaymentStatus] [bit] NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_InvoiceMaster] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvoiceDetail]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvoiceDetail](
	[InvoiceDetailId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[InvoiceId] [numeric](18, 0) NULL,
	[ItemName] [varchar](50) NULL,
	[ItemDesc] [varchar](100) NULL,
	[UnitRate] [numeric](18, 2) NULL,
	[Quanitity] [numeric](18, 0) NULL,
	[IsTaxable] [bit] NULL,
	[Amount] [numeric](18, 2) NULL,
 CONSTRAINT [PK_InvoiceDetailId] PRIMARY KEY CLUSTERED 
(
	[InvoiceDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Delete_TaxMaster]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Delete_TaxMaster]
	-- Add the parameters for the stored procedure here
	@TaxId numeric(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	delete TaxMaster where TaxId=@TaxId
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_ItemMaster]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:jayesh
-- Create date:09-01-2014
-- Description:	delete
-- =============================================
CREATE PROCEDURE [dbo].[Delete_ItemMaster]
	-- Add the parameters for the stored procedure here
	@ItemId numeric(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	delete ItemMaster where ItemId =@ItemId 
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ItemMaster]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_ItemMaster] 
	-- Add the parameters for the stored procedure here
	@ItemName varchar(50),
	@ItemDesc varchar(100),
	@UnitPrice numeric(18, 2),
	@ProfitMargin numeric(18, 2),
	@FinalPrice numeric(18, 2),
	@IsTaxable bit,
	@CompanyId numeric(18, 0),
	@ItemStatus bit,
	@CreateDate datetime,
	@ModifiedDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	insert into ItemMaster values(@ItemName, @ItemDesc, @UnitPrice, @ProfitMargin, @FinalPrice, @IsTaxable, @CompanyId, @ItemStatus, @CreateDate, @ModifiedDate)
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_InvoiceMaster]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_InvoiceMaster]
	-- Add the parameters for the stored procedure here
	@InvoiceNo varchar(50), 
	@CompanyId numeric(18, 0),
	@CreatedDate datetime,
	@CustomerName varchar(50),
	@Address varchar(100),
	@PhoneNo numeric(18, 0),
	@EmailId varchar(50),
	@SubTotalAmount numeric(18, 2),
	@TaxName1 varchar(50),
	@TaxRate1 numeric(18, 2),
	@TaxName2 varchar(50),
	@TaxRate2 numeric(18, 2),
	@DiscountRate numeric(18, 2),
	@AdditionCharge numeric(18, 2),
	@NetAmount numeric(18, 2),
	@Comment varchar(100),
	@SalePersonName varchar(50),
	@PaymentStatus bit,
	@LastUpdateDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Insert into InvoiceMaster values (@InvoiceNo
           ,@CompanyId
           ,@CreatedDate
           ,@CustomerName
           ,@Address
           ,@PhoneNo
           ,@EmailId
           ,@SubTotalAmount
           ,@TaxName1
           ,@TaxRate1
           ,@TaxName2
           ,@TaxRate2
           ,@DiscountRate
           ,@AdditionCharge
           ,@NetAmount
           ,@Comment
           ,@SalePersonName
           ,@PaymentStatus
           ,@LastUpdateDate)
END
GO
/****** Object:  StoredProcedure [dbo].[Select_TaxByTaxID]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Select_TaxByTaxID]
	-- Add the parameters for the stored procedure here
     @taxid numeric(18,0)AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TaxId, TaxName, TaxDesc, TaxRate, TaxStatus from TaxMaster where TaxId = @taxid 
END
GO
/****** Object:  StoredProcedure [dbo].[Select_Tax]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Select_Tax] 
	-- Add the parameters for the stored procedure here
     @companyid numeric(18,0)
 AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TaxId, TaxName, TaxDesc, TaxRate, TaxStatus from TaxMaster where CompanyId = @companyid 
END
GO
/****** Object:  StoredProcedure [dbo].[Select_ItemByItemID]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Select_ItemByItemID]
	-- Add the parameters for the stored procedure here
     @ItemId numeric(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT ItemId, ItemName,ItemDesc, UnitPrice, ProfitMargin, FinalPrice, IsTaxable, ItemStatus from ItemMaster where ItemId = @ItemId 
END
GO
/****** Object:  StoredProcedure [dbo].[Select_Item]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Select_Item]
	-- Add the parameters for the stored procedure here
     @CompanyId numeric(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ItemId, ItemName, UnitPrice, ProfitMargin, FinalPrice, IsTaxable, ItemStatus from ItemMaster where CompanyId = @CompanyId 
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_TaxMaster]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_TaxMaster] 
	-- Add the parameters for the stored procedure here
	@taxname varchar(50),
	@taxdesc varchar(50),
	@taxrate numeric(18,2),
	@taxstatus bit,
	@companyid numeric(18,0),
	@createddate datetime,
	@modifieddate datetime

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	insert into TaxMaster values(@taxname,@taxdesc,@taxrate,@taxstatus,@companyid,@createddate,@modifieddate)
END
GO
/****** Object:  StoredProcedure [dbo].[Update_TaxMaster]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_TaxMaster] 
	-- Add the parameters for the stored procedure here
	@TaxId numeric(18,0),
	@taxname varchar(50),
	@taxdesc varchar(50),
	@taxrate numeric(18,2),
	@taxstatus bit,
	@companyid numeric(18,0),
	@modifieddate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	update TaxMaster set TaxName=@taxname,TaxDesc=@taxdesc,TaxRate=@taxrate,TaxStatus=@taxstatus,CompanyId=@Companyid,ModifiedDate=@modifieddate where TaxId=@TaxId
END
GO
/****** Object:  StoredProcedure [dbo].[Update_ItemMaster]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_ItemMaster] 
	-- Add the parameters for the stored procedure here
	@ItemId numeric(18, 0),
	@ItemName varchar(50),
	@ItemDesc varchar(100),
	@UnitPrice numeric(18, 2),
	@ProfitMargin numeric(18, 2),
	@FinalPrice numeric(18, 2),
	@IsTaxable bit,
	@CompanyId numeric(18, 0),
	@ItemStatus bit,
	@ModifiedDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	update ItemMaster set ItemName=@ItemName, ItemDesc=@ItemDesc, UnitPrice=@UnitPrice, ProfitMargin=@ProfitMargin,FinalPrice=@FinalPrice, IsTaxable=@IsTaxable, CompanyId=@CompanyId, ItemStatus=@ItemStatus, ModifiedDate=@ModifiedDate where ItemId=@ItemId
END
GO
/****** Object:  StoredProcedure [dbo].[Update_InvoiceMaster]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_InvoiceMaster]
	-- Add the parameters for the stored procedure here
	@InvoiceId numeric(18,0),
    @InvoiceNo varchar(50),
    @CompanyId numeric(18,0),
    @CustomerName varchar(50),
    @Address varchar(100),
    @PhoneNo numeric(18,0),
    @EmailId varchar(50),
    @SubTotalAmount numeric(18,2),
    @TaxName1 varchar(50),
    @TaxRate1 numeric(18,2),
    @TaxName2 varchar(50),
    @TaxRate2 numeric(18,2),
    @DiscountRate numeric(18,2),
    @AdditionCharge numeric(18,2),
    @NetAmount numeric(18,2),
    @Comment varchar(100),
    @SalePersonName varchar(50),
    @PaymentStatus bit,
    @LastUpdateDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Update InvoiceMaster set InvoiceNo = @InvoiceNo , CompanyId = @CompanyId , CustomerName = @CustomerName , Address = @Address , PhoneNo = @PhoneNo ,EmailId = @EmailId , SubTotalAmount = @SubTotalAmount , TaxName1 = @TaxName1 , TaxRate1 = @TaxRate1 , TaxName2 = @TaxName2 , TaxRate2 = @TaxRate2 , DiscountRate = @DiscountRate , AdditionCharge = @AdditionCharge , NetAmount = @NetAmount , Comment = @Comment , SalePersonName = @SalePersonName , PaymentStatus = @PaymentStatus ,LastUpdateDate = @LastUpdateDate where InvoiceId = @InvoiceId 
END
GO
/****** Object:  StoredProcedure [dbo].[Update_InvoiceDetail]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_InvoiceDetail]
	-- Add the parameters for the stored procedure here
	@InvoiceDetailId numeric(18,0),
    @ItemName varchar,
    @ItemDesc varchar,
    @UnitRate numeric,
    @Quanitity numeric,
    @IsTaxable bit,
    @Amount numeric(18,0) 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Update InvoiceDetail set ItemName = @ItemName , ItemDesc = @ItemDesc , UnitRate = @UnitRate , Quanitity = @Quanitity , IsTaxable = @IsTaxable , Amount = @Amount where InvoiceDetailId = @InvoiceDetailId  
	
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_InvoiceDetail]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_InvoiceDetail]
	-- Add the parameters for the stored procedure here
	@InvoiceId numeric(18,0),
    @ItemName varchar(50),
    @ItemDesc varchar(100),
    @UnitRate numeric(18,2),
    @Quanitity numeric(18,0),
    @IsTaxable bit,
    @Amount numeric(18,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	INSERT INTO InvoiceDetail VALUES 
           (@InvoiceId
           ,@ItemName
           ,@ItemDesc
           ,@UnitRate
           ,@Quanitity
           ,@IsTaxable
           ,@Amount)
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_InvoiceMaster]    Script Date: 03/13/2014 21:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Delete_InvoiceMaster]
	-- Add the parameters for the stored procedure here
	@invoiceId numeric(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Delete from InvoiceDetail where InvoiceId = @invoiceId 
	Delete from InvoicePayment where InvoiceId = @invoiceId 
	Delete from InvoiceMaster where InvoiceId = @invoiceId 
	
END
GO
/****** Object:  ForeignKey [FK_UserMaster_UserTypeMaster]    Script Date: 03/13/2014 21:15:43 ******/
ALTER TABLE [dbo].[UserMaster]  WITH CHECK ADD  CONSTRAINT [FK_UserMaster_UserTypeMaster] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserTypeMaster] ([UserTypeId])
GO
ALTER TABLE [dbo].[UserMaster] CHECK CONSTRAINT [FK_UserMaster_UserTypeMaster]
GO
/****** Object:  ForeignKey [FK_CompanyMaster_UserMaster]    Script Date: 03/13/2014 21:15:43 ******/
ALTER TABLE [dbo].[CompanyMaster]  WITH CHECK ADD  CONSTRAINT [FK_CompanyMaster_UserMaster] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserMaster] ([UserId])
GO
ALTER TABLE [dbo].[CompanyMaster] CHECK CONSTRAINT [FK_CompanyMaster_UserMaster]
GO
/****** Object:  ForeignKey [FK_TaxMaster_CompanyMaster]    Script Date: 03/13/2014 21:15:44 ******/
ALTER TABLE [dbo].[TaxMaster]  WITH CHECK ADD  CONSTRAINT [FK_TaxMaster_CompanyMaster] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyMaster] ([CompanyId])
GO
ALTER TABLE [dbo].[TaxMaster] CHECK CONSTRAINT [FK_TaxMaster_CompanyMaster]
GO
/****** Object:  ForeignKey [FK_ItemMaster_CompanyMaster]    Script Date: 03/13/2014 21:15:44 ******/
ALTER TABLE [dbo].[ItemMaster]  WITH CHECK ADD  CONSTRAINT [FK_ItemMaster_CompanyMaster] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyMaster] ([CompanyId])
GO
ALTER TABLE [dbo].[ItemMaster] CHECK CONSTRAINT [FK_ItemMaster_CompanyMaster]
GO
/****** Object:  ForeignKey [FK_InvoiceMaster_CompanyMaster]    Script Date: 03/13/2014 21:15:44 ******/
ALTER TABLE [dbo].[InvoiceMaster]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceMaster_CompanyMaster] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyMaster] ([CompanyId])
GO
ALTER TABLE [dbo].[InvoiceMaster] CHECK CONSTRAINT [FK_InvoiceMaster_CompanyMaster]
GO
/****** Object:  ForeignKey [FK_InvoiceDetail_InvoiceMaster]    Script Date: 03/13/2014 21:15:44 ******/
ALTER TABLE [dbo].[InvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetail_InvoiceMaster] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[InvoiceMaster] ([InvoiceId])
GO
ALTER TABLE [dbo].[InvoiceDetail] CHECK CONSTRAINT [FK_InvoiceDetail_InvoiceMaster]
GO
