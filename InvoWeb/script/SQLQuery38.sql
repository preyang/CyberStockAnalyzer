USE [stub]
GO
/****** Object:  Table [dbo].[UserTypeMaster]    Script Date: 03/06/2014 23:49:25 ******/
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
/****** Object:  StoredProcedure [dbo].[Insert_UserTypeMaster]    Script Date: 03/06/2014 23:49:22 ******/
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
/****** Object:  Table [dbo].[UserMaster]    Script Date: 03/06/2014 23:49:25 ******/
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
/****** Object:  StoredProcedure [dbo].[Update_UserTypeMaster]    Script Date: 03/06/2014 23:49:22 ******/
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
	@ID int,
	@usertype varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	update UserTypeMaster set UserType=@usertype where UserTypeId=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[Update_UserMaster]    Script Date: 03/06/2014 23:49:22 ******/
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
    @CreatedDate datetime,
    @ModifiedDate datetime,
    @LastLoginDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	update UserMaster  set UserName =@UserName,EmailId= @EmailId,Password = @Password ,Question=@Question ,Answer= @Answer ,UserTypeId = @UserTypeId ,UserStatus = @UserStatus ,CreatedDate = @CreatedDate ,ModifiedDate = @ModifiedDate ,LastLoginDate = @LastLoginDate  where UserId =@UserId 
END
GO
/****** Object:  StoredProcedure [dbo].[Select_CheckEmail]    Script Date: 03/06/2014 23:49:22 ******/
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
/****** Object:  StoredProcedure [dbo].[LastUserId]    Script Date: 03/06/2014 23:49:22 ******/
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
	SELECT UserId From UserMaster Where UserStatus = @UserStatus
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_UserMaster]    Script Date: 03/06/2014 23:49:22 ******/
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
/****** Object:  Table [dbo].[CompanyMaster]    Script Date: 03/06/2014 23:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanyMaster](
	[CompanyId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NULL,
	[IndustryType] [varchar](50) NULL,
	[CompanyDesc] [varchar](100) NULL,
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
/****** Object:  Table [dbo].[ClientMaster]    Script Date: 03/06/2014 23:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientMaster](
	[ClientId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[PostCode] [numeric](18, 0) NULL,
	[Country] [varchar](50) NULL,
	[PhoneNo] [numeric](18, 0) NULL,
	[MobileNo] [numeric](18, 0) NULL,
	[Fax] [numeric](18, 0) NULL,
	[Email] [varchar](50) NULL,
	[WebSite] [varchar](50) NULL,
	[Deposit] [numeric](18, 0) NULL,
	[DebitLimit] [numeric](18, 0) NULL,
	[ClientStatus] [bit] NULL,
	[CompanyId] [numeric](18, 0) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_ClientMaster] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Insert_CompanyMaster]    Script Date: 03/06/2014 23:49:22 ******/
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
      @IndustryType varchar(50),
      @CompanyDesc varchar(50),
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
    insert into CompanyMaster  values(@CompanyName ,@IndustryType ,@CompanyDesc,@CompanyLogo ,@ContactPersonName ,@ContactNo ,@ContactEmail ,@Website ,@CompanyStatus ,@UserId ,@CreatedDate ,@ModifiedDate) 

END
GO
/****** Object:  Table [dbo].[TaxMaster]    Script Date: 03/06/2014 23:49:25 ******/
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
	[TaxRate] [numeric](18, 0) NULL,
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
/****** Object:  StoredProcedure [dbo].[Select_Company]    Script Date: 03/06/2014 23:49:22 ******/
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
	SELECT CompanyId, CompanyName, IndustryType, CompanyDesc, CompanyLogo, ContactPersonName, ContactNo, ContactEmail, Website  From CompanyMaster  Where CompanyStatus = @CompanyStatus And UserId = @UserId 
END
GO
/****** Object:  StoredProcedure [dbo].[Select_CheckUserLogin]    Script Date: 03/06/2014 23:49:22 ******/
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
/****** Object:  StoredProcedure [dbo].[Update_CompanyMaster]    Script Date: 03/06/2014 23:49:22 ******/
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
    @IndustryType varchar(50),
    @CompanyDesc varchar(50),
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
	Update CompanyMaster set CompanyName = @CompanyName ,IndustryType= @IndustryType ,CompanyDesc = @CompanyDesc ,CompanyLogo = @CompanyLogo ,ContactPersonName = @ContactPersonName ,ContactNo = @ContactNo , ContactEmail =@ContactEmail ,Website = @Website ,CompanyStatus =@CompanyStatus ,UserId = @UserId ,CreatedDate = @CreatedDate ,ModifiedDate = @ModifiedDate where CompanyId=@CompanyId  
