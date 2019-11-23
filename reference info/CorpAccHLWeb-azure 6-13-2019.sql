/******** DMA Schema Migration Deployment Script      Script Date: 6/13/2019 6:19:56 PM ********/

/****** Object:  Table [dbo].[ReportData]    Script Date: 6/13/2019 6:19:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReportData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ReportData](
	[AutoID] [int] IDENTITY(1,1) NOT NULL,
	[CallID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Confirmation] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Subscriber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fname] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Lname] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DOB] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phone] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CBtime] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AnonReq] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Lang] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Comments] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[verified] [bit] NULL,
	[Verifiedby] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VerifiedDate] [datetime2](7) NULL,
	[CallDate] [datetime2](7) NULL,
	[CallStatus] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CallPosted] [bit] NULL,
	[Posted Date] [datetime2](7) NULL,
	[EmailAddress] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
END
GO
/****** Object:  StoredProcedure [dbo].[GetReportDataTEmplate]    Script Date: 6/13/2019 6:19:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetReportDataTEmplate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetReportDataTEmplate] AS' 
END
GO


ALTER procedure [dbo].[GetReportDataTEmplate]
 as

 begin
SELECT [AutoID]
      ,[CallID]
      ,[Confirmation]
      ,[SID]
      ,[Subscriber]
      ,[Fname]
      ,[Lname]
      ,[DOB]
      ,[Phone]
      ,[CBtime]
      ,[AnonReq]
      ,[Lang]
      ,[Comments]
      ,[verified]
      ,[Verifiedby]
      ,[VerifiedDate]
      ,[CallDate]
      ,[CallStatus]
      ,[CallPosted]
      ,[Posted Date]
      ,[EmailAddress]
  FROM [dbo].[ReportData]
   where AutoId = 0 
   end 

GO
/****** Object:  Table [dbo].[QMaster]    Script Date: 6/13/2019 6:19:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[QType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MaxDigits] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NextQID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [QMaster$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QMaster]') AND name = N'QMaster$Id')
CREATE NONCLUSTERED INDEX [QMaster$Id] ON [dbo].[QMaster]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QMaster]') AND name = N'QMaster$NextQID')
CREATE NONCLUSTERED INDEX [QMaster$NextQID] ON [dbo].[QMaster]
(
	[NextQID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QMaster]') AND name = N'QMaster$QID')
CREATE UNIQUE NONCLUSTERED INDEX [QMaster$QID] ON [dbo].[QMaster]
(
	[QID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'QMaster', N'COLUMN',N'Id'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[QMaster].[Id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QMaster', @level2type=N'COLUMN',@level2name=N'Id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'QMaster', N'COLUMN',N'QID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[QMaster].[QID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QMaster', @level2type=N'COLUMN',@level2name=N'QID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'QMaster', N'COLUMN',N'QType'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[QMaster].[QType]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QMaster', @level2type=N'COLUMN',@level2name=N'QType'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'QMaster', N'COLUMN',N'MaxDigits'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[QMaster].[MaxDigits]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QMaster', @level2type=N'COLUMN',@level2name=N'MaxDigits'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'QMaster', N'COLUMN',N'NextQID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[QMaster].[NextQID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QMaster', @level2type=N'COLUMN',@level2name=N'NextQID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'QMaster', N'COLUMN',N'Question'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[QMaster].[Question]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QMaster', @level2type=N'COLUMN',@level2name=N'Question'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'QMaster', N'INDEX',N'QMaster$Id'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[QMaster].[Id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QMaster', @level2type=N'INDEX',@level2name=N'QMaster$Id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'QMaster', N'INDEX',N'QMaster$NextQID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[QMaster].[NextQID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QMaster', @level2type=N'INDEX',@level2name=N'QMaster$NextQID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'QMaster', N'INDEX',N'QMaster$QID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[QMaster].[QID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QMaster', @level2type=N'INDEX',@level2name=N'QMaster$QID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'QMaster', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[QMaster]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QMaster'
GO
/****** Object:  StoredProcedure [dbo].[GetQmaster]    Script Date: 6/13/2019 6:19:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetQmaster]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetQmaster] AS' 
END
GO


ALTER procedure  [dbo].[GetQmaster]
as 
begin 
SELECT [Id]
      ,[QID]
      ,[QType]
      ,[MaxDigits]
      ,[NextQID]
      ,[Question]
  FROM [dbo].[QMaster]
 order by id

 end 


GO
/****** Object:  Table [dbo].[SampleCallFlow]    Script Date: 6/13/2019 6:19:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SampleCallFlow]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SampleCallFlow](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Action] [float] NULL,
	[Section] [float] NULL,
	[Verbage] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sectiontype] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[QuestionType] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimarySection] [int] NULL,
	[SubSection] [int] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [SampleCallFlow$ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SampleCal__Prima__5165187F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SampleCallFlow] ADD  CONSTRAINT [DF__SampleCal__Prima__5165187F]  DEFAULT ((0)) FOR [PrimarySection]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SampleCal__SubSe__52593CB8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SampleCallFlow] ADD  CONSTRAINT [DF__SampleCal__SubSe__52593CB8]  DEFAULT ((0)) FOR [SubSection]
END

GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'SampleCallFlow', N'COLUMN',N'ID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[SampleCallFlow].[ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SampleCallFlow', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'SampleCallFlow', N'COLUMN',N'Action'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[SampleCallFlow].[Action]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SampleCallFlow', @level2type=N'COLUMN',@level2name=N'Action'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'SampleCallFlow', N'COLUMN',N'Section'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[SampleCallFlow].[Section]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SampleCallFlow', @level2type=N'COLUMN',@level2name=N'Section'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'SampleCallFlow', N'COLUMN',N'Verbage'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[SampleCallFlow].[Verbage]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SampleCallFlow', @level2type=N'COLUMN',@level2name=N'Verbage'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'SampleCallFlow', N'COLUMN',N'Sectiontype'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[SampleCallFlow].[Sectiontype]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SampleCallFlow', @level2type=N'COLUMN',@level2name=N'Sectiontype'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'SampleCallFlow', N'COLUMN',N'QuestionType'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[SampleCallFlow].[QuestionType]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SampleCallFlow', @level2type=N'COLUMN',@level2name=N'QuestionType'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'SampleCallFlow', N'COLUMN',N'PrimarySection'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[SampleCallFlow].[PrimarySection]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SampleCallFlow', @level2type=N'COLUMN',@level2name=N'PrimarySection'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'SampleCallFlow', N'COLUMN',N'SubSection'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[SampleCallFlow].[SubSection]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SampleCallFlow', @level2type=N'COLUMN',@level2name=N'SubSection'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'SampleCallFlow', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[SampleCallFlow]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SampleCallFlow'
GO
/****** Object:  StoredProcedure [dbo].[GetSampleCallFlow]    Script Date: 6/13/2019 6:19:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSampleCallFlow]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetSampleCallFlow] AS' 
END
GO

/****** Script for SelectTopNRows command from SSMS  ******/