END
GO
/****** Object:  StoredProcedure [dbo].[Update_ClientMaster]    Script Date: 03/06/2014 23:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:kishan
-- Create date:09-01-2014
-- Description:update
-- =============================================
CREATE PROCEDURE [dbo].[Update_ClientMaster]
	-- Add the parameters for the stored procedure here
	@ClientId numeric(18,0),
    @FirstName varchar(50),
    @LastName varchar(50),
    @Gender varchar(50),
    @Address varchar(50),
    @City varchar(50),
    @PostCode numeric(18,0),
    @Country varchar(50),
    @PhoneNo numeric(18,0),
    @MobileNo numeric(18,0),
    @Fax numeric(18,0),
    @Email varchar(50),
    @WebSite varchar(50),
    @Deposit numeric(18,0),
    @DebitLimit numeric(18,0),
    @ClientStatus bit,
    @CompanyId numeric(18,0),
    @CreatedDate datetime,
    @ModifiedDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	update ClientMaster set  FirstName = @FirstName ,LastName = @LastName ,Gender = @Gender ,Address = @Address ,City = @City ,PostCode = @PostCode ,Country = @Country ,PhoneNo = @PhoneNo ,MobileNo = @MobileNo ,Fax = @Fax ,Email = @Email ,WebSite = @WebSite ,Deposit = @Deposit ,DebitLimit = @DebitLimit ,ClientStatus = @ClientStatus ,CompanyId = @CompanyId ,CreatedDate = @CreatedDate ,ModifiedDate = @ModifiedDate where ClientId =@ClientId 
	END
GO
/****** Object:  StoredProcedure [dbo].[Update_TaxMaster]    Script Date: 03/06/2014 23:49:22 ******/
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
	@taxrate numeric(18,0),
	@taxstatus bit,
	@CompanyId numeric(18,0),
	@createddate datetime,
	@modifieddate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	update TaxMaster set TaxName=@taxname,TaxDesc=@taxdesc,TaxRate=@taxrate,TaxStatus=@taxstatus,CompanyId=@CompanyId,CreatedDate=@createddate,ModifiedDate=@modifieddate where TaxId=@TaxId
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_TaxMaster]    Script Date: 03/06/2014 23:49:22 ******/
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
	@taxrate numeric(18,0),
	@taxstatus bit,
	@CompanyId numeric(18,0),
	@createddate datetime,
	@modifieddate datetime

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	insert into TaxMaster values(@taxname,@taxdesc,@taxrate,@taxstatus,@CompanyId,@createddate,@modifieddate)
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_ClientMaster]    Script Date: 03/06/2014 23:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:kishan
-- Create date:09-01-2014
-- Description:insert
-- =============================================
CREATE PROCEDURE [dbo].[Insert_ClientMaster]
	-- Add the parameters for the stored procedure here
	@FirstName varchar(50),
    @LastName varchar(50),
    @Gender varchar(50),
    @Address varchar(50),
    @City varchar(50),
    @PostCode numeric(18,0),
    @Country varchar(50),
    @PhoneNo numeric(18,0),
    @MobileNo numeric(18,0),
    @Fax numeric(18,0),
    @Email varchar(50),
    @WebSite varchar(50),
    @Deposit numeric(18,0),
    @DebitLimit numeric(18,0),
    @ClientStatus bit,
    @CompanyId numeric(18,0),
    @CreatedDate datetime,
    @ModifiedDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	insert into ClientMaster values(@FirstName ,@LastName ,@Gender ,@Address ,@City ,@PostCode ,@Country ,@PhoneNo ,@MobileNo ,@Fax ,@Email ,@WebSite ,@Deposit ,@DebitLimit ,@ClientStatus ,@CompanyId ,@CreatedDate ,@ModifiedDate) 
	END
GO
/****** Object:  StoredProcedure [dbo].[Delete_TaxMaster]    Script Date: 03/06/2014 23:49:22 ******/
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
/****** Object:  StoredProcedure [dbo].[Delete_ClientMaster]    Script Date: 03/06/2014 23:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:kishan
-- Create date:09-01-2014
-- Description:delete
-- =============================================
CREATE PROCEDURE [dbo].[Delete_ClientMaster]
	-- Add the parameters for the stored procedure here
	@ClientId numeric(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	delete ClientMaster where ClientId =@ClientId
END
GO
/****** Object:  ForeignKey [FK_ClientMaster_CompanyMaster]    Script Date: 03/06/2014 23:49:25 ******/
ALTER TABLE [dbo].[ClientMaster]  WITH CHECK ADD  CONSTRAINT [FK_ClientMaster_CompanyMaster] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyMaster] ([CompanyId])
GO
ALTER TABLE [dbo].[ClientMaster] CHECK CONSTRAINT [FK_ClientMaster_CompanyMaster]
GO
/****** Object:  ForeignKey [FK_CompanyMaster_UserMaster]    Script Date: 03/06/2014 23:49:25 ******/
ALTER TABLE [dbo].[CompanyMaster]  WITH CHECK ADD  CONSTRAINT [FK_CompanyMaster_UserMaster] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserMaster] ([UserId])
GO
ALTER TABLE [dbo].[CompanyMaster] CHECK CONSTRAINT [FK_CompanyMaster_UserMaster]
GO
/****** Object:  ForeignKey [FK_TaxMaster_CompanyMaster]    Script Date: 03/06/2014 23:49:25 ******/
ALTER TABLE [dbo].[TaxMaster]  WITH CHECK ADD  CONSTRAINT [FK_TaxMaster_CompanyMaster] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyMaster] ([CompanyId])
GO
ALTER TABLE [dbo].[TaxMaster] CHECK CONSTRAINT [FK_TaxMaster_CompanyMaster]
GO
/****** Object:  ForeignKey [FK_UserMaster_UserTypeMaster]    Script Date: 03/06/2014 23:49:25 ******/
ALTER TABLE [dbo].[UserMaster]  WITH CHECK ADD  CONSTRAINT [FK_UserMaster_UserTypeMaster] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserTypeMaster] ([UserTypeId])
GO
ALTER TABLE [dbo].[UserMaster] CHECK CONSTRAINT [FK_UserMaster_UserTypeMaster]
GO