ALTER procedure [dbo].[GetSampleCallFlow]
as 
 begin
SELECT [Action]
      ,[Section]
      ,[Verbage]
      ,[Sectiontype]
      ,[QuestionType]
      ,[PrimarySection]
      ,[SubSection]
      ,[SSMA_TimeStamp]
  FROM [dbo].[SampleCallFlow] 
   order by primarysection , subsection ;

   End 


GO
/****** Object:  Table [dbo].[DMaker]    Script Date: 6/13/2019 6:19:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DMaker]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DMaker](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[R1] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[R2] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[R3] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[R4] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[R5] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[R6] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[R7] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[R8] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[R9] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [DMaker$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[QID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DMaker]') AND name = N'DMaker$ID')
CREATE NONCLUSTERED INDEX [DMaker$ID] ON [dbo].[DMaker]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DMaker]') AND name = N'DMaker$QID')
CREATE NONCLUSTERED INDEX [DMaker$QID] ON [dbo].[DMaker]
(
	[QID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__DMaker__R1__403A8C7D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DMaker] ADD  CONSTRAINT [DF__DMaker__R1__403A8C7D]  DEFAULT ((0)) FOR [R1]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__DMaker__R2__412EB0B6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DMaker] ADD  CONSTRAINT [DF__DMaker__R2__412EB0B6]  DEFAULT ((0)) FOR [R2]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__DMaker__R3__4222D4EF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DMaker] ADD  CONSTRAINT [DF__DMaker__R3__4222D4EF]  DEFAULT ((0)) FOR [R3]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__DMaker__R4__4316F928]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DMaker] ADD  CONSTRAINT [DF__DMaker__R4__4316F928]  DEFAULT ((0)) FOR [R4]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__DMaker__R5__440B1D61]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DMaker] ADD  CONSTRAINT [DF__DMaker__R5__440B1D61]  DEFAULT ((0)) FOR [R5]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__DMaker__R6__44FF419A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DMaker] ADD  CONSTRAINT [DF__DMaker__R6__44FF419A]  DEFAULT ((0)) FOR [R6]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__DMaker__R7__45F365D3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DMaker] ADD  CONSTRAINT [DF__DMaker__R7__45F365D3]  DEFAULT ((0)) FOR [R7]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__DMaker__R8__46E78A0C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DMaker] ADD  CONSTRAINT [DF__DMaker__R8__46E78A0C]  DEFAULT ((0)) FOR [R8]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__DMaker__R9__47DBAE45]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DMaker] ADD  CONSTRAINT [DF__DMaker__R9__47DBAE45]  DEFAULT ((0)) FOR [R9]
END

GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'DMaker', N'COLUMN',N'Id'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[DMaker].[Id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DMaker', @level2type=N'COLUMN',@level2name=N'Id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'DMaker', N'COLUMN',N'QID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[DMaker].[QID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DMaker', @level2type=N'COLUMN',@level2name=N'QID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'DMaker', N'COLUMN',N'R1'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[DMaker].[R1]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DMaker', @level2type=N'COLUMN',@level2name=N'R1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'DMaker', N'COLUMN',N'R2'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[DMaker].[R2]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DMaker', @level2type=N'COLUMN',@level2name=N'R2'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'DMaker', N'COLUMN',N'R3'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[DMaker].[R3]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DMaker', @level2type=N'COLUMN',@level2name=N'R3'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'DMaker', N'COLUMN',N'R4'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[DMaker].[R4]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DMaker', @level2type=N'COLUMN',@level2name=N'R4'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'DMaker', N'COLUMN',N'R5'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[DMaker].[R5]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DMaker', @level2type=N'COLUMN',@level2name=N'R5'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'DMaker', N'COLUMN',N'R6'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[DMaker].[R6]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DMaker', @level2type=N'COLUMN',@level2name=N'R6'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'DMaker', N'COLUMN',N'R7'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[DMaker].[R7]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DMaker', @level2type=N'COLUMN',@level2name=N'R7'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'DMaker', N'COLUMN',N'R8'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[DMaker].[R8]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DMaker', @level2type=N'COLUMN',@level2name=N'R8'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'DMaker', N'COLUMN',N'R9'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[DMaker].[R9]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DMaker', @level2type=N'COLUMN',@level2name=N'R9'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'DMaker', N'INDEX',N'DMaker$ID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[DMaker].[ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DMaker', @level2type=N'INDEX',@level2name=N'DMaker$ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'DMaker', N'INDEX',N'DMaker$QID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[DMaker].[QID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DMaker', @level2type=N'INDEX',@level2name=N'DMaker$QID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'DMaker', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[DMaker]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DMaker'
GO
/****** Object:  StoredProcedure [dbo].[GetDMaker]    Script Date: 6/13/2019 6:19:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetDMaker]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetDMaker] AS' 
END
GO



ALTER procedure [dbo].[GetDMaker]
as 
begin
 
SELECT [Id]
      ,[QID]
      ,[R1]
      ,[R2]
      ,[R3]
      ,[R4]
      ,[R5]
      ,[R6]
      ,[R7]
      ,[R8]
      ,[R9]
  FROM [dbo].[DMaker]
  order by id 

   end 

GO
/****** Object:  Table [dbo].[Respdata]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Respdata]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Respdata](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CallID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[QID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Dcollect] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [Respdata$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Respdata]') AND name = N'Respdata$Confirmation')
CREATE NONCLUSTERED INDEX [Respdata$Confirmation] ON [dbo].[Respdata]
(
	[CallID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Respdata]') AND name = N'Respdata$id')
CREATE NONCLUSTERED INDEX [Respdata$id] ON [dbo].[Respdata]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Respdata]') AND name = N'Respdata$QID')
CREATE NONCLUSTERED INDEX [Respdata$QID] ON [dbo].[Respdata]
(
	[QID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata', N'COLUMN',N'id'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata].[id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata', N'COLUMN',N'CallID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata].[CallID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata', @level2type=N'COLUMN',@level2name=N'CallID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata', N'COLUMN',N'QID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata].[QID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata', @level2type=N'COLUMN',@level2name=N'QID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata', N'COLUMN',N'Dcollect'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata].[Dcollect]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata', @level2type=N'COLUMN',@level2name=N'Dcollect'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata', N'INDEX',N'Respdata$Confirmation'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata].[Confirmation]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata', @level2type=N'INDEX',@level2name=N'Respdata$Confirmation'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata', N'INDEX',N'Respdata$id'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata].[id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata', @level2type=N'INDEX',@level2name=N'Respdata$id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata', N'INDEX',N'Respdata$QID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata].[QID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata', @level2type=N'INDEX',@level2name=N'Respdata$QID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata'
GO
/****** Object:  StoredProcedure [dbo].[GetRespData]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetRespData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetRespData] AS' 
END
GO



ALTER procedure  [dbo].[GetRespData]
as 
 begin

SELECT [id]
      ,[CallID]
      ,[QID]
      ,[Dcollect]
  FROM [dbo].[Respdata]
  where id = 0 
  end 


GO
/****** Object:  Table [dbo].[DUAL]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DUAL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DUAL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [DUAL$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DUAL]') AND name = N'DUAL$ID')
CREATE NONCLUSTERED INDEX [DUAL$ID] ON [dbo].[DUAL]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'DUAL', N'COLUMN',N'ID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[DUAL].[ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DUAL', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'DUAL', N'INDEX',N'DUAL$ID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[DUAL].[ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DUAL', @level2type=N'INDEX',@level2name=N'DUAL$ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'DUAL', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[DUAL]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DUAL'
GO
/****** Object:  Table [dbo].[Paste Errors]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paste Errors]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Paste Errors](
	[AutoID] [int] IDENTITY(1,1) NOT NULL,
	[CallID] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Confirmation] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SID] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Subscriber] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fname] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Lname] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DOB] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phone] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CBtime] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AnonReq] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Lang] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Comments] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[verified] [bit] NULL,
	[Verifiedby] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VerifiedDate] [datetime2](0) NULL,
	[CallDate] [datetime2](0) NULL,
	[CallStatus] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CallPosted] [bit] NULL,
	[Posted Date] [datetime2](0) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Paste Errors] PRIMARY KEY CLUSTERED 
(
	[AutoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Paste Err__verif__48CFD27E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Paste Errors] ADD  CONSTRAINT [DF__Paste Err__verif__48CFD27E]  DEFAULT ((0)) FOR [verified]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Paste Err__CallP__49C3F6B7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Paste Errors] ADD  CONSTRAINT [DF__Paste Err__CallP__49C3F6B7]  DEFAULT ((0)) FOR [CallPosted]
END

GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Paste Errors', N'COLUMN',N'AutoID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Paste Errors].[AutoID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paste Errors', @level2type=N'COLUMN',@level2name=N'AutoID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Paste Errors', N'COLUMN',N'CallID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Paste Errors].[CallID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paste Errors', @level2type=N'COLUMN',@level2name=N'CallID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Paste Errors', N'COLUMN',N'Confirmation'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Paste Errors].[Confirmation]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paste Errors', @level2type=N'COLUMN',@level2name=N'Confirmation'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Paste Errors', N'COLUMN',N'SID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Paste Errors].[SID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paste Errors', @level2type=N'COLUMN',@level2name=N'SID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Paste Errors', N'COLUMN',N'Subscriber'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Paste Errors].[Subscriber]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paste Errors', @level2type=N'COLUMN',@level2name=N'Subscriber'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Paste Errors', N'COLUMN',N'Fname'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Paste Errors].[Fname]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paste Errors', @level2type=N'COLUMN',@level2name=N'Fname'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Paste Errors', N'COLUMN',N'Lname'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Paste Errors].[Lname]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paste Errors', @level2type=N'COLUMN',@level2name=N'Lname'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Paste Errors', N'COLUMN',N'DOB'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Paste Errors].[DOB]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paste Errors', @level2type=N'COLUMN',@level2name=N'DOB'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Paste Errors', N'COLUMN',N'Phone'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Paste Errors].[Phone]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paste Errors', @level2type=N'COLUMN',@level2name=N'Phone'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Paste Errors', N'COLUMN',N'CBtime'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Paste Errors].[CBtime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paste Errors', @level2type=N'COLUMN',@level2name=N'CBtime'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Paste Errors', N'COLUMN',N'AnonReq'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Paste Errors].[AnonReq]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paste Errors', @level2type=N'COLUMN',@level2name=N'AnonReq'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Paste Errors', N'COLUMN',N'Lang'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Paste Errors].[Lang]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paste Errors', @level2type=N'COLUMN',@level2name=N'Lang'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Paste Errors', N'COLUMN',N'Comments'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Paste Errors].[Comments]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paste Errors', @level2type=N'COLUMN',@level2name=N'Comments'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Paste Errors', N'COLUMN',N'verified'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Paste Errors].[verified]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paste Errors', @level2type=N'COLUMN',@level2name=N'verified'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Paste Errors', N'COLUMN',N'Verifiedby'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Paste Errors].[Verifiedby]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paste Errors', @level2type=N'COLUMN',@level2name=N'Verifiedby'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Paste Errors', N'COLUMN',N'VerifiedDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Paste Errors].[VerifiedDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paste Errors', @level2type=N'COLUMN',@level2name=N'VerifiedDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Paste Errors', N'COLUMN',N'CallDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Paste Errors].[CallDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paste Errors', @level2type=N'COLUMN',@level2name=N'CallDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Paste Errors', N'COLUMN',N'CallStatus'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Paste Errors].[CallStatus]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paste Errors', @level2type=N'COLUMN',@level2name=N'CallStatus'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Paste Errors', N'COLUMN',N'CallPosted'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Paste Errors].[CallPosted]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paste Errors', @level2type=N'COLUMN',@level2name=N'CallPosted'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Paste Errors', N'COLUMN',N'Posted Date'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Paste Errors].[Posted Date]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paste Errors', @level2type=N'COLUMN',@level2name=N'Posted Date'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Paste Errors', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Paste Errors]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paste Errors'
GO
/****** Object:  Table [dbo].[Webphrases]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Webphrases]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Webphrases](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Section] [int] NULL,
	[subsection] [int] NULL,
	[englishtext] [varchar](800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[spanishtext] [varchar](800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[frenchtext] [varchar](800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
END
GO
/****** Object:  Table [dbo].[Respdata 04-09]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Respdata 04-09]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Respdata 04-09](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CallID] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[QID] [nvarchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Dcollect] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [Respdata 04-09$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Respdata 04-09]') AND name = N'Respdata 04-09$Confirmation')
CREATE NONCLUSTERED INDEX [Respdata 04-09$Confirmation] ON [dbo].[Respdata 04-09]
(
	[CallID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Respdata 04-09]') AND name = N'Respdata 04-09$id')
CREATE NONCLUSTERED INDEX [Respdata 04-09$id] ON [dbo].[Respdata 04-09]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Respdata 04-09]') AND name = N'Respdata 04-09$QID')
CREATE NONCLUSTERED INDEX [Respdata 04-09$QID] ON [dbo].[Respdata 04-09]
(
	[QID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata 04-09', N'COLUMN',N'id'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata 04-09].[id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata 04-09', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata 04-09', N'COLUMN',N'CallID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata 04-09].[CallID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata 04-09', @level2type=N'COLUMN',@level2name=N'CallID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata 04-09', N'COLUMN',N'QID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata 04-09].[QID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata 04-09', @level2type=N'COLUMN',@level2name=N'QID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata 04-09', N'COLUMN',N'Dcollect'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata 04-09].[Dcollect]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata 04-09', @level2type=N'COLUMN',@level2name=N'Dcollect'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata 04-09', N'INDEX',N'Respdata 04-09$Confirmation'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata 04-09].[Confirmation]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata 04-09', @level2type=N'INDEX',@level2name=N'Respdata 04-09$Confirmation'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata 04-09', N'INDEX',N'Respdata 04-09$id'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata 04-09].[id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata 04-09', @level2type=N'INDEX',@level2name=N'Respdata 04-09$id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata 04-09', N'INDEX',N'Respdata 04-09$QID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata 04-09].[QID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata 04-09', @level2type=N'INDEX',@level2name=N'Respdata 04-09$QID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata 04-09', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata 04-09]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata 04-09'
GO
/****** Object:  Table [dbo].[QType]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Qtype] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [QType$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'QType', N'COLUMN',N'ID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[QType].[ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QType', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'QType', N'COLUMN',N'Qtype'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[QType].[Qtype]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QType', @level2type=N'COLUMN',@level2name=N'Qtype'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'QType', N'COLUMN',N'Description'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[QType].[Description]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QType', @level2type=N'COLUMN',@level2name=N'Description'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'QType', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[QType]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QType'
GO
/****** Object:  Table [dbo].[Report Data 04-09]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Report Data 04-09]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Report Data 04-09](
	[AutoID] [int] IDENTITY(1,1) NOT NULL,
	[CallID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Confirmation] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Subscriber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fname] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Lname] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DOB] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phone] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CBtime] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AnonReq] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Lang] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Comments] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[verified] [bit] NULL,
	[Verifiedby] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VerifiedDate] [datetime2](0) NULL,
	[CallDate] [datetime2](0) NULL,
	[CallStatus] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CallPosted] [bit] NULL,
	[Posted Date] [datetime2](0) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [Report Data 04-09$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[AutoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Report Data 04-09]') AND name = N'Report Data 04-09$AutoID1')
CREATE NONCLUSTERED INDEX [Report Data 04-09$AutoID1] ON [dbo].[Report Data 04-09]
(
	[AutoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Report Data 04-09]') AND name = N'Report Data 04-09$CoID')
CREATE NONCLUSTERED INDEX [Report Data 04-09$CoID] ON [dbo].[Report Data 04-09]
(
	[SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Report Data 04-09]') AND name = N'Report Data 04-09$QID')
CREATE UNIQUE NONCLUSTERED INDEX [Report Data 04-09$QID] ON [dbo].[Report Data 04-09]
(
	[Confirmation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Report Data 04-09]') AND name = N'Report Data 04-09$ReportDataCallID')
CREATE NONCLUSTERED INDEX [Report Data 04-09$ReportDataCallID] ON [dbo].[Report Data 04-09]
(
	[CallID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Report Da__verif__4AB81AF0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Report Data 04-09] ADD  CONSTRAINT [DF__Report Da__verif__4AB81AF0]  DEFAULT ((0)) FOR [verified]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Report Da__CallP__4BAC3F29]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Report Data 04-09] ADD  CONSTRAINT [DF__Report Da__CallP__4BAC3F29]  DEFAULT ((0)) FOR [CallPosted]
END

GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'COLUMN',N'AutoID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[AutoID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'COLUMN',@level2name=N'AutoID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'COLUMN',N'CallID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[CallID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'COLUMN',@level2name=N'CallID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'COLUMN',N'Confirmation'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[Confirmation]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'COLUMN',@level2name=N'Confirmation'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'COLUMN',N'SID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[SID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'COLUMN',@level2name=N'SID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'COLUMN',N'Subscriber'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[Subscriber]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'COLUMN',@level2name=N'Subscriber'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'COLUMN',N'Fname'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[Fname]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'COLUMN',@level2name=N'Fname'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'COLUMN',N'Lname'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[Lname]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'COLUMN',@level2name=N'Lname'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'COLUMN',N'DOB'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[DOB]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'COLUMN',@level2name=N'DOB'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'COLUMN',N'Phone'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[Phone]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'COLUMN',@level2name=N'Phone'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'COLUMN',N'CBtime'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[CBtime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'COLUMN',@level2name=N'CBtime'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'COLUMN',N'AnonReq'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[AnonReq]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'COLUMN',@level2name=N'AnonReq'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'COLUMN',N'Lang'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[Lang]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'COLUMN',@level2name=N'Lang'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'COLUMN',N'Comments'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[Comments]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'COLUMN',@level2name=N'Comments'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'COLUMN',N'verified'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[verified]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'COLUMN',@level2name=N'verified'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'COLUMN',N'Verifiedby'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[Verifiedby]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'COLUMN',@level2name=N'Verifiedby'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'COLUMN',N'VerifiedDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[VerifiedDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'COLUMN',@level2name=N'VerifiedDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'COLUMN',N'CallDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[CallDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'COLUMN',@level2name=N'CallDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'COLUMN',N'CallStatus'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[CallStatus]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'COLUMN',@level2name=N'CallStatus'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'COLUMN',N'CallPosted'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[CallPosted]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'COLUMN',@level2name=N'CallPosted'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'COLUMN',N'Posted Date'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[Posted Date]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'COLUMN',@level2name=N'Posted Date'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'INDEX',N'Report Data 04-09$AutoID1'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[AutoID1]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'INDEX',@level2name=N'Report Data 04-09$AutoID1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'INDEX',N'Report Data 04-09$CoID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[CoID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'INDEX',@level2name=N'Report Data 04-09$CoID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'INDEX',N'Report Data 04-09$QID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[QID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'INDEX',@level2name=N'Report Data 04-09$QID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'INDEX',N'Report Data 04-09$ReportDataCallID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[ReportDataCallID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'INDEX',@level2name=N'Report Data 04-09$ReportDataCallID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09'
GO
/****** Object:  Table [dbo].[ReportData-10-07]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReportData-10-07]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ReportData-10-07](
	[AutoID] [int] NOT NULL,
	[CallID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Confirmation] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Subscriber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fname] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Lname] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DOB] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phone] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CBtime] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AnonReq] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Lang] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Comments] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[verified] [bit] NULL,
	[Verifiedby] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VerifiedDate] [datetime2](0) NULL,
	[CallDate] [datetime2](0) NULL,
	[CallStatus] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CallPosted] [bit] NULL,
	[Posted Date] [datetime2](0) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [ReportData-10-07$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[AutoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ReportData-10-07]') AND name = N'ReportData-10-07$AutoID')
CREATE UNIQUE NONCLUSTERED INDEX [ReportData-10-07$AutoID] ON [dbo].[ReportData-10-07]
(
	[AutoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ReportData-10-07]') AND name = N'ReportData-10-07$CoID')
CREATE NONCLUSTERED INDEX [ReportData-10-07$CoID] ON [dbo].[ReportData-10-07]
(
	[SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ReportData-10-07]') AND name = N'ReportData-10-07$QID')
CREATE UNIQUE NONCLUSTERED INDEX [ReportData-10-07$QID] ON [dbo].[ReportData-10-07]
(
	[Confirmation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ReportData-10-07]') AND name = N'ReportData-10-07$ReportDataCallID')
CREATE NONCLUSTERED INDEX [ReportData-10-07$ReportDataCallID] ON [dbo].[ReportData-10-07]
(
	[CallID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ReportDat__AutoI__4E88ABD4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ReportData-10-07] ADD  CONSTRAINT [DF__ReportDat__AutoI__4E88ABD4]  DEFAULT ((0)) FOR [AutoID]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ReportDat__verif__4F7CD00D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ReportData-10-07] ADD  CONSTRAINT [DF__ReportDat__verif__4F7CD00D]  DEFAULT ((0)) FOR [verified]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ReportDat__CallP__5070F446]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ReportData-10-07] ADD  CONSTRAINT [DF__ReportDat__CallP__5070F446]  DEFAULT ((0)) FOR [CallPosted]
END

GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'COLUMN',N'AutoID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[AutoID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'COLUMN',@level2name=N'AutoID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'COLUMN',N'CallID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[CallID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'COLUMN',@level2name=N'CallID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'COLUMN',N'Confirmation'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[Confirmation]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'COLUMN',@level2name=N'Confirmation'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'COLUMN',N'SID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[SID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'COLUMN',@level2name=N'SID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'COLUMN',N'Subscriber'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[Subscriber]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'COLUMN',@level2name=N'Subscriber'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'COLUMN',N'Fname'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[Fname]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'COLUMN',@level2name=N'Fname'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'COLUMN',N'Lname'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[Lname]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'COLUMN',@level2name=N'Lname'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'COLUMN',N'DOB'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[DOB]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'COLUMN',@level2name=N'DOB'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'COLUMN',N'Phone'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[Phone]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'COLUMN',@level2name=N'Phone'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'COLUMN',N'CBtime'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[CBtime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'COLUMN',@level2name=N'CBtime'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'COLUMN',N'AnonReq'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[AnonReq]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'COLUMN',@level2name=N'AnonReq'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'COLUMN',N'Lang'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[Lang]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'COLUMN',@level2name=N'Lang'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'COLUMN',N'Comments'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[Comments]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'COLUMN',@level2name=N'Comments'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'COLUMN',N'verified'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[verified]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'COLUMN',@level2name=N'verified'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'COLUMN',N'Verifiedby'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[Verifiedby]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'COLUMN',@level2name=N'Verifiedby'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'COLUMN',N'VerifiedDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[VerifiedDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'COLUMN',@level2name=N'VerifiedDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'COLUMN',N'CallDate'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[CallDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'COLUMN',@level2name=N'CallDate'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'COLUMN',N'CallStatus'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[CallStatus]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'COLUMN',@level2name=N'CallStatus'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'COLUMN',N'CallPosted'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[CallPosted]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'COLUMN',@level2name=N'CallPosted'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'COLUMN',N'Posted Date'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[Posted Date]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'COLUMN',@level2name=N'Posted Date'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'INDEX',N'ReportData-10-07$AutoID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[AutoID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'INDEX',@level2name=N'ReportData-10-07$AutoID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'INDEX',N'ReportData-10-07$CoID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[CoID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'INDEX',@level2name=N'ReportData-10-07$CoID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'INDEX',N'ReportData-10-07$QID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[QID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'INDEX',@level2name=N'ReportData-10-07$QID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'INDEX',N'ReportData-10-07$ReportDataCallID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[ReportDataCallID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'INDEX',@level2name=N'ReportData-10-07$ReportDataCallID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07'
GO
/****** Object:  Table [dbo].[Respdata-10-07]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Respdata-10-07]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Respdata-10-07](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CallID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[QID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Dcollect] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [Respdata-10-07$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Respdata-10-07]') AND name = N'Respdata-10-07$Confirmation')
CREATE NONCLUSTERED INDEX [Respdata-10-07$Confirmation] ON [dbo].[Respdata-10-07]
(
	[CallID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Respdata-10-07]') AND name = N'Respdata-10-07$id')
CREATE NONCLUSTERED INDEX [Respdata-10-07$id] ON [dbo].[Respdata-10-07]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Respdata-10-07]') AND name = N'Respdata-10-07$QID')
CREATE NONCLUSTERED INDEX [Respdata-10-07$QID] ON [dbo].[Respdata-10-07]
(
	[QID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata-10-07', N'COLUMN',N'id'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata-10-07].[id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata-10-07', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata-10-07', N'COLUMN',N'CallID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata-10-07].[CallID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata-10-07', @level2type=N'COLUMN',@level2name=N'CallID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata-10-07', N'COLUMN',N'QID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata-10-07].[QID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata-10-07', @level2type=N'COLUMN',@level2name=N'QID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata-10-07', N'COLUMN',N'Dcollect'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata-10-07].[Dcollect]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata-10-07', @level2type=N'COLUMN',@level2name=N'Dcollect'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata-10-07', N'INDEX',N'Respdata-10-07$Confirmation'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata-10-07].[Confirmation]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata-10-07', @level2type=N'INDEX',@level2name=N'Respdata-10-07$Confirmation'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata-10-07', N'INDEX',N'Respdata-10-07$id'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata-10-07].[id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata-10-07', @level2type=N'INDEX',@level2name=N'Respdata-10-07$id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata-10-07', N'INDEX',N'Respdata-10-07$QID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata-10-07].[QID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata-10-07', @level2type=N'INDEX',@level2name=N'Respdata-10-07$QID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata-10-07', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata-10-07]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata-10-07'
GO
/****** Object:  Table [dbo].[syssettings]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[syssettings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[syssettings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Setting] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SettingValue] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Insertdatetime] [datetime2](0) NULL,
	[Updatedatetime] [datetime2](0) NULL,
 CONSTRAINT [syssettings$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[syssettings]') AND name = N'syssettings$ID')
CREATE NONCLUSTERED INDEX [syssettings$ID] ON [dbo].[syssettings]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'syssettings', N'COLUMN',N'ID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[syssettings].[ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'syssettings', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'syssettings', N'COLUMN',N'Setting'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[syssettings].[Setting]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'syssettings', @level2type=N'COLUMN',@level2name=N'Setting'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'syssettings', N'COLUMN',N'SettingValue'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[syssettings].[SettingValue]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'syssettings', @level2type=N'COLUMN',@level2name=N'SettingValue'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'syssettings', N'COLUMN',N'Insertdatetime'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[syssettings].[Insertdatetime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'syssettings', @level2type=N'COLUMN',@level2name=N'Insertdatetime'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'syssettings', N'COLUMN',N'Updatedatetime'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[syssettings].[Updatedatetime]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'syssettings', @level2type=N'COLUMN',@level2name=N'Updatedatetime'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'syssettings', N'INDEX',N'syssettings$ID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[syssettings].[ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'syssettings', @level2type=N'INDEX',@level2name=N'syssettings$ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'syssettings', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[syssettings]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'syssettings'
GO
/****** Object:  View [dbo].[ABM Report]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ABM Report]'))
EXEC dbo.sp_executesql @statement = N'/*
*   SSMA warning messages:
*   A2SS0030: View ''ABM Report'' has a name that might cause problems for the Access application to function correctly against SQL Server.
*/

CREATE VIEW dbo.[ABM Report]
AS 
   /*Generated by SQL Server Migration Assistant for Access version 6.0.0.*/
   SELECT TOP 9223372036854775807 WITH TIES 
      [ReportData].[Confirmation], 
      [ReportData].[CallDate], 
      [ReportData].[SID], 
      [ReportData].[Subscriber], 
      [ReportData].[Fname], 
      [ReportData].[Lname], 
      [ReportData].[Phone], 
      [ReportData].[AutoID]
   FROM [ReportData]
   WHERE ((([ReportData].[Subscriber]) LIKE ''ABM'' OR ([ReportData].[Subscriber]) LIKE ''ABM Janitorial'' OR ([ReportData].[Subscriber]) = ''ABM Security'')) OR ((([ReportData].[SID]) = ''90041-90044''))
   ORDER BY [ReportData].[AutoID]' 
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'VIEW',N'ABM Report', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ABM Report]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ABM Report'
GO
/****** Object:  View [dbo].[AllReports]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AllReports]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.[AllReports]
AS 
   /*Generated by SQL Server Migration Assistant for Access version 6.0.0.*/
   SELECT 
      [ReportData].[Confirmation], 
      [ReportData].[Fname], 
      [ReportData].[Lname], 
      [ReportData].[SID], 
      [ReportData].[Subscriber], 
      [ReportData].[DOB], 
      [ReportData].[Phone], 
      [ReportData].[CBtime], 
      [ReportData].[AnonReq], 
      [ReportData].[Lang], 
      [ReportData].[Comments], 
      [ReportData].[verified], 
      [ReportData].[Verifiedby], 
      [ReportData].[VerifiedDate], 
      [ReportData].[CallDate], 
      [ReportData].[CallStatus], 
      [Respdata].[QID], 
      [Respdata].[Dcollect]
   FROM 
      [ReportData] 
         INNER JOIN [Respdata] 
         ON [ReportData].[CallID] = [Respdata].[CallID]' 
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'VIEW',N'AllReports', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[AllReports]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AllReports'
GO
/****** Object:  View [dbo].[ArchiveReport]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ArchiveReport]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.[ArchiveReport]
AS 
   /*Generated by SQL Server Migration Assistant for Access version 6.0.0.*/
   SELECT TOP 9223372036854775807 WITH TIES 
      [ReportData-10-07].[Confirmation], 
      [ReportData-10-07].[Fname], 
      [ReportData-10-07].[Lname], 
      [ReportData-10-07].[SID], 
      [ReportData-10-07].[Subscriber], 
      [ReportData-10-07].[DOB], 
      [ReportData-10-07].[Phone], 
      [ReportData-10-07].[CBtime], 
      [ReportData-10-07].[AnonReq], 
      [ReportData-10-07].[Lang], 
      [ReportData-10-07].[Comments], 
      [ReportData-10-07].[verified], 
      [ReportData-10-07].[Verifiedby], 
      [ReportData-10-07].[VerifiedDate], 
      [ReportData-10-07].[CallDate], 
      [ReportData-10-07].[CallStatus], 
      [ReportData-10-07].[CallID], 
      [Respdata-10-07].[QID], 
      [Respdata-10-07].[Dcollect], 
      [ReportData-10-07].[CallPosted]
   FROM 
      [ReportData-10-07] 
         INNER JOIN [Respdata-10-07] 
         ON [ReportData-10-07].[CallID] = [Respdata-10-07].[CallID]
   WHERE ((([ReportData-10-07].[Confirmation]) = ''09071445''))
   ORDER BY [ReportData-10-07].[CallDate]' 
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'VIEW',N'ArchiveReport', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ArchiveReport]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ArchiveReport'
GO
/****** Object:  View [dbo].[EOM Statment]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[EOM Statment]'))
EXEC dbo.sp_executesql @statement = N'/*
*   SSMA warning messages:
*   A2SS0030: View ''EOM Statment'' has a name that might cause problems for the Access application to function correctly against SQL Server.
*/

CREATE VIEW dbo.[EOM Statment]
AS 
   /*Generated by SQL Server Migration Assistant for Access version 6.0.0.*/
   SELECT 
      [ReportData].[CallID], 
      [ReportData].[Confirmation], 
      [ReportData].[Fname], 
      [ReportData].[Lname], 
      [ReportData].[CallDate], 
      [ReportData].[Posted Date]
   FROM [ReportData]
   WHERE ((([ReportData].[Fname]) IS NOT NULL) AND (([ReportData].[CallDate]) > CONVERT(DATETIME, ''2007-10-31T00:00:00.000'', 126) AND ([ReportData].[CallDate]) < CONVERT(DATETIME, ''2008-04-01T00:00:00.000'', 126)))' 
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'VIEW',N'EOM Statment', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[EOM Statment]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'EOM Statment'
GO
/****** Object:  View [dbo].[FrmNewReports]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FrmNewReports]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.[FrmNewReports]
AS 
   /*Generated by SQL Server Migration Assistant for Access version 6.0.0.*/
   SELECT TOP 9223372036854775807 WITH TIES 
      [ReportData].[Confirmation], 
      [ReportData].[Fname], 
      [ReportData].[Lname], 
      [ReportData].[SID], 
      [ReportData].[Subscriber], 
      [ReportData].[DOB], 
      [ReportData].[Phone], 
      [ReportData].[CBtime], 
      [ReportData].[AnonReq], 
      [ReportData].[Lang], 
      [ReportData].[Comments], 
      [ReportData].[verified], 
      [ReportData].[Verifiedby], 
      [ReportData].[VerifiedDate], 
      [ReportData].[CallDate], 
      [ReportData].[CallStatus], 
      [ReportData].[CallID], 
      [ReportData].[CallPosted]
   FROM [ReportData]
   WHERE ((([ReportData].[verified]) = 0) AND (([ReportData].[CallPosted]) = 0))
   ORDER BY [ReportData].[CallDate]' 
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'VIEW',N'FrmNewReports', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[FrmNewReports]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FrmNewReports'
GO
/****** Object:  View [dbo].[FrmUnverified]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FrmUnverified]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.[FrmUnverified]
AS 
   /*Generated by SQL Server Migration Assistant for Access version 6.0.0.*/
   SELECT TOP 9223372036854775807 WITH TIES 
      [ReportData].[Confirmation], 
      [ReportData].[Fname], 
      [ReportData].[Lname], 
      [ReportData].[SID], 
      [ReportData].[Subscriber], 
      [ReportData].[DOB], 
      [ReportData].[Phone], 
      [ReportData].[CBtime], 
      [ReportData].[AnonReq], 
      [ReportData].[Lang], 
      [ReportData].[Comments], 
      [ReportData].[verified], 
      [ReportData].[Verifiedby], 
      [ReportData].[VerifiedDate], 
      [ReportData].[CallDate], 
      [ReportData].[CallStatus], 
      [ReportData].[CallID]
   FROM [ReportData]
   WHERE ((([ReportData].[verified]) = 0) AND (([ReportData].[VerifiedDate]) = ''Posted Not Verified''))
   ORDER BY [ReportData].[CallDate]' 
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'VIEW',N'FrmUnverified', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[FrmUnverified]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FrmUnverified'
GO
/****** Object:  View [dbo].[NewReportsUnPosted]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NewReportsUnPosted]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.[NewReportsUnPosted]
AS 
   /*Generated by SQL Server Migration Assistant for Access version 6.0.0.*/
   SELECT TOP 9223372036854775807 WITH TIES 
      [ReportData].[Confirmation], 
      [ReportData].[Fname], 
      [ReportData].[Lname], 
      [ReportData].[SID], 
      [ReportData].[Subscriber], 
      [ReportData].[DOB], 
      [ReportData].[Phone], 
      [ReportData].[CBtime], 
      [ReportData].[AnonReq], 
      [ReportData].[Lang], 
      [ReportData].[Comments], 
      [ReportData].[verified], 
      [ReportData].[Verifiedby], 
      [ReportData].[VerifiedDate], 
      [ReportData].[CallDate], 
      [ReportData].[CallStatus], 
      [ReportData].[CallID], 
      [Respdata].[QID], 
      [Respdata].[Dcollect], 
      [ReportData].[CallPosted]
   FROM 
      [ReportData] 
         LEFT JOIN [Respdata] 
         ON [ReportData].[CallID] = [Respdata].[CallID]
   WHERE ((([ReportData].[verified]) = 0) AND (([ReportData].[CallPosted]) = 0))
   ORDER BY [ReportData].[CallDate]' 
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'VIEW',N'NewReportsUnPosted', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[NewReportsUnPosted]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'NewReportsUnPosted'
GO
/****** Object:  View [dbo].[OldEOM]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[OldEOM]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.[OldEOM]
AS 
   /*Generated by SQL Server Migration Assistant for Access version 6.0.0.*/
   SELECT 
      [ReportData].[CallID], 
      [ReportData].[Confirmation], 
      [ReportData].[Fname], 
      [ReportData].[Lname], 
      [ReportData].[CallDate], 
      [ReportData].[Posted Date]
   FROM [ReportData]
   WHERE ((([ReportData].[Fname]) IS NOT NULL) AND (([ReportData].[CallDate]) > CONVERT(DATETIME, ''2007-08-31T00:00:00.000'', 126) AND ([ReportData].[CallDate]) < CONVERT(DATETIME, ''2007-11-01T00:00:00.000'', 126)))' 
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'VIEW',N'OldEOM', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[OldEOM]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OldEOM'
GO
/****** Object:  View [dbo].[RptOpenCalls]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[RptOpenCalls]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.[RptOpenCalls]
AS 
   /*Generated by SQL Server Migration Assistant for Access version 6.0.0.*/
   SELECT 
      [ReportData].[Confirmation], 
      [ReportData].[CallDate], 
      [ReportData].[Posted Date], 
      [ReportData].[AnonReq], 
      [ReportData].[Lang], 
      [ReportData].[SID], 
      [ReportData].[Subscriber], 
      [ReportData].[Fname], 
      [ReportData].[Lname], 
      [ReportData].[Phone]
   FROM [ReportData]
   WHERE ((([ReportData].[verified]) = 0))' 
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'VIEW',N'RptOpenCalls', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[RptOpenCalls]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RptOpenCalls'
GO
/****** Object:  View [dbo].[syssettingsQuery]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[syssettingsQuery]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.[syssettingsQuery]
AS 
   /*Generated by SQL Server Migration Assistant for Access version 6.0.0.*/
   SELECT [syssettings].[Setting], [syssettings].[SettingValue]
   FROM [syssettings]' 
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'VIEW',N'syssettingsQuery', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[syssettingsQuery]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'syssettingsQuery'
GO
/****** Object:  View [dbo].[unverified]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[unverified]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.[unverified]
AS 
   /*Generated by SQL Server Migration Assistant for Access version 6.0.0.*/
   SELECT TOP 9223372036854775807 WITH TIES 
      [ReportData].[Confirmation], 
      [ReportData].[Fname], 
      [ReportData].[Lname], 
      [ReportData].[SID], 
      [ReportData].[Subscriber], 
      [ReportData].[DOB], 
      [ReportData].[Phone], 
      [ReportData].[CBtime], 
      [ReportData].[AnonReq], 
      [ReportData].[Lang], 
      [ReportData].[Comments], 
      [ReportData].[verified], 
      [ReportData].[Verifiedby], 
      [ReportData].[VerifiedDate], 
      [ReportData].[CallDate], 
      [ReportData].[CallStatus], 
      [ReportData].[CallID], 
      [Respdata].[QID], 
      [Respdata].[Dcollect], 
      [ReportData].[Posted Date]
   FROM 
      [ReportData] 
         INNER JOIN [Respdata] 
         ON [ReportData].[CallID] = [Respdata].[CallID]
   WHERE ((([ReportData].[verified]) = 0))
   ORDER BY [ReportData].[CallDate]' 
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'VIEW',N'unverified', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[unverified]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'unverified'
GO
/****** Object:  View [dbo].[UtilData]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[UtilData]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.[UtilData]
AS 
   /*Generated by SQL Server Migration Assistant for Access version 6.0.0.*/
   SELECT 
      [ReportData].[CallID], 
      [ReportData].[Confirmation], 
      [ReportData].[SID], 
      [ReportData].[Subscriber], 
      [ReportData].[Fname], 
      [ReportData].[Lname], 
      [ReportData].[DOB], 
      [ReportData].[Phone], 
      [ReportData].[CBtime], 
      [ReportData].[AnonReq], 
      [ReportData].[Lang], 
      [ReportData].[Comments], 
      [ReportData].[verified], 
      [ReportData].[Verifiedby], 
      [ReportData].[VerifiedDate], 
      [ReportData].[CallDate], 
      [ReportData].[CallStatus], 
      [ReportData].[CallPosted], 
      [ReportData].[Posted Date]
   FROM [ReportData]
   WHERE ((([ReportData].[CallStatus]) = ''Completed Normal''))' 
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'VIEW',N'UtilData', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[UtilData]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UtilData'
GO
/****** Object:  View [dbo].[verified]    Script Date: 6/13/2019 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[verified]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.[verified]
AS 
   /*Generated by SQL Server Migration Assistant for Access version 6.0.0.*/
   SELECT 
      [ReportData].[Confirmation], 
      [ReportData].[Fname], 
      [ReportData].[Lname], 
      [ReportData].[SID], 
      [ReportData].[Subscriber], 
      [ReportData].[DOB], 
      [ReportData].[Phone], 
      [ReportData].[CBtime], 
      [ReportData].[AnonReq], 
      [ReportData].[Lang], 
      [ReportData].[Comments], 
      [ReportData].[verified], 
      [ReportData].[Verifiedby], 
      [ReportData].[VerifiedDate], 
      [ReportData].[CallDate], 
      [ReportData].[CallStatus], 
      [Respdata].[QID], 
      [Respdata].[Dcollect]
   FROM 
      [ReportData] 
         INNER JOIN [Respdata] 
         ON [ReportData].[CallID] = [Respdata].[CallID]
   WHERE ((([ReportData].[verified]) = 1))' 
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'VIEW',N'verified', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[verified]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'verified'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'QMaster', N'CONSTRAINT',N'QMaster$PrimaryKey'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[QMaster].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QMaster', @level2type=N'CONSTRAINT',@level2name=N'QMaster$PrimaryKey'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'SampleCallFlow', N'CONSTRAINT',N'SampleCallFlow$ID'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[SampleCallFlow].[ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SampleCallFlow', @level2type=N'CONSTRAINT',@level2name=N'SampleCallFlow$ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'DMaker', N'CONSTRAINT',N'DMaker$PrimaryKey'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[DMaker].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DMaker', @level2type=N'CONSTRAINT',@level2name=N'DMaker$PrimaryKey'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata', N'CONSTRAINT',N'Respdata$PrimaryKey'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata', @level2type=N'CONSTRAINT',@level2name=N'Respdata$PrimaryKey'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'DUAL', N'CONSTRAINT',N'DUAL$PrimaryKey'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[DUAL].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DUAL', @level2type=N'CONSTRAINT',@level2name=N'DUAL$PrimaryKey'
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$AnonReq$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Paste Errors$AnonReq$disallow_zero_length] CHECK  ((len([AnonReq])>(0)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$AnonReq$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors] CHECK CONSTRAINT [SSMA_CC$Paste Errors$AnonReq$disallow_zero_length]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$CallID$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Paste Errors$CallID$disallow_zero_length] CHECK  ((len([CallID])>(0)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$CallID$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors] CHECK CONSTRAINT [SSMA_CC$Paste Errors$CallID$disallow_zero_length]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$CallStatus$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Paste Errors$CallStatus$disallow_zero_length] CHECK  ((len([CallStatus])>(0)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$CallStatus$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors] CHECK CONSTRAINT [SSMA_CC$Paste Errors$CallStatus$disallow_zero_length]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$CBtime$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Paste Errors$CBtime$disallow_zero_length] CHECK  ((len([CBtime])>(0)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$CBtime$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors] CHECK CONSTRAINT [SSMA_CC$Paste Errors$CBtime$disallow_zero_length]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$Comments$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Paste Errors$Comments$disallow_zero_length] CHECK  ((len([Comments])>(0)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$Comments$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors] CHECK CONSTRAINT [SSMA_CC$Paste Errors$Comments$disallow_zero_length]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$Confirmation$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Paste Errors$Confirmation$disallow_zero_length] CHECK  ((len([Confirmation])>(0)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$Confirmation$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors] CHECK CONSTRAINT [SSMA_CC$Paste Errors$Confirmation$disallow_zero_length]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$DOB$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Paste Errors$DOB$disallow_zero_length] CHECK  ((len([DOB])>(0)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$DOB$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors] CHECK CONSTRAINT [SSMA_CC$Paste Errors$DOB$disallow_zero_length]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$Fname$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Paste Errors$Fname$disallow_zero_length] CHECK  ((len([Fname])>(0)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$Fname$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors] CHECK CONSTRAINT [SSMA_CC$Paste Errors$Fname$disallow_zero_length]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$Lang$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Paste Errors$Lang$disallow_zero_length] CHECK  ((len([Lang])>(0)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$Lang$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors] CHECK CONSTRAINT [SSMA_CC$Paste Errors$Lang$disallow_zero_length]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$Lname$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Paste Errors$Lname$disallow_zero_length] CHECK  ((len([Lname])>(0)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$Lname$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors] CHECK CONSTRAINT [SSMA_CC$Paste Errors$Lname$disallow_zero_length]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$Phone$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Paste Errors$Phone$disallow_zero_length] CHECK  ((len([Phone])>(0)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$Phone$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors] CHECK CONSTRAINT [SSMA_CC$Paste Errors$Phone$disallow_zero_length]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$SID$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Paste Errors$SID$disallow_zero_length] CHECK  ((len([SID])>(0)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$SID$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors] CHECK CONSTRAINT [SSMA_CC$Paste Errors$SID$disallow_zero_length]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$Subscriber$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Paste Errors$Subscriber$disallow_zero_length] CHECK  ((len([Subscriber])>(0)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$Subscriber$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors] CHECK CONSTRAINT [SSMA_CC$Paste Errors$Subscriber$disallow_zero_length]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$Verifiedby$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Paste Errors$Verifiedby$disallow_zero_length] CHECK  ((len([Verifiedby])>(0)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[SSMA_CC$Paste Errors$Verifiedby$disallow_zero_length]') AND parent_object_id = OBJECT_ID(N'[dbo].[Paste Errors]'))
ALTER TABLE [dbo].[Paste Errors] CHECK CONSTRAINT [SSMA_CC$Paste Errors$Verifiedby$disallow_zero_length]
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata 04-09', N'CONSTRAINT',N'Respdata 04-09$PrimaryKey'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata 04-09].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata 04-09', @level2type=N'CONSTRAINT',@level2name=N'Respdata 04-09$PrimaryKey'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'QType', N'CONSTRAINT',N'QType$PrimaryKey'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[QType].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QType', @level2type=N'CONSTRAINT',@level2name=N'QType$PrimaryKey'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Report Data 04-09', N'CONSTRAINT',N'Report Data 04-09$PrimaryKey'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Report Data 04-09].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Report Data 04-09', @level2type=N'CONSTRAINT',@level2name=N'Report Data 04-09$PrimaryKey'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'ReportData-10-07', N'CONSTRAINT',N'ReportData-10-07$PrimaryKey'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[ReportData-10-07].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReportData-10-07', @level2type=N'CONSTRAINT',@level2name=N'ReportData-10-07$PrimaryKey'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'Respdata-10-07', N'CONSTRAINT',N'Respdata-10-07$PrimaryKey'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[Respdata-10-07].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Respdata-10-07', @level2type=N'CONSTRAINT',@level2name=N'Respdata-10-07$PrimaryKey'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_SSMA_SOURCE' , N'SCHEMA',N'dbo', N'TABLE',N'syssettings', N'CONSTRAINT',N'syssettings$PrimaryKey'))
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'CorPaccHL for web.[syssettings].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'syssettings', @level2type=N'CONSTRAINT',@level2name=N'syssettings$PrimaryKey'
GO

/****** Adding Bears to fixed database roles    Script Date: 6/13/2019 6:19:56 PM ******/
ALTER ROLE [db_owner] ADD MEMBER [Bears]
GO

/****** Setting default schemas for migrated users    Script Date: 6/13/2019 6:19:56 PM ******/
ALTER USER [Bears] WITH DEFAULT_SCHEMA = [dbo]
GO

/****** Database Level Permissions    Script Date: 6/13/2019 6:19:57 PM ******/
GRANT CONNECT TO [Bears]
    AS [dbo]
GO

