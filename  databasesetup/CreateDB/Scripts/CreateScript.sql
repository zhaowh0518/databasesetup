SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BugPredicate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BugPredicate](
	[BugPredicateID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](128) NULL,
	[Description] [varchar](512) NULL,
 CONSTRAINT [PK_BUGPREDICATE] PRIMARY KEY CLUSTERED 
(
	[BugPredicateID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'缺陷谓词' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'BugPredicate'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[D_LeaveHospitalState]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[D_LeaveHospitalState](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Pinyin] [nvarchar](max) NULL,
	[GB] [nvarchar](max) NULL,
 CONSTRAINT [PK_D_LeaveHospitalState] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[D_ICD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[D_ICD](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ICD_10] [nvarchar](max) NULL,
	[ICD_10_S] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[ICD_9] [nvarchar](max) NULL,
	[ICD_9_S] [nvarchar](max) NULL,
	[Name_EN] [nvarchar](max) NULL,
	[Pinyin] [nvarchar](max) NULL,
	[GB] [nvarchar](max) NULL,
	[Tag] [nvarchar](max) NULL,
 CONSTRAINT [PK_D_ICD] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[D_JobTitle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[D_JobTitle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[FullName] [nvarchar](max) NULL,
	[Pinyin] [nvarchar](max) NULL,
	[GB] [nvarchar](max) NULL,
 CONSTRAINT [PK_D_JobTitle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[D_Ward]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[D_Ward](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[FullName] [nvarchar](max) NULL,
	[Pinyin] [nvarchar](max) NULL,
	[GB] [nvarchar](max) NULL,
 CONSTRAINT [PK_D_Ward] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CaseInfo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CaseInfo](
	[CaseInfoID] [int] IDENTITY(1,1) NOT NULL,
	[CaseNum] [int] NULL,
	[Sequence] [int] NULL,
	[Name] [nvarchar](128) NULL,
	[Sex] [int] NULL,
	[InHospitalDate] [datetime] NULL,
	[InHospitalDep] [int] NULL,
	[InHospitalWard] [int] NULL,
	[InHospitalDiagnosis] [int] NULL,
	[OutHospitalDate] [datetime] NULL,
	[OutHospitalDep] [int] NULL,
	[OutHospitalWard] [int] NULL,
	[OutHospitalDiagnosis] [int] NULL,
	[OutHospitalDescription] [int] NULL,
	[FirstOperate] [int] NULL,
	[DirectorDoc] [int] NULL,
	[MainDoc] [int] NULL,
	[SecondDoc] [int] NULL,
	[InhospitalDoc] [int] NULL,
	[Description] [nvarchar](512) NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_CaseInfo_CreateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_CASEINFO] PRIMARY KEY CLUSTERED 
(
	[CaseInfoID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'病案编号' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'CaseInfo', @level2type=N'COLUMN', @level2name=N'CaseNum'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Standard]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Standard](
	[StandardID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](128) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Standard_Status]  DEFAULT ((1)),
	[Description] [varchar](512) NULL,
 CONSTRAINT [PK_STANDARD] PRIMARY KEY CLUSTERED 
(
	[StandardID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效：0，无效；1，有效' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Standard', @level2type=N'COLUMN', @level2name=N'Status'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标准表' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Standard'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Report4_6]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-7-30
-- Description:	retrieve data for report 4.6
-- =============================================
-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-8-12
-- Description:	add 4 effective number processing
-- =============================================
CREATE PROCEDURE [dbo].[sp_Report4_6]
--10 parameters
	@Mode int = 0,
	@StandardId int = 1,
	@OutStart datetime = null,
	@OutEnd datetime = null,
	@QcStart datetime = null,
	@QcEnd datetime = null,
	@OutDeptId int = null,
	@OutWardId int = null,
	@CompStart datetime = null,
	@CompEnd datetime = null
AS
BEGIN
SET NOCOUNT ON;
---------------------------------------------------------------------------------



--create temp table storing parameter
--not repeatly
declare @init_p varchar(max)
create table #p
(
	OutStart datetime,
	OutEnd datetime,
	StandardId int,
	CompStart datetime,
	CompEnd datetime
)
insert into #p values(@OutStart, @OutEnd, @StandardId,@CompStart,@CompEnd)
set @init_p = ''
declare @s datetime
declare @e datetime
declare @sid int
declare @cs datetime
declare @ce datetime
select @s=OutStart from #p
select @e=OutEnd from #p
select @s=StandardId from #p
select @cs=CompStart from #p
select @cs=CompEnd from #p
''

--create report schema and x dimension
--30 cols
--not repeatly
create table #t
(
	Id int,
	CName nvarchar(max),
	OutHCaseNumA int,
	OutHCaseNumB int,
	CheckedCaseNumA int,
	CheckedCaseNumB int,
	CheckedRateA float,
	CheckedRateB float,
	PassedCaseNumA int,
	PassedCaseNumB int,
	PassedRateA float,
	PassedRateB float,
	AvgScoreA float,
	AvgScoreB float,
	LV1A int,
	LV1B int,
	LV1ARate float,
	LV1BRate float,
	LV2A int,
	LV2B int,
	LV2ARate float,
	LV2BRate float,
	LV3A int,
	LV3B int,
	LV3ARate float,
	LV3BRate float,
	VetoA int,
	VetoB int,
	VetoARate float,
	VetoBRate float,
	SentReqA int,
	SentReqB int,
	RepairedA int,
	RepairedB int,
	RepairedRateA float,
	RepairedRateB float
)

--determine dict table name / column name for grouping by.
--not repeatly
declare @groupbycol as varchar(128)
declare @ydimtable as varchar(128)
if @mode = 0
begin
	set @groupbycol = ''outhospitaldep''
	set @ydimtable = ''d_department''
end
if @mode = 1
begin
	set @groupbycol = ''outhospitalward''
	set @ydimtable = ''d_ward''
end

--create y dimension
--not repeatly
declare @sql varchar(max)
set @sql = ''insert into #t select	id,name,0,0,0,
									0,0,0,0,0,
									0,0,0,0,0,
									0,0,0,0,0,
									0,0,0,0,0,
									0,0,0,0,0,
									0,0,0,0,0,
									0 from '' + @ydimtable
exec(@sql)

------------------------------------------------------------------------------------------
------------A
declare @wherepre1 varchar(max)
set @wherepre1 = ''
	where
		(OutHospitalDate >= @s or @s is null) and
		(OutHospitalDate <= @e or @e is null)
''

--insert OutHospCaseNumA
set @sql = @init_p + ''
update #t
set OutHCaseNumA = a.num
from (
	select 
		''+@groupbycol+'',
		count(*) as num 
	from caseinfo
	''+@wherepre1+''
	group by ''+@groupbycol+''
) a
join #t b on b.id=a.''+@groupbycol+''
''
exec(@sql)

--insert CheckedCaseNumA
set @sql = @init_p + ''
update #t
set CheckedCaseNumA = a.num
from (
	select 
		c.''+@groupbycol+'',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	''+@wherepre1+''
	group by c.''+@groupbycol+''
) a
join #t b on b.id=a.''+@groupbycol+''

update #t set CheckedRateA=dbo.GetQuotientFrom2Int(CheckedCaseNumA,OutHCaseNumA) where OutHCaseNumA != 0
''
--update #t set CheckedRateA=CheckedCaseNumA/cast(OutHCaseNumA as float) where OutHCaseNumA != 0

exec(@sql)

--insert PassedCaseNumA
set @sql = @init_p + ''
update #t
set PassedCaseNumA = a.num
from (
	select 
		c.''+@groupbycol+'',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	''+@wherepre1+'' and g.score >= 60
	group by c.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''

update #t set PassedRateA=dbo.GetQuotientFrom2Int(PassedCaseNumA,CheckedCaseNumA) where CheckedCaseNumA != 0
''
--update #t set PassedRateA=PassedCaseNumA/cast(CheckedCaseNumA as float) where CheckedCaseNumA != 0
exec(@sql)

--insert AvgScoreA
set @sql = @init_p + ''
update #t
set AvgScoreA = a.num
from (
	select 
		c.''+@groupbycol+'',
		avg(score) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	''+@wherepre1+''
	group by c.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''
''
exec(@sql)

--insert LV1A
set @sql = @init_p + ''
update #t
set LV1A = a.num
from (
	select 
		c.''+@groupbycol+'',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	''+@wherepre1+'' and g.levelid=1
	group by c.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''

update #t set LV1ARate = dbo.GetQuotientFrom2Int(LV1A,CheckedCaseNumA) where CheckedCaseNumA != 0
''
--update #t set LV1ARate = LV1A/cast(CheckedCaseNumA as float) where CheckedCaseNumA != 0
exec(@sql)

--insert LV2A
set @sql = @init_p + ''
update #t
set LV2A = a.num
from (
	select 
		c.''+@groupbycol+'',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	''+@wherepre1+'' and g.levelid=2
	group by c.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''

update #t set LV2ARate = dbo.GetQuotientFrom2Int(LV2A,CheckedCaseNumA) where CheckedCaseNumA != 0
''
--update #t set LV2ARate = LV2A/cast(CheckedCaseNumA as float) where CheckedCaseNumA != 0
exec(@sql)


--insert LV3A
set @sql = @init_p + ''
update #t
set LV3A = a.num
from (
	select 
		c.''+@groupbycol+'',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	''+@wherepre1+'' and g.levelid=3
	group by c.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''

update #t set LV3ARate = dbo.GetQuotientFrom2Int(LV3A,CheckedCaseNumA) where CheckedCaseNumA != 0
''
--update #t set LV3ARate = LV3A/cast(CheckedCaseNumA as float) where CheckedCaseNumA != 0
exec(@sql)

--insert VetoA
set @sql = @init_p + ''
update #t
set VetoA = a.num
from (
	select 
		b.''+@groupbycol+'',
		count(*) as num
	from graderesult a
	left join caseinfo b on a.caseinfoid=b.caseinfoid
	''+@wherepre1+'' and dbo.IsVetoGradeResult(graderesultid,@sid)=1
	group by b.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''

update #t set VetoARate = dbo.GetQuotientFrom2Int(VetoA,CheckedCaseNumA) where CheckedCaseNumA != 0
''
--update #t set VetoARate = VetoA/cast(CheckedCaseNumA as float) where CheckedCaseNumA != 0
exec(@sql)


--insert SentReqA
set @sql = @init_p + ''
update #t
set SentReqA = a.num
from (
	select 
		c.''+@groupbycol+'',
		count(*) as num
	from requisition r
	left join graderesult g on r.graderesultid=g.graderesultid
	left join caseinfo c on c.caseinfoid=g.caseinfoid
	''+@wherepre1+'' and r.issent=1
	group by c.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''
''
exec(@sql)

--insert RepairedA
set @sql = @init_p + ''
update #t
set RepairedA = a.num
from (
	select 
		c.''+@groupbycol+'',
		count(*) as num
	from graderesult g
	left join caseinfo c on g.caseinfoid=c.caseinfoid
	''+@wherepre1+'' and g.isreworked=1
	group by c.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''

update #t set RepairedRateA=dbo.GetQuotientFrom2Int(RepairedA,SentReqA) where SentReqA != 0
''
--update #t set RepairedRateA=RepairedA/cast(SentReqA as float) where SentReqA != 0
exec(@sql)

------------------------------------------------------------------------------------------
------------B
declare @wherepreB varchar(max)
set @wherepreB = ''
	where
		(OutHospitalDate >= @cs or @cs is null) and
		(OutHospitalDate <= @ce or @ce is null)
''

--insert OutHospCaseNumB
set @sql = @init_p + ''
update #t
set OutHCaseNumB = a.num
from (
	select 
		''+@groupbycol+'',
		count(*) as num 
	from caseinfo
	''+@wherepreB+''
	group by ''+@groupbycol+''
) a
join #t b on b.id=a.''+@groupbycol+''
''
exec(@sql)

--insert CheckedCaseNumB
set @sql = @init_p + ''
update #t
set CheckedCaseNumB = a.num
from (
	select 
		c.''+@groupbycol+'',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	''+@wherepreB+''
	group by c.''+@groupbycol+''
) a
join #t b on b.id=a.''+@groupbycol+''

update #t set CheckedRateB=dbo.GetQuotientFrom2Int(CheckedCaseNumB,OutHCaseNumB) where OutHCaseNumB != 0
''
--update #t set CheckedRateB=CheckedCaseNumB/cast(OutHCaseNumB as float) where OutHCaseNumB != 0
exec(@sql)

--insert PassedCaseNumB
set @sql = @init_p + ''
update #t
set PassedCaseNumB = a.num
from (
	select 
		c.''+@groupbycol+'',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	''+@wherepreB+'' and g.score >= 60
	group by c.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''

update #t set PassedRateB=dbo.GetQuotientFrom2Int(PassedCaseNumB,CheckedCaseNumB) where CheckedCaseNumB != 0
''
--update #t set PassedRateB=PassedCaseNumB/cast(CheckedCaseNumB as float) where CheckedCaseNumB != 0
exec(@sql)

--insert AvgScoreB
set @sql = @init_p + ''
update #t
set AvgScoreB = a.num
from (
	select 
		c.''+@groupbycol+'',
		avg(score) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	''+@wherepreB+''
	group by c.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''
''
exec(@sql)

--insert LV1B
set @sql = @init_p + ''
update #t
set LV1B = a.num
from (
	select 
		c.''+@groupbycol+'',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	''+@wherepreB+'' and g.levelid=1
	group by c.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''

update #t set LV1BRate = dbo.GetQuotientFrom2Int(LV1B,CheckedCaseNumB) where CheckedCaseNumB != 0
''
--update #t set LV1BRate = LV1B/cast(CheckedCaseNumB as float) where CheckedCaseNumB != 0
exec(@sql)

--insert LV2B
set @sql = @init_p + ''
update #t
set LV2B = a.num
from (
	select 
		c.''+@groupbycol+'',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	''+@wherepreB+'' and g.levelid=2
	group by c.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''

update #t set LV2BRate = dbo.GetQuotientFrom2Int(LV2B,CheckedCaseNumB) where CheckedCaseNumB != 0
''
--update #t set LV2BRate = LV2B/cast(CheckedCaseNumB as float) where CheckedCaseNumB != 0
exec(@sql)

--insert LV3B
set @sql = @init_p + ''
update #t
set LV3B = a.num
from (
	select 
		c.''+@groupbycol+'',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	''+@wherepreB+'' and g.levelid=3
	group by c.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''

update #t set LV3BRate = dbo.GetQuotientFrom2Int(LV3B,CheckedCaseNumB) where CheckedCaseNumB != 0
''
--update #t set LV3BRate = LV3B/cast(CheckedCaseNumB as float) where CheckedCaseNumB != 0
exec(@sql)


--insert VetoB
set @sql = @init_p + ''
update #t
set VetoB = a.num
from (
	select 
		b.''+@groupbycol+'',
		count(*) as num
	from graderesult a
	left join caseinfo b on a.caseinfoid=b.caseinfoid
	''+@wherepreB+'' and dbo.IsVetoGradeResult(graderesultid,@sid)=1
	group by b.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''

update #t set VetoBRate = dbo.GetQuotientFrom2Int(VetoB,CheckedCaseNumB) where CheckedCaseNumB != 0
''
--update #t set VetoBRate = VetoB/cast(CheckedCaseNumB as float) where CheckedCaseNumB != 0
exec(@sql)


--insert SentReqB
set @sql = @init_p + ''
update #t
set SentReqB = a.num
from (
	select 
		c.''+@groupbycol+'',
		count(*) as num
	from requisition r
	left join graderesult g on r.graderesultid=g.graderesultid
	left join caseinfo c on c.caseinfoid=g.caseinfoid
	''+@wherepreB+'' and r.issent=1
	group by c.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''
''
exec(@sql)

--insert RepairedB
set @sql = @init_p + ''
update #t
set RepairedB = a.num
from (
	select 
		c.''+@groupbycol+'',
		count(*) as num
	from graderesult g
	left join caseinfo c on g.caseinfoid=c.caseinfoid
	''+@wherepreB+'' and g.isreworked=1
	group by c.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''

update #t set RepairedRateB=dbo.GetQuotientFrom2Int(RepairedB,SentReqB) where SentReqB != 0
''
--update #t set RepairedRateB=RepairedB/cast(SentReqB as float) where SentReqB != 0
exec(@sql)

--retrive table
select * from #t

--clear temp table
drop table #t
drop table #p



---------------------------------------------------------------------------------
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserGroup](
	[UserGroupID] [int] IDENTITY(1,1) NOT NULL,
	[UserGroupName] [varchar](128) NULL,
 CONSTRAINT [PK_USERGROUP] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户的角色' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'UserGroup'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectCaseItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[SelectCaseItem]
(
	@CaseItemID int = null
)
AS
	SET NOCOUNT ON;
SELECT *
FROM CaseItem
WHERE CaseItemID=@CaseItemID or @CaseItemID is null
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectQcItemExcludingFromBugList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-8-6
-- Description:	Get a table(BugId/QcItemId/BugPredicateName/QcItemName) excluding BugId from a given list.
-- =============================================
CREATE PROCEDURE [dbo].[SelectQcItemExcludingFromBugList]
	@caseitemid int,
	@list varchar(max)
AS
BEGIN
	SET NOCOUNT ON;

	declare @sql varchar(max)
	set @sql = ''
		select 
			distinct
			qci.QcItemId,
			q.Name as QcItemName
		from bug b
		inner join qccaseitem qci on b.qccaseitemid=qci.qccaseitemid
		inner join bugpredicate bp on bp.bugpredicateid=b.predicateid
		inner join qcitem q on q.qcitemid=qci.qcitemid
		where 
			caseitemid=''+cast(@caseitemid as varchar(8))+'' and 
			bugid not in (''+@list+'')
		order by qci.QcItemId
		''

	exec(@sql)

END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectBugExcludingFromBugList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-8-6
-- Description:	Get a table(BugId/QcItemId/BugPredicateName/QcItemName) excluding BugId from a given list.
-- =============================================
CREATE PROCEDURE [dbo].[SelectBugExcludingFromBugList]
	@caseitemid int,
	@list varchar(max)
AS
BEGIN
	SET NOCOUNT ON;

	declare @sql varchar(max)
	set @sql = ''
		select 
			BugId,
			qci.QcItemId,
			bp.Name as BugPredicateName
		from bug b
		inner join qccaseitem qci on b.qccaseitemid=qci.qccaseitemid
		inner join bugpredicate bp on bp.bugpredicateid=b.predicateid
		inner join qcitem q on q.qcitemid=qci.qcitemid
		where 
			caseitemid=''+cast(@caseitemid as varchar(8))+'' and 
			bugid not in (''+@list+'')
		order by qci.QcItemId
		''

	exec(@sql)

END



' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectDictionary]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[SelectDictionary]
(
	@Type varchar(50) = null
)
AS
	SET NOCOUNT ON;
SELECT *
FROM Dictionary
WHERE [Type]=@Type or @Type is null
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetQuotientFrom2Int]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-8-10
-- Description:	get quotient with 4 effective numbers from 2 int and return a string 
-- =============================================
-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-8-25
-- Description:	result multiples 100 times then return
-- =============================================

CREATE FUNCTION [dbo].[GetQuotientFrom2Int]
(
	@a int,
	@b int
)
RETURNS varchar(8)
AS
BEGIN

	RETURN cast(
				cast(
					(cast(@a as float) / cast(@b as float) ) * 100
				as decimal(5,2) ) 
			as varchar(8))

END
' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dictionary]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Dictionary](
	[DictionaryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](128) NULL,
	[Value] [int] NULL,
	[Type] [varchar](128) NULL,
	[Description] [varchar](512) NULL,
 CONSTRAINT [PK_DICTIONARY] PRIMARY KEY CLUSTERED 
(
	[DictionaryID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键，自增的' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Dictionary', @level2type=N'COLUMN', @level2name=N'DictionaryID'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字典值' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Dictionary', @level2type=N'COLUMN', @level2name=N'Name'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属的值' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Dictionary', @level2type=N'COLUMN', @level2name=N'Value'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型，标示不同的字典' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Dictionary', @level2type=N'COLUMN', @level2name=N'Type'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述，用于扩充' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Dictionary', @level2type=N'COLUMN', @level2name=N'Description'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字典表' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Dictionary'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Report_InHospitalCaseQualityStat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-7-16
-- Description:	Create sp for retrieving data for report 4.1
-- =============================================
-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-8-5
-- Description:	v1.0
-- =============================================
-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-8-12
-- Description:	(v1.1) add 4 effective numbers processing
-- =============================================
CREATE PROCEDURE [dbo].[Report_InHospitalCaseQualityStat]
--9 parameters
	@Mode int = 0,
	@StandardId int = 1,
	@OutStart datetime = null,
	@OutEnd datetime = null,
	@QcStart datetime = null,
	@QcEnd datetime = null,
	@OutDeptId int = null,
	@OutWardId int = null,
	@BugCategory int = null
AS
BEGIN
SET NOCOUNT ON;
-------------------------------------------------------------------------------------



--create temp table storing parameter
--not repeatly
declare @init_p varchar(max)
create table #p
(
	OutStart datetime,
	OutEnd datetime,
	StandardId int,
)
insert into #p values(@OutStart, @OutEnd, @StandardId)
set @init_p = ''
declare @s datetime
declare @e datetime
declare @sid int
select @s=OutStart from #p
select @e=OutEnd from #p
select @s=StandardId from #p
''

--create report schema and x dimension
--19 cols
--not repeatly
create table #t
(
	Id int,
	CName nvarchar(max),
	OutHCaseNum int,
	CheckedCaseNum int,
	CheckedRate float,
	PassedCaseNum int,
	PassedRate float,
	AvgScore float,
	LV1 int,
	LV1Rate float,
	LV2 int,
	LV2Rate float,
	LV3 int,
	LV3Rate float,
	Veto int,
	VetoRate float,
	SentReq int,
	Repaired int,
	RepairedRate float,
)


--determine dict table name / column name for grouping by.
--determine where clause for creating y dimension
--not repeatly
declare @groupbycol as varchar(128)
declare @ydimtable as varchar(128)
declare @ydimtablewhere varchar(max)
if @mode = 0
begin
	set @groupbycol = ''outhospitaldep''
	set @ydimtable = ''d_department''
	--determine which department
	if @OutDeptId is not null
	begin
		set @ydimtablewhere = ''where id='' + cast(@OutDeptId as varchar(16))
	end
	else
	begin
		set @ydimtablewhere = ''where 1=1''
	end
end
if @mode = 1
begin
	set @groupbycol = ''outhospitalward''
	set @ydimtable = ''d_ward''
	--determine which ward
	if @OutWardId is not null
	begin
		set @ydimtablewhere = ''where id='' + cast(@OutWardId as varchar(16))
	end
	else
	begin
		set @ydimtablewhere = ''where 1=1''
	end
end
if @mode = 2
begin
	set @groupbycol = ''inhospitaldoc''
	set @ydimtable = ''d_doctor''
	set @ydimtablewhere = ''where 1=1''
end


--create y dimension
--not repeatly
declare @sql varchar(max)
set @sql = ''insert into #t select	id,name,0,0,0,
									0,0,0,0,0,
									0,0,0,0,0,
									0,0,0,0
									from '' + @ydimtable + '' '' + @ydimtablewhere
exec(@sql)

------------------------------------------------------------------------------------------
------------Fill report
declare @wherepre1 varchar(max)
set @wherepre1 = ''
	where
		(OutHospitalDate >= @s or @s is null) and
		(OutHospitalDate <= @e or @e is null)
''

--insert OutHospCaseNum
set @sql = @init_p + ''
update #t
set OutHCaseNum = a.num
from (
	select 
		''+@groupbycol+'',
		count(*) as num 
	from caseinfo
	''+@wherepre1+''
	group by ''+@groupbycol+''
) a
join #t b on b.id=a.''+@groupbycol+''
''
exec(@sql)

--insert CheckedCaseNum
set @sql = @init_p + ''
update #t
set CheckedCaseNum = a.num
from (
	select 
		c.''+@groupbycol+'',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	''+@wherepre1+''
	group by c.''+@groupbycol+''
) a
join #t b on b.id=a.''+@groupbycol+''

update #t set CheckedRate=dbo.GetQuotientFrom2Int(CheckedCaseNum,OutHCaseNum) where OutHCaseNum != 0
''
--update #t set CheckedRate=CheckedCaseNum/cast(OutHCaseNum as float) where OutHCaseNum != 0
exec(@sql)

--insert PassedCaseNum
set @sql = @init_p + ''
update #t
set PassedCaseNum = a.num
from (
	select 
		c.''+@groupbycol+'',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	''+@wherepre1+'' and g.score >= 60
	group by c.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''

update #t set PassedRate=dbo.GetQuotientFrom2Int(PassedCaseNum,CheckedCaseNum) where CheckedCaseNum != 0
''
--update #t set PassedRate=PassedCaseNum/cast(CheckedCaseNum as float) where CheckedCaseNum != 0
exec(@sql)

--insert AvgScore
set @sql = @init_p + ''
update #t
set AvgScore = a.num
from (
	select 
		c.''+@groupbycol+'',
		avg(score) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	''+@wherepre1+''
	group by c.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''
''
exec(@sql)

--insert LV1
set @sql = @init_p + ''
update #t
set LV1 = a.num
from (
	select 
		c.''+@groupbycol+'',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	''+@wherepre1+'' and g.levelid=1
	group by c.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''

update #t set LV1Rate = dbo.GetQuotientFrom2Int(LV1,CheckedCaseNum) where CheckedCaseNum != 0
''
--update #t set LV1Rate = LV1/cast(CheckedCaseNum as float) where CheckedCaseNum != 0
exec(@sql)

--insert LV2
set @sql = @init_p + ''
update #t
set LV2 = a.num
from (
	select 
		c.''+@groupbycol+'',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	''+@wherepre1+'' and g.levelid=2
	group by c.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''

update #t set LV2Rate = dbo.GetQuotientFrom2Int(LV2,CheckedCaseNum) where CheckedCaseNum != 0
''
--update #t set LV2Rate = LV2/cast(CheckedCaseNum as float) where CheckedCaseNum != 0
exec(@sql)


--insert LV3
set @sql = @init_p + ''
update #t
set LV3 = a.num
from (
	select 
		c.''+@groupbycol+'',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	''+@wherepre1+'' and g.levelid=3
	group by c.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''

update #t set LV3Rate = dbo.GetQuotientFrom2Int(LV3,CheckedCaseNum) where CheckedCaseNum != 0
''
--update #t set LV3Rate = LV3/cast(CheckedCaseNum as float) where CheckedCaseNum != 0
exec(@sql)

--insert Veto
set @sql = @init_p + ''
update #t
set Veto = a.num
from (
	select 
		b.''+@groupbycol+'',
		count(*) as num
	from graderesult a
	left join caseinfo b on a.caseinfoid=b.caseinfoid
	''+@wherepre1+'' and dbo.IsVetoGradeResult(graderesultid,@sid)=1
	group by b.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''

update #t set VetoRate = dbo.GetQuotientFrom2Int(Veto,CheckedCaseNum) where CheckedCaseNum != 0
''
--update #t set VetoRate = Veto/cast(CheckedCaseNum as float) where CheckedCaseNum != 0
exec(@sql)

--insert SentReq
set @sql = @init_p + ''
update #t
set SentReq = a.num
from (
	select 
		c.''+@groupbycol+'',
		count(*) as num
	from requisition r
	left join graderesult g on r.graderesultid=g.graderesultid
	left join caseinfo c on c.caseinfoid=g.caseinfoid
	''+@wherepre1+'' and r.issent=1
	group by c.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''
''
exec(@sql)

--insert Repaired
set @sql = @init_p + ''
update #t
set Repaired = a.num
from (
	select 
		c.''+@groupbycol+'',
		count(*) as num
	from graderesult g
	left join caseinfo c on g.caseinfoid=c.caseinfoid
	''+@wherepre1+'' and g.isreworked=1
	group by c.''+@groupbycol+''
) a
join #t b on b.id = a.''+@groupbycol+''

update #t set RepairedRate = dbo.GetQuotientFrom2Int(Repaired,SentReq) where SentReq != 0
''
--update #t set RepairedRate=Repaired/cast(SentReq as float) where SentReq != 0
exec(@sql)



--retrive table
select * from #t

--clear temp table
drop table #t
drop table #p



---------------------------------------------------------------------------------
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QcItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QcItem](
	[QcItemID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](128) NULL,
	[Description] [varchar](1024) NULL,
 CONSTRAINT [PK_QCITEM] PRIMARY KEY CLUSTERED 
(
	[QcItemID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'缺陷项目' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'QcItem'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertStandardBug]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[InsertStandardBug]
(
	@BugID int,
	@StandardID int,
	@FloatScore bit,
	@LimitScore int,
	@IsVeto bit,
	@VetoLevel varchar(128),
	@Duty int,
	@Description varchar(512)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [StandardBug] ([BugID], [StandardID], [FloatScore], [LimitScore], [IsVeto], [VetoLevel], [Duty], [Description]) 
VALUES (@BugID, @StandardID, @FloatScore, @LimitScore, @IsVeto, @VetoLevel, @Duty, @Description);' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteStandardBug]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[DeleteStandardBug]
(
	@StandardBugID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [StandardBug] WHERE [StandardBugID] = @StandardBugID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateStandardBug]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UpdateStandardBug]
(
	@StandardBugID int,
	@BugID int,
	@StandardID int,
	@FloatScore bit,
	@LimitScore int,
	@IsVeto bit,
	@VetoLevel varchar(128),
	@Duty varchar(128),
	@Description varchar(512)
)
AS
	SET NOCOUNT OFF;
UPDATE [StandardBug] SET  [BugID] = @BugID, [StandardID] = @StandardID, [FloatScore] = @FloatScore, [LimitScore] = @LimitScore, [IsVeto] = @IsVeto, [VetoLevel] = @VetoLevel, [Duty] = @Duty, [Description] = @Description 
WHERE [StandardBugID] = @StandardBugID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectCaseInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'





CREATE PROCEDURE [dbo].[SelectCaseInfo]
(
	@sqlWhereText varchar(8000)
)
AS
	SET NOCOUNT ON;
declare @sqlText varchar(8000)
set @sqlText=''
SELECT  distinct c.CaseInfoID,c.CaseNum,c.Sequence,c.[Name],c.Sex,
	c.InHospitalDate,
	c.InHospitalDep as InHospitalDepID,
	dbo.fnGetNameInDictionary(''''Dep'''',c.InHospitalDep) as InHospitalDep,
	c.InHospitalWard as InHospitalWardID,
	dbo.fnGetNameInDictionary(''''Ward'''',c.InHospitalWard) as InHospitalWard,
	c.InHospitalDiagnosis as InHospitalDiagnosisID,
	dbo.fnGetNameInDictionary(''''Diagnosis'''',c.InHospitalDiagnosis) as InHospitalDiagnosis,
	c.OutHospitalDate,
	c.OutHospitalDep as OutHospitalDepID,
	dbo.fnGetNameInDictionary(''''Dep'''',c.OutHospitalDep) as OutHospitalDep,
	c.OutHospitalWard as OutHospitalWardID,
	dbo.fnGetNameInDictionary(''''Ward'''',c.OutHospitalWard) as OutHospitalWard,
	c.OutHospitalDiagnosis as OutHospitalDiagnosisID,
	dbo.fnGetNameInDictionary(''''Diagnosis'''',c.OutHospitalDiagnosis) as OutHospitalDiagnosis,
	c.OutHospitalDescription,
	c.FirstOperate as FirstOperateID,
	dbo.fnGetNameInDictionary(''''Operate'''',c.FirstOperate) as FirstOperate,
	c.DirectorDoc as DirectorDocID,
	dbo.fnGetNameInDictionary(''''Doctor'''',c.DirectorDoc) as DirectorDoc,
	c.InhospitalDoc as InHospitalDocID,
	dbo.fnGetNameInDictionary(''''Doctor'''',c.InhospitalDoc) as InHospitalDoc,
	c.MainDoc as MainDocID,
	dbo.fnGetNameInDictionary(''''Doctor'''',c.MainDoc) as MainDoc,
	c.SecondDoc as SecondDocID,
	dbo.fnGetNameInDictionary(''''Doctor'''',c.SecondDoc) as SecondDoc,
	c.Description,g.GradeResultID,
	g.Score,g.LevelID,
	dbo.fnGetNameInDictionary(''''Level'''',g.LevelID) as Level,
	g.ReworkScore,g.CreateDate as QCDate,g.QCUser as QcUserID,
	u.UserName as QcUser,g.IsReworked,
	c.CreateDate
FROM CaseInfo c
LEFT JOIN GradeResult g on c.CaseInfoID=g.CaseInfoID
LEFT JOIN [User] u on g.QcUser=u.UserID
''
set @sqlText = @sqlText + @sqlWhereText

--print (@sqlText)

execute (@sqlText)







' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ValidateUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[ValidateUser]
(
	@UserName varchar(128),
	@Pwd varchar(128)
)
AS
	SET NOCOUNT ON;
SELECT *
FROM [User]
WHERE UserName=@UserName and Pwd=@Pwd
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectD_Doctor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SelectD_Doctor]
AS
	SET NOCOUNT ON;
SELECT     D_Doctor.*
FROM         D_Doctor' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteD_Doctor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DeleteD_Doctor]
(
	@Original_Id int,
	@IsNull_DepartmentId Int,
	@Original_DepartmentId int,
	@IsNull_JobTitleId Int,
	@Original_JobTitleId int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [D_Doctor] WHERE (([Id] = @Original_Id) AND ((@IsNull_DepartmentId = 1 AND [DepartmentId] IS NULL) OR ([DepartmentId] = @Original_DepartmentId)) AND ((@IsNull_JobTitleId = 1 AND [JobTitleId] IS NULL) OR ([JobTitleId] = @Original_JobTitleId)))' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CaseItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CaseItem](
	[CaseItemID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](128) NULL,
	[Description] [varchar](1024) NULL,
 CONSTRAINT [PK_CASEITEM] PRIMARY KEY CLUSTERED 
(
	[CaseItemID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'病案项目名称' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'CaseItem', @level2type=N'COLUMN', @level2name=N'Name'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'病案项目' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'CaseItem'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateCaseItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UpdateCaseItem]
(
	@CaseItemID int,
	@Name varchar(128),
	@Description varchar(512)
)
AS
	SET NOCOUNT OFF;
UPDATE [CaseItem] SET  [Name] = @Name, [Description] = @Description 
WHERE [CaseItemID] = @CaseItemID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertCaseItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[InsertCaseItem]
(
	@Name varchar(128),
	@Description varchar(512)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [CaseItem] ([Name], [Description]) 
VALUES ( @Name, @Description);
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteCaseItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[DeleteCaseItem]
(
	@CaseItemID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [CaseItem] WHERE [CaseItemID] = @CaseItemID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteD_LeaveHospitalState]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DeleteD_LeaveHospitalState]
(
	@Original_Id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [D_LeaveHospitalState] WHERE (([Id] = @Original_Id))' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[D_CM3]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[D_CM3](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Pinyin] [nvarchar](max) NULL,
	[GB] [nvarchar](max) NULL,
 CONSTRAINT [PK_D_CM3] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[D_Department]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[D_Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[FullName] [nvarchar](max) NULL,
	[Pinyin] [nvarchar](max) NULL,
	[GB] [nvarchar](max) NULL,
 CONSTRAINT [PK_D_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bug]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Bug](
	[BugID] [int] IDENTITY(1,1) NOT NULL,
	[PredicateID] [int] NULL,
	[QcCaseItemID] [int] NULL,
 CONSTRAINT [PK_BUG] PRIMARY KEY CLUSTERED 
(
	[BugID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述一个缺陷，缺陷项目和缺陷谓词的关系表' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Bug'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[D_Doctor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[D_Doctor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[DepartmentId] [int] NULL,
	[JobTitleId] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[Pinyin] [nvarchar](max) NULL,
	[GB] [nvarchar](max) NULL,
 CONSTRAINT [PK_D_Doctor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QcCaseItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QcCaseItem](
	[QcCaseItemID] [int] IDENTITY(1,1) NOT NULL,
	[CaseItemID] [int] NOT NULL,
	[QcItemID] [int] NOT NULL,
 CONSTRAINT [PK_QCCASEITEM] PRIMARY KEY CLUSTERED 
(
	[QcCaseItemID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GradeResult]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GradeResult](
	[GradeResultID] [int] IDENTITY(1,1) NOT NULL,
	[CaseInfoID] [int] NULL,
	[StandardID] [int] NULL,
	[Score] [int] NULL,
	[LevelID] [int] NULL,
	[ShouldReturnDate] [datetime] NULL,
	[ActualReturnDate] [datetime] NULL,
	[NotifyDate] [datetime] NULL,
	[ReworkScore] [int] NULL,
	[QCUser] [int] NULL,
	[CreateDate] [datetime] NULL,
	[IsReworked] [bit] NULL,
	[Description] [varchar](512) NULL,
 CONSTRAINT [PK_GRADERESULT] PRIMARY KEY CLUSTERED 
(
	[GradeResultID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评审得分' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'GradeResult', @level2type=N'COLUMN', @level2name=N'Score'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应该返修结束的日期' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'GradeResult', @level2type=N'COLUMN', @level2name=N'ShouldReturnDate'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实际返修结束的日期' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'GradeResult', @level2type=N'COLUMN', @level2name=N'ActualReturnDate'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返修通知的日期' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'GradeResult', @level2type=N'COLUMN', @level2name=N'NotifyDate'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返修后的得分' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'GradeResult', @level2type=N'COLUMN', @level2name=N'ReworkScore'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评审人' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'GradeResult', @level2type=N'COLUMN', @level2name=N'QCUser'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评审日期' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'GradeResult', @level2type=N'COLUMN', @level2name=N'CreateDate'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'该病案是否返修过' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'GradeResult', @level2type=N'COLUMN', @level2name=N'IsReworked'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述，用于扩展' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'GradeResult', @level2type=N'COLUMN', @level2name=N'Description'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评分结果表' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'GradeResult'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StandardCase]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StandardCase](
	[StandardCaseID] [int] IDENTITY(1,1) NOT NULL,
	[CaseItemID] [int] NULL,
	[StandardID] [int] NULL,
	[LimitScore] [int] NULL,
	[Sequence] [int] NULL,
	[Status] [bit] NULL,
	[Description] [varchar](512) NULL,
 CONSTRAINT [PK_STANDARDCASE] PRIMARY KEY CLUSTERED 
(
	[StandardCaseID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'病案项目最大分值' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'StandardCase', @level2type=N'COLUMN', @level2name=N'LimitScore'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'病案项目显示的次序' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'StandardCase', @level2type=N'COLUMN', @level2name=N'Sequence'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态，是否有效' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'StandardCase', @level2type=N'COLUMN', @level2name=N'Status'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StandardBug]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StandardBug](
	[StandardBugId] [int] IDENTITY(1,1) NOT NULL,
	[BugID] [int] NULL,
	[StandardID] [int] NULL,
	[FloatScore] [bit] NULL,
	[LimitScore] [int] NULL,
	[IsVeto] [bit] NULL,
	[VetoLevel] [varchar](128) NULL,
	[Duty] [int] NULL,
	[Description] [varchar](512) NULL,
 CONSTRAINT [PK_STANDARDBUG] PRIMARY KEY CLUSTERED 
(
	[StandardBugId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可变分值' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'StandardBug', @level2type=N'COLUMN', @level2name=N'FloatScore'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分值上限' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'StandardBug', @level2type=N'COLUMN', @level2name=N'LimitScore'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否单否' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'StandardBug', @level2type=N'COLUMN', @level2name=N'IsVeto'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单否降入级别，在字典表中定义' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'StandardBug', @level2type=N'COLUMN', @level2name=N'VetoLevel'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'默认问题归属角色,角色保存在字典表中' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'StandardBug', @level2type=N'COLUMN', @level2name=N'Duty'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标准项目' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'StandardBug'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NULL,
	[UserName] [varchar](128) NULL,
	[DisplayName] [varchar](128) NULL,
	[Pwd] [varchar](128) NULL,
	[Description] [varchar](128) NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户表，使用该系统的用户，指评审人' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'User'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RequisitionBugItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RequisitionBugItem](
	[RequisitionBugItemID] [int] IDENTITY(1,1) NOT NULL,
	[RequisitionID] [int] NULL,
	[GradeResultDetailID] [int] NULL,
 CONSTRAINT [PK_REQUISITIONBUGITEM] PRIMARY KEY CLUSTERED 
(
	[RequisitionBugItemID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GradeResultDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GradeResultDetail](
	[GradeResultDetailID] [int] IDENTITY(1,1) NOT NULL,
	[ResultID] [int] NULL,
	[BugID] [int] NULL,
	[Score] [int] NULL,
	[Owner] [int] NULL,
	[Description] [varchar](512) NULL,
	[IsFixed] [bit] NULL,
 CONSTRAINT [PK_GRADERESULTDETAIL] PRIMARY KEY CLUSTERED 
(
	[GradeResultDetailID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评分结果' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'GradeResultDetail', @level2type=N'COLUMN', @level2name=N'ResultID'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'该缺陷的最终得分' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'GradeResultDetail', @level2type=N'COLUMN', @level2name=N'Score'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述，用于扩展' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'GradeResultDetail', @level2type=N'COLUMN', @level2name=N'Description'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Requisition]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Requisition](
	[RequisitionID] [int] IDENTITY(1,1) NOT NULL,
	[GradeResultID] [int] NULL,
	[IsSent] [bit] NULL,
	[SendDate] [datetime] NULL,
	[Owner] [int] NULL,
 CONSTRAINT [PK_REQUISITION] PRIMARY KEY CLUSTERED 
(
	[RequisitionID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetRequisition_NonXH]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-8-12
-- Description:	retrieve data for printable requisition
-- =============================================
CREATE PROCEDURE [dbo].[GetRequisition_NonXH]
	@requisitionId int
AS
BEGIN
	SET NOCOUNT ON;

	/* for vs2008 table adapter designer.
	select 
		null as ''GradeResultDetailID'',
		null as ''CaseNum'',
		null as ''OwnerName'',
		null as ''QcItemName'',
		null as ''BugPredicateName''
	*/
	
	/* real business logic  */
	select BugID,(ci.name+''-''+qc.name) as QcItemName,bp.name as BugPredicateName
	into #t
	from bug b
	left join qccaseitem q on b.qccaseitemid=q.qccaseitemid
	left join qcitem qc on qc.qcitemid=q.qcitemid
	left join caseitem ci on ci.caseitemid=q.caseitemid
	left join bugpredicate bp on b.predicateid=bp.bugpredicateid

	select 
		rb.GradeResultDetailID,
		c.CaseNum,
		d.name as OwnerName,
		QcItemName,
		BugPredicateName
	from requisitionbugitem rb
	left join requisition r on r.requisitionid=rb.requisitionid
	left join graderesultdetail g on rb.graderesultdetailid=g.graderesultdetailid
	left join #t on #t.bugid=g.bugid
	left join graderesult gg on gg.graderesultid=g.resultid
	left join d_doctor d on d.id = r.owner
	inner join caseinfo c on c.caseinfoid=gg.caseinfoid
	where r.requisitionid=@requisitionId

	drop table #t
	

END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectBug]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[SelectBug]
(
	@QCCaseItemID int =null,
	@BugID int = null
)
AS
	SET NOCOUNT ON;
SELECT  b.BugID,b.QcCaseItemID,q.CaseItemID,q.QcItemID,qi.[Name] as QcItemName,
	b.PredicateID,bp.[Name] as BugPredicateName
FROM Bug b
left join QcCaseItem q on b.QcCaseItemID=q.QcCaseItemID
left join QcItem qi on q.QcItemID=qi.QcItemID
left join BugPredicate bp on b.PredicateID=bp.BugPredicateID
WHERE (b.QcCaseItemID=@QCCaseItemID or @QCCaseItemID is null)
	and (b.BugID=@BugID or @BugID is null)


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectBugPredicate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[SelectBugPredicate]
(
	@QcItemID int = null,
	@CaseItemID int = null
)
AS
	SET NOCOUNT ON;

IF @QcItemID is not null
BEGIN
	SELECT bp.* FROM BugPredicate bp
	LEFT JOIN Bug b on bp.BugPredicateID=b.PredicateID
	LEFT JOIN QcCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
	WHERE qci.QcItemID=@QcItemID and qci.CaseItemID=@CaseItemID
END
ELSE
BEGIN
	SELECT * FROM BugPredicate
END


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectGradeResultDetailByOwner]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		yezhi.zhang
-- Create date: 2008-7-6
-- Description:	select GradeResultDetail by Owner
-- =============================================
CREATE PROCEDURE [dbo].[SelectGradeResultDetailByOwner]
	@StartDate datetime = null,
	@EndDate datetime = null,
	@Owner int = null
AS
BEGIN
	SET NOCOUNT ON;

	--获取BugID对应QcItemName和BugPredicateName
	select BugID,(ci.name+''-''+qc.name) as QcItemName,bp.name as BugPredicateName
	into #t
	from bug b
	left join qccaseitem q on b.qccaseitemid=q.qccaseitemid
	left join qcitem qc on qc.qcitemid=q.qcitemid
	left join caseitem ci on ci.caseitemid=q.caseitemid
	left join bugpredicate bp on b.predicateid=bp.bugpredicateid

	select * 
	from graderesult g
	left join graderesultdetail gd on g.graderesultid=gd.resultid
	left join #t bug on bug.bugid=gd.bugid
	where 
		(g.createdate >= @startdate or @startdate is null)
		and (g.createdate <= @enddate or @enddate is null)
		and graderesultdetailid not in 
			(select graderesultdetailid 
				from requisitionbugitem)
		and gd.owner=@owner	

	DROP TABLE #t
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectRequisitionBugItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SelectRequisitionBugItem]
	@RequisitionID int = null
AS
	SET NOCOUNT ON;
select BugID,(ci.name+''-''+qc.name) as QcItemName,bp.name as BugPredicateName
into #t
from bug b
left join qccaseitem q on b.qccaseitemid=q.qccaseitemid
left join qcitem qc on qc.qcitemid=q.qcitemid
left join caseitem ci on ci.caseitemid=q.caseitemid
left join bugpredicate bp on b.predicateid=bp.bugpredicateid

SELECT     r.*,#t.QcItemName,#t.BugPredicateName
FROM         RequisitionBugItem r
left join graderesultdetail g on g.graderesultdetailid = r.graderesultdetailid
left join #t on #t.bugid = g.bugid
where (RequisitionID=@RequisitionID or @RequisitionID is null)

drop table #t
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Report_Rank]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-8-22
-- Description:	retrieve data for report 4.4
-- =============================================
-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-8-22
-- Description:	add filter parameters
-- =============================================

CREATE PROCEDURE [dbo].[Report_Rank]
	@Mode int = 0,
	@outward int = null,
	@outdept int = null,
	@doctor int = null,
	@outdate_from datetime = null,
	@outdate_to datetime = null,
	@qcdate_from datetime = null,
	@qcdate_to datetime = null
AS
BEGIN
	SET NOCOUNT ON;

if @mode=2
--by doctor
begin
	select d.[Name] as CName, count(*) as Num from GradeResultDetail a
	inner join GradeResult b on a.ResultID = b.GradeResultID
	inner join CaseInfo c on c.CaseInfoID = b.CaseInfoID
	inner join D_Doctor d on a.Owner = d.ID
	where		
		(c.outhospitalward = @outward or @outward is null) and
		(c.outhospitaldep = @outdept or @outdept is null) and
		(c.outhospitaldate >= @outdate_from or @outdate_from is null) and
		(c.outhospitaldate <= @outdate_to or @outdate_to is null) and
		(b.createdate >= @qcdate_from or @qcdate_from is null) and
		(b.createdate <= @qcdate_to or @qcdate_to is null) and
		(a.owner = @doctor or @doctor is null)
	group by d.[Name]
	order by num
end
else if @mode=1
--by inhospitalward
begin
	select d.name as CName,count(d.name) as Num from graderesultdetail a
	inner join graderesult b on a.resultid=b.graderesultid
	inner join caseinfo c on b.caseinfoid=c.caseinfoid
	inner join d_ward d on c.outhospitalward=d.id
	where 
		(c.outhospitalward = @outward or @outward is null) and
		(c.outhospitaldate >= @outdate_from or @outdate_from is null) and
		(c.outhospitaldate <= @outdate_to or @outdate_to is null) and
		(b.createdate >= @qcdate_from or @qcdate_from is null) and
		(b.createdate <= @qcdate_to or @qcdate_to is null)
	group by d.name
	order by Num

end
else if @mode=0
--by inhospitaldep
begin
	select d.name as CName,count(d.name) as num from graderesultdetail a
	inner join graderesult b on a.resultid=b.graderesultid
	inner join caseinfo c on b.caseinfoid=c.caseinfoid
	inner join d_department d on c.outhospitaldep=d.id
	where	
		(c.outhospitaldep = @outdept or @outdept is null) and
		(c.outhospitaldate >= @outdate_from or @outdate_from is null) and
		(c.outhospitaldate <= @outdate_to or @outdate_to is null) and
		(b.createdate >= @qcdate_from or @qcdate_from is null) and
		(b.createdate <= @qcdate_to or @qcdate_to is null)
	group by d.name
	order by Num
end
else if @mode=3
--by predicate
begin
	select c.name as CName,count(c.name) as Num from graderesultdetail a
	inner join bug b on a.bugid=b.bugid
	inner join bugpredicate c on c.bugpredicateid=b.predicateid
	inner join graderesult d on a.resultid=d.graderesultid
	inner join caseinfo e on d.caseinfoid=e.caseinfoid
	where	
		(e.outhospitaldep = @outdept or @outdept is null) and
		(e.outhospitaldate >= @outdate_from or @outdate_from is null) and
		(e.outhospitaldate <= @outdate_to or @outdate_to is null) and
		(d.createdate >= @qcdate_from or @qcdate_from is null) and
		(d.createdate <= @qcdate_to or @qcdate_to is null)
	group by c.name
	order by Num
end
else
--no this mode.
begin
	select ''Error'' as CName, ''Error'' as Num
end

END


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectStandardBug]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[SelectStandardBug]
(
	@QcItemID int = null,
	@CaseItemID int = null,
	@BugPredicateID int = null,
	@StandardID int = null
)
AS
	SET NOCOUNT ON;


	SELECT sb.*,(qi.Name + ''-'' + bp.Name) as BugName FROM StandardBug sb
	INNER JOIN Bug b ON sb.BugID=b.BugID
	INNER JOIN BugPredicate bp ON b.PredicateID=bp.BugPredicateID
	INNER JOIN QcCaseItem qci ON b.QcCaseItemID=qci.QcCaseItemID
	INNER JOIN QcItem qi ON qi.QcItemId=qci.QcItemId
	WHERE 
		(qci.QcItemID=@QcItemID or @QcItemID is null) and 
		(qci.CaseItemID=@CaseItemID or @CaseItemID is null) and 
		(sb.StandardID=@StandardID or @StandardID is null) and 
		(b.PredicateID=@BugPredicateID or @BugPredicateID is null)
	ORDER BY BugName


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Report_CaseBugStat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-7-15
-- Description:	get data for report 4.3
-- =============================================
-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-8-12
-- Description:	add 4 effective numbers processing
-- =============================================
CREATE PROCEDURE [dbo].[Report_CaseBugStat]
	@OutHospitalDateFrom datetime = null,
	@OutHospitalDateTo datetime = null,
	@QcDateFrom datetime = null,
	@QcDateTo datetime = null,
	@OutHospitalDept int = null,
	@OutHospitalWard int = null,
	@Doctor int = null,
	@BugCategory int = null
AS
BEGIN
	SET NOCOUNT ON;

	declare @TotalQcNum float
	declare @TotalBugNum float
	select @TotalQcNum = count(*) from dbo.GradeResult
	select @TotalBugNum = count(*) from dbo.GradeResultDetail

	select BugID,(ci.name+''-''+qc.name) as QcItemName,bp.name as BugPredicateName
	into #t
	from bug b
	left join qccaseitem q on b.qccaseitemid=q.qccaseitemid
	left join qcitem qc on qc.qcitemid=q.qcitemid
	left join caseitem ci on ci.caseitemid=q.caseitemid
	left join bugpredicate bp on b.predicateid=bp.bugpredicateid

	select QcItemName+''-''+BugPredicateName as BugName,
			OccuredNum,
			dbo.GetQuotientFrom2Int(OccuredNum,@TotalQcNum) as OccuredRate,
			dbo.GetQuotientFrom2Int(OccuredNum,@TotalBugNum) as ComposedRate
			--cast(OccuredNum/@TotalQcNum as float) as OccuredRate,
			--cast(OccuredNum/@TotalBugNum as float) as ComposedRate

	from (
			select bugid,count(graderesultdetailid) as OccuredNum
			from dbo.GradeResultDetail
			group by bugid ) a
	left join #t on #t.bugid=a.bugid

	drop table #t

END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Report_BugStatAndCompare]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-7-27
-- Description:	retrieve data for report 4.7(bug statistic view and its compare)
-- =============================================
-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-8-12
-- Description:	add 4 effective numbers processing
-- =============================================
CREATE PROCEDURE [dbo].[Report_BugStatAndCompare]
	@outhosp_from datetime = null,
	@outhosp_to datetime = null,
	@qcdate_from datetime = null,
	@qcdate_to datetime = null,
	@outdept int = null,
	@outward int = null,
	@bugpred int = null,
	@doctor int = null,
	@c_qcdate_from datetime = null,
	@c_qcdate_to datetime = null
AS
BEGIN
	SET NOCOUNT ON;

	declare @TBugNum int
	declare @TQcCaseNum int
	select @TBugNum=count(*) from graderesultdetail
	select @TQcCaseNum=count(*) from graderesult

	--get current
	select 
		d.BugId,
		(h.Name + ''-'' + i.name + ''-'' + f.name) as BugName,
		d.OccuranceNum,
		d.OccuranceRate 
	into #t1
	from
	(
		select
			BugID,
			count(*) as OccuranceNum,
			dbo.GetQuotientFrom2Int(count(*),@TQcCaseNum) as OccuranceRate 
			--cast(count(*) as float)/cast(@TQcCaseNum as float) as OccuranceRate 
		from graderesultdetail a
		inner join GradeResult b on a.resultid=b.graderesultid
		inner join CaseInfo c on c.caseInfoid=b.caseinfoid
		where 
			(c.outhospitaldate >= @outhosp_from or @outhosp_from is null) and
			(c.outhospitaldate <= @outhosp_to or @outhosp_to is null) and
			(b.createdate >= @qcdate_from or @qcdate_from is null) and
			(b.createdate <= @qcdate_to or @qcdate_to is null) and
			(c.outhospitaldep = @outdept or @outdept is null) and
			(c.outhospitalward = @outward or @outward is null) and
			(a.owner = @doctor or @doctor is null)
		group by bugid
	) d
	inner join bug e on e.bugid=d.bugid
	inner join bugpredicate f on f.bugpredicateid=e.predicateid
	inner join qccaseitem g on g.qccaseitemid=e.qccaseitemid
	inner join caseitem h on h.caseitemid=g.caseitemid
	inner join qcitem i on i.qcitemid=g.qcitemid
	where (e.predicateid=@bugpred or @bugpred is null)

	
	--get compare
	select 
		d.BugID,	
		(h.Name + ''-'' + i.name + ''-'' + f.name) as BugName,
		d.OccuranceNum,
		d.OccuranceRate 
	into #t2
	from
	(
		select
			BugID,
			count(*) as OccuranceNum,
			dbo.GetQuotientFrom2Int(count(*),@TQcCaseNum) as OccuranceRate 
			--cast(count(*) as float)/cast(@TQcCaseNum as float) as OccuranceRate 
		from graderesultdetail a
		inner join GradeResult b on a.resultid=b.graderesultid
		inner join CaseInfo c on c.caseInfoid=b.caseinfoid
		where 
			(c.outhospitaldate >= @outhosp_from or @outhosp_from is null) and
			(c.outhospitaldate <= @outhosp_to or @outhosp_to is null) and
			(b.createdate >= @c_qcdate_from or @c_qcdate_from is null) and
			(b.createdate <= @c_qcdate_to or @c_qcdate_to is null) and
			(c.outhospitaldep = @outdept or @outdept is null) and
			(c.outhospitalward = @outward or @outward is null) and
			(a.owner = @doctor or @doctor is null)
		group by bugid
	) d
	inner join bug e on e.bugid=d.bugid
	inner join bugpredicate f on f.bugpredicateid=e.predicateid
	inner join qccaseitem g on g.qccaseitemid=e.qccaseitemid
	inner join caseitem h on h.caseitemid=g.caseitemid
	inner join qcitem i on i.qcitemid=g.qcitemid
	where (e.predicateid=@bugpred or @bugpred is null)

	select 
		#t1.BugName,
		#t1.OccuranceNum as ''CurrentON'',
		#t2.OccuranceNum as ''CompareON'',
		#t1.OccuranceRate as ''CurrentOR'',
		#t2.OccuranceRate as ''CompareOR''
	from #t1
	left join #t2 on #t1.bugid=#t2.bugid
	
	drop table #t1
	drop table #t2

END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateBugPredicate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UpdateBugPredicate]
(
	@BugPredicateID int,
	@Name varchar(128),
	@Description varchar(512)
)
AS
	SET NOCOUNT OFF;
UPDATE [BugPredicate] SET  [Name] = @Name, [Description] = @Description 
WHERE [BugPredicateID] = @BugPredicateID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertBugPredicate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[InsertBugPredicate]
(
	@Name varchar(128),
	@Description varchar(512)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [BugPredicate] ([Name], [Description]) 
VALUES (@Name, @Description);' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteBugPredicate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[DeleteBugPredicate]
(
	@BugPredicateID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [BugPredicate] WHERE [BugPredicateID] = @BugPredicateID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertD_LeaveHospitalState]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[InsertD_LeaveHospitalState]
(
	@Code nvarchar(MAX),
	@Name nvarchar(MAX),
	@Pinyin nvarchar(MAX),
	@GB nvarchar(MAX)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [D_LeaveHospitalState] ([Code], [Name], [Pinyin], [GB]) VALUES (@Code, @Name, @Pinyin, @GB);
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateD_LeaveHospitalState]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateD_LeaveHospitalState]
(
	@Code nvarchar(MAX),
	@Name nvarchar(MAX),
	@Pinyin nvarchar(MAX),
	@GB nvarchar(MAX),
	@Original_Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [D_LeaveHospitalState] SET [Code] = @Code, [Name] = @Name, [Pinyin] = @Pinyin, [GB] = @GB WHERE (([Id] = @Original_Id));
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectD_LeaveHospitalState]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SelectD_LeaveHospitalState]
AS
	SET NOCOUNT ON;
SELECT     D_LeaveHospitalState.*
FROM         D_LeaveHospitalState' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnGetNameInDictionary]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE    function [dbo].[fnGetNameInDictionary]
(
	@Type varchar(128),
	@Value int
)
	returns varchar(128)
as

BEGIN
	DECLARE @DName varchar(128)
	IF @Type=''Doctor''
	BEGIN
		SELECT @DName=[Name] FROM D_Doctor
		WHERE  ID=@Value
	END
	ELSE IF @Type=''Dep''
	BEGIN
		SELECT @DName=[Name] FROM D_Department
		WHERE  ID=@Value
	END
	ELSE IF @Type=''Ward''
	BEGIN
		SELECT @DName=[Name] FROM D_Ward
		WHERE  ID=@Value
	END	
	ELSE IF @Type=''Duty''
	BEGIN
		SELECT @DName=[Name] FROM D_JobTitle
		WHERE  ID=@Value
	END	
	ELSE IF @Type=''Diagnosis''
	BEGIN
		SELECT @DName=[Name] FROM D_ICD
		WHERE  ID=@Value
	END	
	ELSE IF @Type=''Operate''
	BEGIN
		SELECT @DName=[Name] FROM D_CM3
		WHERE  ID=@Value
	END	
	RETURN @DName
END
--------------------------------------------------

' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteD_ICD]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DeleteD_ICD]
(
	@Original_Id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [D_ICD] WHERE (([Id] = @Original_Id))' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectD_ICD]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SelectD_ICD]
AS
	SET NOCOUNT ON;
SELECT     D_ICD.*
FROM         D_ICD' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertD_ICD]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[InsertD_ICD]
(
	@ICD_10 nvarchar(MAX),
	@ICD_10_S nvarchar(MAX),
	@Name nvarchar(MAX),
	@ICD_9 nvarchar(MAX),
	@ICD_9_S nvarchar(MAX),
	@Name_EN nvarchar(MAX),
	@Pinyin nvarchar(MAX),
	@GB nvarchar(MAX),
	@Tag nvarchar(MAX)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [D_ICD] ([ICD_10], [ICD_10_S], [Name], [ICD_9], [ICD_9_S], [Name_EN], [Pinyin], [GB], [Tag]) VALUES (@ICD_10, @ICD_10_S, @Name, @ICD_9, @ICD_9_S, @Name_EN, @Pinyin, @GB, @Tag);
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateD_ICD]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateD_ICD]
(
	@ICD_10 nvarchar(MAX),
	@ICD_10_S nvarchar(MAX),
	@Name nvarchar(MAX),
	@ICD_9 nvarchar(MAX),
	@ICD_9_S nvarchar(MAX),
	@Name_EN nvarchar(MAX),
	@Pinyin nvarchar(MAX),
	@GB nvarchar(MAX),
	@Tag nvarchar(MAX),
	@Original_Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [D_ICD] SET [ICD_10] = @ICD_10, [ICD_10_S] = @ICD_10_S, [Name] = @Name, [ICD_9] = @ICD_9, [ICD_9_S] = @ICD_9_S, [Name_EN] = @Name_EN, [Pinyin] = @Pinyin, [GB] = @GB, [Tag] = @Tag WHERE (([Id] = @Original_Id));
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertD_JobTitle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[InsertD_JobTitle]
(
	@Code nvarchar(MAX),
	@Name nvarchar(MAX),
	@FullName nvarchar(MAX),
	@Pinyin nvarchar(MAX),
	@GB nvarchar(MAX)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [D_JobTitle] ([Code], [Name], [FullName], [Pinyin], [GB]) VALUES (@Code, @Name, @FullName, @Pinyin, @GB);
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateD_JobTitle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateD_JobTitle]
(
	@Code nvarchar(MAX),
	@Name nvarchar(MAX),
	@FullName nvarchar(MAX),
	@Pinyin nvarchar(MAX),
	@GB nvarchar(MAX),
	@Original_Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [D_JobTitle] SET [Code] = @Code, [Name] = @Name, [FullName] = @FullName, [Pinyin] = @Pinyin, [GB] = @GB WHERE (([Id] = @Original_Id));
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetRespDoctor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-8-4
-- Description:	Get the key of doctor by case/standardbug
-- =============================================
-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-8-13
-- Description:	fix fixed duty id
-- =============================================

CREATE PROCEDURE [dbo].[GetRespDoctor]
	@CaseInfoId int,
	@StandardBugId int
AS
BEGIN
	SET NOCOUNT ON;

	declare @duty int
	declare @jobtitle nvarchar(8)

	select @duty=duty from standardbug where standardbugid=@standardBugId
	select @jobtitle=[name] from d_jobtitle where id=@duty

	if @jobtitle=''住院医师''
	begin
		select inhospitaldoc from caseinfo where caseinfoid=@caseinfoId
	end
	else if @jobtitle=''主治医师''
	begin
		select maindoc from caseinfo where caseinfoid=@caseinfoId
	end
	else if @jobtitle=''主任医师''
	begin
		select directordoc from caseinfo where caseinfoid=@caseinfoId
	end
	--
	else if @jobtitle=''实习医师''
	begin
		select seconddoc from caseinfo where caseinfoid=@caseinfoId
	end
	else
	begin
		select -1
	end

END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectD_JobTitle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SelectD_JobTitle]
AS
	SET NOCOUNT ON;
SELECT     D_JobTitle.*
FROM         D_JobTitle' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteD_JobTitle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DeleteD_JobTitle]
(
	@Original_Id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [D_JobTitle] WHERE (([Id] = @Original_Id))' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateD_Ward]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateD_Ward]
(
	@Code nvarchar(MAX),
	@Name nvarchar(MAX),
	@FullName nvarchar(MAX),
	@Pinyin nvarchar(MAX),
	@GB nvarchar(MAX),
	@Original_Id int,
	@Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [D_Ward] SET [Code] = @Code, [Name] = @Name, [FullName] = @FullName, [Pinyin] = @Pinyin, [GB] = @GB WHERE (([Id] = @Original_Id));
	
SELECT Id, Code, Name, FullName, Pinyin, GB FROM D_Ward WHERE (Id = @Id)' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertD_Ward]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[InsertD_Ward]
(
	@Code nvarchar(MAX),
	@Name nvarchar(MAX),
	@FullName nvarchar(MAX),
	@Pinyin nvarchar(MAX),
	@GB nvarchar(MAX)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [D_Ward] ([Code], [Name], [FullName], [Pinyin], [GB]) VALUES (@Code, @Name, @FullName, @Pinyin, @GB);
	
SELECT Id, Code, Name, FullName, Pinyin, GB FROM D_Ward WHERE (Id = SCOPE_IDENTITY())
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectD_Ward]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SelectD_Ward]
AS
	SET NOCOUNT ON;
select * from D_Ward
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteD_Ward]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DeleteD_Ward]
(
	@Original_Id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [D_Ward] WHERE (([Id] = @Original_Id))
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectQcCaseItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[SelectQcCaseItem]
(
	@CaseItemID int = null,
	@QcItemID int = null
	
)
AS

SET NOCOUNT ON;

SELECT 
	qci.*,
	q.Name as QcItemName
FROM QcCaseItem qci
INNER JOIN QcItem q ON q.QcItemID=qci.QcItemID
WHERE
	(qci.CaseItemID=@CaseItemID or @CaseItemID is null) and 
	(qci.QcItemID=@QcItemID or @QcItemID is null)

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectQcItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[SelectQcItem]
(
	@CaseItemID int = null
)
AS
	SET NOCOUNT ON;
IF @CaseItemID is not null
BEGIN
	SELECT qi.* FROM QcItem qi
	LEFT JOIN QcCaseItem qci on qi.QcItemID=qci.QcItemID
	WHERE qci.CaseItemID=@CaseItemID
END
ELSE
BEGIN
	SELECT * FROM QcItem
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertQcItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[InsertQcItem]
(
	@Name varchar(128),
	@Description varchar(1024)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [QcItem] ( [Name], [Description])
 VALUES (@Name, @Description);
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteQcItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[DeleteQcItem]
(
	@QcItemID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [QcItem] WHERE [QcItemID] = @QcItemID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateQcItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UpdateQcItem]
(
	@QcItemID int,
	@Name varchar(128),
	@Description varchar(1024)
)
AS
	SET NOCOUNT OFF;
UPDATE [QcItem] SET  [Name] = @Name, [Description] = @Description 
WHERE [QcItemID] = @QcItemID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteCaseInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[DeleteCaseInfo]
(
	@CaseNum int,
	@Sequence int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [CaseInfo] 
WHERE [CaseNum] = @CaseNum and [Sequence]=@Sequence
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateCaseInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[UpdateCaseInfo]
(
	@CaseNum int,
	@Sequence int,
	@Name nvarchar(128),
	@Sex bit,
	@InHospitalDate datetime,
	@InHospitalDep int,
	@InHospitalWard int,
	@InHospitalDiagnosis int,
	@OutHospitalDate datetime,
	@OutHospitalDep int,
	@OutHospitalWard int,
	@OutHospitalDiagnosis int,
	@OutHospitalDescription nvarchar(512),
	@FirstOperate int,
	@DirectorDoc int,
	@MainDoc int,
	@SecondDoc int,
	@InhospitalDoc int,
	@Description varchar(512)
)
AS
	SET NOCOUNT OFF;
UPDATE [CaseInfo] SET [CaseNum] = @CaseNum, [Sequence] = @Sequence, [Name] = @Name, [Sex] = @Sex, [InHospitalDate] = @InHospitalDate, [InHospitalDep] = @InHospitalDep, [InHospitalWard] = @InHospitalWard, [InHospitalDiagnosis] = @InHospitalDiagnosis, [OutHospitalDate] = @OutHospitalDate, [OutHospitalDep] = @OutHospitalDep, [OutHospitalWard] = @OutHospitalWard, [OutHospitalDiagnosis] = @OutHospitalDiagnosis, [OutHospitalDescription] = @OutHospitalDescription, [FirstOperate] = @FirstOperate, [DirectorDoc] = @DirectorDoc, [InhospitalDoc] = @InhospitalDoc, [Description] = @Description 
,[MainDoc]=@MainDoc, [SecondDoc] = @SecondDoc
WHERE [CaseNum] = @CaseNum and [Sequence]=@Sequence
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertCaseInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[InsertCaseInfo]
(
	@CaseNum int,
	@Sequence int,
	@Name nvarchar(128),
	@Sex int,
	@InHospitalDate datetime,
	@InHospitalDep int,
	@InHospitalWard int,
	@InHospitalDiagnosis int,
	@OutHospitalDate datetime,
	@OutHospitalDep int,
	@OutHospitalWard int,
	@OutHospitalDiagnosis int,
	@OutHospitalDescription nvarchar(512),
	@FirstOperate int,
	@DirectorDoc int,
	@MainDoc int,
	@SecondDoc int,
	@InhospitalDoc int,
	@Description varchar(512)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [CaseInfo] 
(
[CaseNum], [Sequence], [Name], [Sex], [InHospitalDate], [InHospitalDep], [InHospitalWard], [InHospitalDiagnosis], [OutHospitalDate], [OutHospitalDep], [OutHospitalWard], [OutHospitalDiagnosis], [OutHospitalDescription], [FirstOperate], [DirectorDoc],[MainDoc],[SecondDoc], [InhospitalDoc], [Description]) VALUES (@CaseNum, @Sequence, @Name, @Sex, @InHospitalDate, @InHospitalDep, @InHospitalWard, @InHospitalDiagnosis, @OutHospitalDate, @OutHospitalDep, @OutHospitalWard, @OutHospitalDiagnosis, @OutHospitalDescription, @FirstOperate, @DirectorDoc,@MainDoc,@SecondDoc ,@InhospitalDoc, @Description);
	


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Report_ReworkInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- =============================================
-- Author:	wind
-- Alter date: 2008-7-30
-- Description:	4.5
-- SelectType:0--Doc;1--Dep;
-- RepairMode:0--Nomal;1--xiehe


-- Alter Date: 2008-9-2
-- Description: 查询条件增加：出院日期和质控日期
-- =============================================
CREATE PROCEDURE [dbo].[Report_ReworkInfo]
(
	@SelectType int,
	@RepairMode int,
	@OutHospitalDateFrom datetime = null,
	@OutHospitalDateTo datetime = null,
	@QcDateFrom datetime = null,
	@QcDateTo datetime = null
)
AS
	SET NOCOUNT OFF;

if @RepairMode=0 -- 非协和模式
begin
	--已发送的通知单
	select doc.ID,
	(
		select count(*) from Requisition r
		left join RequisitionBugItem rbi on r.RequisitionID=rbi.RequisitionID
		left join GradeResultDetail grd on rbi.GradeResultDetailID=grd.GradeResultDetailID
		left join GradeResult gr on grd.ResultID=gr.GradeResultID
		left join CaseInfo c on gr.CaseInfoID=c.CaseInfoID
		where  r.IsSent=1 and doc.ID=r.Owner
			and (datediff(day,gr.CreateDate,@QcDateFrom) >=0 or @QcDateFrom is null)
			and (datediff(day,gr.CreateDate,@QcDateTo) <= 0 or @QcDateTo is null)
			and (datediff(day,c.OutHospitalDate,@OutHospitalDateFrom) >=0 or @OutHospitalDateFrom is null)
			and (datediff(day,c.OutHospitalDate,@OutHospitalDateTo) <= 0 or @OutHospitalDateTo is null)
	) as RequisitionCount
	into #TableRequisition
	from D_Doctor doc
	--已返修的通知单
	select doc.ID,
	(
		select count(*) from Requisition r
		inner join RequisitionBugItem rbi on r.RequisitionID=rbi.RequisitionID
		inner join GradeResultDetail grd on rbi.GradeResultDetailID=grd.GradeResultDetailID
		where r.IsSent=1 and grd.IsFixed=1 and doc.ID=r.Owner
	) as ReworkRequisitionCount
	into #TableReworkRequisition
	from D_Doctor doc
	--超期通知单数
	select doc.ID,
	(
		select count(*) from Requisition r
		inner join GradeResult gr on gr.GradeResultID=r.GradeResultID
		where r.IsSent=1 and doc.ID=r.Owner
			and (gr.ActualReturnDate > gr.ShouldReturnDate 
				or gr.ActualReturnDate is null)
	) as OutDateRequisitionCount
	into #TableOutReturnDateRequisition
	from D_Doctor doc
	--平均通知反应时间
	select doc.ID,
	(
		select datediff(day,gr.ShouldReturnDate,ActualReturnDate)
		from Requisition r
		inner join GradeResult gr on gr.GradeResultID=r.GradeResultID
		where r.IsSent=1 and doc.ID=r.Owner
			and gr.ShouldReturnDate is not null
			and gr.ActualReturnDate is not null
	) as AvgReworkDays
	into #TableAvgReworkDays
	from D_Doctor doc
	--最终报表
	select doc.ID,doc.[Name],
	t1.RequisitionCount,t2.ReworkRequisitionCount,
	t2.ReworkRequisitionCount/t1.RequisitionCount as ReworkPercent,
	t1.RequisitionCount-t2.ReworkRequisitionCount as NoReworkRequisition,
	t3.OutDateRequisitionCount,isnull(t4.AvgReworkDays,0) as AvgReworkDays
	into #TableDocReworkInfo
	from D_Doctor doc
	left join #TableRequisition t1 on doc.ID=t1.ID
	left join #TableReworkRequisition t2 on doc.ID=t2.ID
	left join #TableOutReturnDateRequisition t3 on doc.ID=t3.ID
	left join #TableAvgReworkDays t4 on doc.ID=t4.ID
	where t1.RequisitionCount > 0

	--按科别
	if(@SelectType=1)
	begin
		select dep.ID,dep.[Name],
		sum(t.RequisitionCount) as RequisitionCount,
		sum(t.ReworkRequisitionCount) as ReworkRequisitionCount,
		sum(t.ReworkPercent) as ReworkPercent,
		sum(t.NoReworkRequisition) as NoReworkRequisition,
		sum(t.OutDateRequisitionCount) as OutDateRequisitionCount,
		sum(t.AvgReworkDays) as AvgReworkDays
		into #TableDepReworkInfo
		from D_Department dep
		inner join D_Doctor doc on doc.DepartmentID=dep.ID
		inner join #TableDocReworkInfo t on t.ID=doc.ID
		where RequisitionCount is not null
		group by dep.ID,dep.[Name]

		select * from #TableDepReworkInfo

		drop table #TableDepReworkInfo
	end
	else -- 按医师
	begin
		select * from #TableDocReworkInfo
	end

	drop table #TableRequisition
	drop table #TableReworkRequisition
	drop table #TableOutReturnDateRequisition
	drop table #TableAvgReworkDays
	drop table #TableDocReworkInfo
end
else --协和模式
begin
	--已发送的通知单
	select doc.ID,
	(
		select count(*) from Requisition r
		inner join GradeResult gr on r.GradeResultID=gr.GradeResultID
		inner join CaseInfo c on gr.CaseInfoID=c.CaseInfoID
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		where  r.IsSent=1 and doc.ID=grd.Owner 
			and (datediff(day,gr.CreateDate,@QcDateFrom) >=0 or @QcDateFrom is null)
			and (datediff(day,gr.CreateDate,@QcDateTo) <= 0 or @QcDateTo is null)
			and (datediff(day,c.OutHospitalDate,@OutHospitalDateFrom) >=0 or @OutHospitalDateFrom is null)
			and (datediff(day,c.OutHospitalDate,@OutHospitalDateTo) <= 0 or @OutHospitalDateTo is null)
	) as RequisitionCount
	into #TableRequisition2
	from D_Doctor doc
	--已返修的通知单
	select doc.ID,
	(
		select count(*) from Requisition r
		inner join GradeResult gr on r.GradeResultID=gr.GradeResultID
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		where  r.IsSent=1 and doc.ID=grd.Owner and grd.IsFixed=1
	) as ReworkRequisitionCount
	into #TableReworkRequisition2
	from D_Doctor doc
	--超期通知单数
	select doc.ID,
	(
		select count(*) from Requisition r
		inner join GradeResult gr on gr.GradeResultID=r.GradeResultID
		where r.IsSent=1 and doc.ID=r.Owner
			and (gr.ActualReturnDate > gr.ShouldReturnDate 
				or gr.ActualReturnDate is null)
	) as OutDateRequisitionCount
	into #TableOutReturnDateRequisition2
	from D_Doctor doc
	--平均通知反应时间
	select doc.ID,
	(
		select datediff(day,gr.ShouldReturnDate,ActualReturnDate)
		from Requisition r
		inner join GradeResult gr on gr.GradeResultID=r.GradeResultID
		where r.IsSent=1 and doc.ID=r.Owner
			and gr.ShouldReturnDate is not null
			and gr.ActualReturnDate is not null
	) as AvgReworkDays
	into #TableAvgReworkDays2
	from D_Doctor doc
	--最终报表
	select doc.ID,doc.[Name],
	t1.RequisitionCount,t2.ReworkRequisitionCount,
	t2.ReworkRequisitionCount/t1.RequisitionCount as ReworkPercent,
	t1.RequisitionCount-t2.ReworkRequisitionCount as NoReworkRequisition,
	t3.OutDateRequisitionCount,isnull(t4.AvgReworkDays,0) as AvgReworkDays
	into #TableDocReworkInfo2
	from D_Doctor doc
	left join #TableRequisition2 t1 on doc.ID=t1.ID
	left join #TableReworkRequisition2 t2 on doc.ID=t2.ID
	left join #TableOutReturnDateRequisition2 t3 on doc.ID=t3.ID
	left join #TableAvgReworkDays2 t4 on doc.ID=t4.ID
	where t1.RequisitionCount > 0

	--按科别
	if(@SelectType=1)
	begin
		select dep.ID,dep.[Name],
		sum(t.RequisitionCount) as RequisitionCount,
		sum(t.ReworkRequisitionCount) as ReworkRequisitionCount,
		sum(t.ReworkPercent) as ReworkPercent,
		sum(t.NoReworkRequisition) as NoReworkRequisition,
		sum(t.OutDateRequisitionCount) as OutDateRequisitionCount,
		sum(t.AvgReworkDays) as AvgReworkDays
		into #TableDepReworkInfo2
		from D_Department dep
		inner join D_Doctor doc on doc.DepartmentID=dep.ID
		inner join #TableDocReworkInfo2 t on t.ID=doc.ID
		where RequisitionCount is not null
		group by dep.ID,dep.[Name]

		select * from #TableDepReworkInfo2

		drop table #TableDepReworkInfo2
	end
	else --按医师
	begin
		select * from #TableDocReworkInfo2
	end

	drop table #TableRequisition2
	drop table #TableReworkRequisition2
	drop table #TableOutReturnDateRequisition2
	drop table #TableAvgReworkDays2
	drop table #TableDocReworkInfo2
end

/*
select 
	1 as ID,
	''2'' as [Name],
	3 as RequisitionCount,
	4 as ReworkRequisitionCount,
	5 as ReworkPercent,
	6 as NoReworkRequisition,
	7 as OutDateRequisitionCount,
	8 as AvgReworkDays
from D_Doctor 
*/
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Report_CaseItemBugInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



-- =============================================
-- Author:	wind
-- Alter date: 2008-7-30
-- Description:	4.2
-- SelectType:0--Doc;1--Dep
-- =============================================
CREATE PROCEDURE [dbo].[Report_CaseItemBugInfo]
(
	@SelectType int,
	@OutHospitalDateFrom datetime = null,
	@OutHospitalDateTo datetime = null,
	@QcDateFrom datetime = null,
	@QcDateTo datetime = null,
	@OutHospitalDept int = null,
	@OutHospitalWard int = null
)
AS
	SET NOCOUNT OFF;
if @selectType=1--按科别
begin
	select dep.ID,dep.[Name],
	(
		select count(*) from CaseInfo ci
		where ci.InHospitalDep=dep.ID
	) as CaseNum,
	(
		select count(*) from GradeResult gr
		inner join GradeResultDetail grd on grd.ResultID=gr.GradeResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		where ci.InHospitalDep=dep.ID
	) as BugNum,
	(
		select count(gr.CaseInfoID) from GradeResult gr
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		inner join Bug b on grd.BugID=b.BugID
		inner join QCCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
		inner join CaseItem citem on qci.CaseItemID=citem.CaseItemID
		where ci.InHospitalDep=dep.ID and citem.[Name]=''病案首页''
	) as IndexBugNum,
	(
		select count(gr.CaseInfoID) from GradeResult gr
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		inner join Bug b on grd.BugID=b.BugID
		inner join QCCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
		inner join CaseItem citem on qci.CaseItemID=citem.CaseItemID
		where ci.InHospitalDep=dep.ID and citem.[Name]=''入院记录''
	) as InHospitalRecordBugNum,
	(
		select count(gr.CaseInfoID) from GradeResult gr
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		inner join Bug b on grd.BugID=b.BugID
		inner join QCCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
		inner join CaseItem citem on qci.CaseItemID=citem.CaseItemID
		where ci.InHospitalDep=dep.ID and citem.[Name]=''手术记录''
	) as OperateRecordBugNum,
	(
		select count(gr.CaseInfoID) from GradeResult gr
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		inner join Bug b on grd.BugID=b.BugID
		inner join QCCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
		inner join CaseItem citem on qci.CaseItemID=citem.CaseItemID
		where ci.InHospitalDep=dep.ID and citem.[Name]=''首次病程记录''
	) as FirstCourseRecordBugNum,
	(
		select count(gr.CaseInfoID) from GradeResult gr
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		inner join Bug b on grd.BugID=b.BugID
		inner join QCCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
		inner join CaseItem citem on qci.CaseItemID=citem.CaseItemID
		where ci.InHospitalDep=dep.ID and citem.[Name]=''出院记录''
	) as OutHospitalRecordBugNum,
	(
		select count(gr.CaseInfoID) from GradeResult gr
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		inner join Bug b on grd.BugID=b.BugID
		inner join QCCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
		inner join CaseItem citem on qci.CaseItemID=citem.CaseItemID
		where ci.InHospitalDep=dep.ID and citem.[Name]=''常规病程记录''
	) as NormalCourseRecordBugNum,
	(
		select count(gr.CaseInfoID) from GradeResult gr
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		inner join Bug b on grd.BugID=b.BugID
		inner join QCCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
		inner join CaseItem citem on qci.CaseItemID=citem.CaseItemID
		where ci.InHospitalDep=dep.ID and citem.[Name]=''手术同意书''
	) as ApproveOperateBugNum,
	(
		select count(gr.CaseInfoID) from GradeResult gr
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		inner join Bug b on grd.BugID=b.BugID
		inner join QCCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
		inner join CaseItem citem on qci.CaseItemID=citem.CaseItemID
		where ci.InHospitalDep=dep.ID and citem.[Name]=''麻醉同意书''
	) as ApproveAnaesthesiaNum,
	(
		select count(gr.CaseInfoID) from GradeResult gr
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		inner join Bug b on grd.BugID=b.BugID
		inner join QCCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
		inner join CaseItem citem on qci.CaseItemID=citem.CaseItemID
		where ci.InHospitalDep=dep.ID and citem.[Name]=''特殊检查，治疗同意书''
	) as SpecialBugNum,
	(
		select count(gr.CaseInfoID) from GradeResult gr
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		inner join Bug b on grd.BugID=b.BugID
		inner join QCCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
		inner join CaseItem citem on qci.CaseItemID=citem.CaseItemID
		where ci.InHospitalDep=dep.ID and citem.[Name]=''辅助检查报告单''
	) as AssistantBugNum,
	(
		select count(gr.CaseInfoID) from GradeResult gr
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		inner join Bug b on grd.BugID=b.BugID
		inner join QCCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
		inner join CaseItem citem on qci.CaseItemID=citem.CaseItemID
		where ci.InHospitalDep=dep.ID and citem.[Name]=''书写基本要求''
	) as CalligraphBugNum
	into #TableDepBugNum
	from D_Department dep
	inner join CaseInfo  ci on ci.InHospitalDep=dep.ID
	inner join GradeResult gr on ci.CaseInfoID=gr.CaseInfoID
	where (datediff(day,@OutHospitalDateFrom,ci.OutHospitalDate) >=0 or @OutHospitalDateFrom is null)
		and (datediff(day,ci.OUtHOspitalDate,@OutHospitalDateTo) > = 0 or @OutHospitalDateTo is null)
		and (datediff(day,@QcDateFrom,gr.CreateDate) >=0 or @QCDateFrom is null)
		and (datediff(day,gr.CreateDate,@QcDateTo) >= 0 or @QCDateTo is null)
		and (ci.OutHospitalDep = @OutHospitalDept or @OutHospitalDept is null)
		--最终的报表，计算百分比
	select distinct ID,[Name],CaseNum,BugNum,
		IndexBugNum,
		dbo.GetQuotientFrom2Int(IndexBugNum ,BugNum) as IndexBugPercent,
		InHospitalRecordBugNum,
		dbo.GetQuotientFrom2Int(InHospitalRecordBugNum,BugNum) as InHospitalRecordBugPercent,
		OperateRecordBugNum,
		dbo.GetQuotientFrom2Int(OperateRecordBugNum,BugNum) as OperateRecordBugPercent,
		FirstCourseRecordBugNum,
		dbo.GetQuotientFrom2Int(FirstCourseRecordBugNum,BugNum) as FirstCourseRecordBugPercent,
		OutHospitalRecordBugNum,
		dbo.GetQuotientFrom2Int(OutHospitalRecordBugNum,BugNum) as OutHospitalRecordBugPercent,
		NormalCourseRecordBugNum,
		dbo.GetQuotientFrom2Int(NormalCourseRecordBugNum,BugNum) as NormalCourseRecordBugPercent,
		ApproveOperateBugNum,
		dbo.GetQuotientFrom2Int(ApproveOperateBugNum,BugNum) as ApproveOperateBugPercent,
		ApproveAnaesthesiaNum,
		dbo.GetQuotientFrom2Int(ApproveAnaesthesiaNum,BugNum) as ApproveAnaesthesiaPercent,
		SpecialBugNum,
		dbo.GetQuotientFrom2Int(SpecialBugNum,BugNum) as SpecialBugPercent,
		AssistantBugNum,
		dbo.GetQuotientFrom2Int(AssistantBugNum,BugNum) as AssistantBugPercent,
		CalligraphBugNum,
		dbo.GetQuotientFrom2Int(CalligraphBugNum,BugNum) as CalligraphBugPercent
	from #TableDepBugNum
	where BugNum <> 0

	drop table #TableDepBugNum
end
else --按医生
begin
	select doc.ID,doc.[Name],
	(
		select count(*) from CaseInfo ci
		where ci.InHospitalDoc=doc.ID
	) as CaseNum,
	(
		select count(*) from GradeResult gr
		inner join GradeResultDetail grd on grd.ResultID=gr.GradeResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		where ci.InHospitalDoc=doc.ID
	) as BugNum,
	(
		select count(gr.CaseInfoID) from GradeResult gr
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		inner join Bug b on grd.BugID=b.BugID
		inner join QCCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
		inner join CaseItem citem on qci.CaseItemID=citem.CaseItemID
		where ci.InHospitalDoc=doc.ID and citem.[Name]=''病案首页''
	) as IndexBugNum,
	(
		select count(gr.CaseInfoID) from GradeResult gr
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		inner join Bug b on grd.BugID=b.BugID
		inner join QCCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
		inner join CaseItem citem on qci.CaseItemID=citem.CaseItemID
		where ci.InHospitalDoc=doc.ID and citem.[Name]=''入院记录''
	) as InHospitalRecordBugNum,
	(
		select count(gr.CaseInfoID) from GradeResult gr
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		inner join Bug b on grd.BugID=b.BugID
		inner join QCCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
		inner join CaseItem citem on qci.CaseItemID=citem.CaseItemID
		where ci.InHospitalDoc=doc.ID and citem.[Name]=''手术记录''
	) as OperateRecordBugNum,
	(
		select count(gr.CaseInfoID) from GradeResult gr
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		inner join Bug b on grd.BugID=b.BugID
		inner join QCCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
		inner join CaseItem citem on qci.CaseItemID=citem.CaseItemID
		where ci.InHospitalDoc=doc.ID and citem.[Name]=''首次病程记录''
	) as FirstCourseRecordBugNum,
	(
		select count(gr.CaseInfoID) from GradeResult gr
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		inner join Bug b on grd.BugID=b.BugID
		inner join QCCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
		inner join CaseItem citem on qci.CaseItemID=citem.CaseItemID
		where ci.InHospitalDoc=doc.ID and citem.[Name]=''出院记录''
	) as OutHospitalRecordBugNum,
	(
		select count(gr.CaseInfoID) from GradeResult gr
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		inner join Bug b on grd.BugID=b.BugID
		inner join QCCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
		inner join CaseItem citem on qci.CaseItemID=citem.CaseItemID
		where ci.InHospitalDoc=doc.ID and citem.[Name]=''常规病程记录''
	) as NormalCourseRecordBugNum,
	(
		select count(gr.CaseInfoID) from GradeResult gr
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		inner join Bug b on grd.BugID=b.BugID
		inner join QCCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
		inner join CaseItem citem on qci.CaseItemID=citem.CaseItemID
		where ci.InHospitalDoc=doc.ID and citem.[Name]=''手术同意书''
	) as ApproveOperateBugNum,
	(
		select count(gr.CaseInfoID) from GradeResult gr
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		inner join Bug b on grd.BugID=b.BugID
		inner join QCCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
		inner join CaseItem citem on qci.CaseItemID=citem.CaseItemID
		where ci.InHospitalDoc=doc.ID and citem.[Name]=''麻醉同意书''
	) as ApproveAnaesthesiaNum,
	(
		select count(gr.CaseInfoID) from GradeResult gr
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		inner join Bug b on grd.BugID=b.BugID
		inner join QCCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
		inner join CaseItem citem on qci.CaseItemID=citem.CaseItemID
		where ci.InHospitalDoc=doc.ID and citem.[Name]=''特殊检查，治疗同意书''
	) as SpecialBugNum,
	(
		select count(gr.CaseInfoID) from GradeResult gr
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		inner join Bug b on grd.BugID=b.BugID
		inner join QCCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
		inner join CaseItem citem on qci.CaseItemID=citem.CaseItemID
		where ci.InHospitalDoc=doc.ID and citem.[Name]=''辅助检查报告单''
	) as AssistantBugNum,
	(
		select count(gr.CaseInfoID) from GradeResult gr
		inner join GradeResultDetail grd on gr.GradeResultID=grd.ResultID
		inner join CaseInfo ci on gr.CaseInfoID=ci.CaseInfoID
		inner join Bug b on grd.BugID=b.BugID
		inner join QCCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
		inner join CaseItem citem on qci.CaseItemID=citem.CaseItemID
		where ci.InHospitalDoc=doc.ID and citem.[Name]=''书写基本要求''
	) as CalligraphBugNum
	into #TableDocBugNum
	from D_Doctor doc
	inner join CaseInfo  ci on ci.InHospitalDoc=doc.ID
	inner join GradeResult gr on ci.CaseInfoID=gr.CaseInfoID
	where (datediff(day,@OutHospitalDateFrom,ci.OutHospitalDate) >=0 or @OutHospitalDateFrom is null)
		and (datediff(day,ci.OUtHOspitalDate,@OutHospitalDateTo) > = 0 or @OutHospitalDateTo is null)
		and (datediff(day,@QcDateFrom,gr.CreateDate) >=0 or @QCDateFrom is null)
		and (datediff(day,gr.CreateDate,@QcDateTo) >= 0 or @QCDateTo is null)
		and (ci.OutHospitalDep = @OutHospitalDept or @OutHospitalDept is null)
	and (ci.OutHospitalWard = @OutHospitalWard or @OutHospitalWard is null)
	--最终的报表，计算百分比
	select distinct ID,[Name],CaseNum,BugNum,
		IndexBugNum,
		dbo.GetQuotientFrom2Int(IndexBugNum ,BugNum) as IndexBugPercent,
		InHospitalRecordBugNum,
		dbo.GetQuotientFrom2Int(InHospitalRecordBugNum,BugNum) as InHospitalRecordBugPercent,
		OperateRecordBugNum,
		dbo.GetQuotientFrom2Int(OperateRecordBugNum,BugNum) as OperateRecordBugPercent,
		FirstCourseRecordBugNum,
		dbo.GetQuotientFrom2Int(FirstCourseRecordBugNum,BugNum) as FirstCourseRecordBugPercent,
		OutHospitalRecordBugNum,
		dbo.GetQuotientFrom2Int(OutHospitalRecordBugNum,BugNum) as OutHospitalRecordBugPercent,
		NormalCourseRecordBugNum,
		dbo.GetQuotientFrom2Int(NormalCourseRecordBugNum,BugNum) as NormalCourseRecordBugPercent,
		ApproveOperateBugNum,
		dbo.GetQuotientFrom2Int(ApproveOperateBugNum,BugNum) as ApproveOperateBugPercent,
		ApproveAnaesthesiaNum,
		dbo.GetQuotientFrom2Int(ApproveAnaesthesiaNum,BugNum) as ApproveAnaesthesiaPercent,
		SpecialBugNum,
		dbo.GetQuotientFrom2Int(SpecialBugNum,BugNum) as SpecialBugPercent,
		AssistantBugNum,
		dbo.GetQuotientFrom2Int(AssistantBugNum,BugNum) as AssistantBugPercent,
		CalligraphBugNum,
		dbo.GetQuotientFrom2Int(CalligraphBugNum,BugNum) as CalligraphBugPercent
	from #TableDocBugNum
	where BugNum <> 0

	drop table #TableDocBugNum
end

--Backup
/*
	select distinct ID,[Name],CaseNum,BugNum,
		IndexBugNum,
		cast(IndexBugNum as float)/cast(BugNum as float) as IndexBugPercent,
		InHospitalRecordBugNum,
		cast(InHospitalRecordBugNum as float)/cast(BugNum as float) as InHospitalRecordBugPercent,
		OperateRecordBugNum,
		cast(OperateRecordBugNum as float)/cast(BugNum as float) as OperateRecordBugPercent,
		FirstCourseRecordBugNum,
		cast(FirstCourseRecordBugNum as float)/cast(BugNum as float) as FirstCourseRecordBugPercent,
		OutHospitalRecordBugNum,
		cast(OutHospitalRecordBugNum as float)/cast(BugNum as float) as OutHospitalRecordBugPercent,
		NormalCourseRecordBugNum,
		cast(NormalCourseRecordBugNum as float)/cast(BugNum as float) as NormalCourseRecordBugPercent,
		ApproveOperateBugNum,
		cast(ApproveOperateBugNum as float)/cast(BugNum as float) as ApproveOperateBugPercent,
		ApproveAnaesthesiaNum,
		cast(ApproveAnaesthesiaNum as float)/cast(BugNum as float) as ApproveAnaesthesiaPercent,
		SpecialBugNum,
		cast(SpecialBugNum as float)/cast(BugNum as float) as SpecialBugPercent,
		AssistantBugNum,
		cast(AssistantBugNum as float)/cast(BugNum as float) as AssistantBugPercent,
		CalligraphBugNum,cast(CalligraphBugNum as float)/cast(BugNum as float) as CalligraphBugPercent
	from #TableDepBugNum
*/
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertStandard]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[InsertStandard]
(
	@Name varchar(128),
	@Description varchar(512),
	@NewId int output
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Standard] ([Name], [Description]) 
VALUES (@Name,  @Description);

select @NewId=scope_identity()

return @NewId' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteStandard]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[DeleteStandard]
(
	@StandardID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Standard] WHERE [StandardID] = @StandardID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateStandard]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UpdateStandard]
(
	@StandardID int,
	@Name varchar(128),
	@Status bit,
	@Description varchar(512)
)
AS
	SET NOCOUNT OFF;
UPDATE [Standard] SET  [Name] = @Name, [Status] = @Status, [Description] = @Description 
WHERE [StandardID] = @StandardID 

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectStandard]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SelectStandard]
AS
	SET NOCOUNT ON;
SELECT     Standard.*
FROM         Standard' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectUserGroup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SelectUserGroup]
AS
	SET NOCOUNT ON;
SELECT     UserGroup.*
FROM         UserGroup' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateUserGroup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UpdateUserGroup]
(
	@UserGroupID int,
	@UserGroupName varchar(128)
)
AS
	SET NOCOUNT OFF;
UPDATE [UserGroup] SET  [UserGroupName] = @UserGroupName WHERE [UserGroupID] = @UserGroupID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertUserGroup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[InsertUserGroup]
(
	@UserGroupName varchar(128)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [UserGroup] ([UserGroupName]) VALUES (@UserGroupName)
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteUserGroup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[DeleteUserGroup]
(
	@UserGroupID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [UserGroup] WHERE [UserGroupID] = @UserGroupID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteDictionary]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[DeleteDictionary]
(
	@DictionaryID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Dictionary] 
WHERE [DictionaryID] = @DictionaryID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertDictionary]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[InsertDictionary]
(
	@Name varchar(128),
	@Value varchar(128),
	@Type varchar(128),
	@Description varchar(512)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Dictionary] ([Name], [Value], [Type], [Description])
VALUES ( @Name, @Value, @Type, @Description);
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateDictionary]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UpdateDictionary]
(
	@DictionaryID int,
	@Name varchar(128),
	@Value varchar(128),
	@Type varchar(128),
	@Description varchar(512)
)
AS
	SET NOCOUNT OFF;
UPDATE [Dictionary] 
SET [Name] = @Name, 
[Value] = @Value, 
[Type] = @Type, 
[Description] = @Description 
WHERE [DictionaryID] = @DictionaryID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectRequisition]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SelectRequisition]
	@IsSent bit = null,
	@CaseInfoID int = null,
	@Owner int = null
AS
	SET NOCOUNT ON;

if @CaseInfoID = -1
begin
	SELECT	r.*,
			d.Name as OwnerName,
			g.CaseInfoId
	FROM Requisition r
	left join dictionary d on r.owner = d.value and d.type=''doctor''
	left join graderesult g on g.graderesultid = r.graderesultid
	WHERE (IsSent = @IsSent or @IsSent is null) and
		  (g.CaseInfoID is null) and
		  (r.owner=@Owner or @Owner is null)
end
if @Owner = -1
begin
	SELECT	r.*,
			d.Name as OwnerName,
			g.CaseInfoId
	FROM Requisition r
	left join dictionary d on r.owner = d.value and d.type=''doctor''
	left join graderesult g on g.graderesultid = r.graderesultid
	WHERE (IsSent = @IsSent or @IsSent is null) and
		  (g.CaseInfoID=@CaseInfoID or @CaseInfoID is null) and
		  (r.owner is null)
end
if (@IsSent is null) and (@CaseInfoID is null) and (@Owner is null)
begin
	select * from requisition
end' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IsVetoGradeResult]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-7-26
-- Description:	Does Graderesult include a Veto StandardBug
-- =============================================
CREATE FUNCTION [dbo].[IsVetoGradeResult]
(
	@GradeResultId int,
	@StandardId int
)
RETURNS int
AS
BEGIN
	declare @ret int
	set @ret = 0

	select top 1 @ret=1 from graderesultdetail a
	left join standardbug b on a.bugid=b.bugid
	where a.resultid=@GradeResultId and b.standardid=@StandardId and b.isveto=1

	return @ret
END
' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_DoctorBugRank]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_DoctorBugRank]
AS
SELECT     TOP (100) PERCENT dd.Name AS Owner, a.Num AS bugcount
FROM         (SELECT     Owner, COUNT(*) AS Num
                       FROM          dbo.GradeResultDetail
                       GROUP BY Owner) AS a INNER JOIN
                      dbo.D_Doctor AS dd ON a.Owner = dd.Id
ORDER BY bugcount
' 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 84
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 243
               Bottom = 114
               Right = 410
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'vw_DoctorBugRank'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'vw_DoctorBugRank'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IsSent]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-8-24
-- Description:	indicate if a caseinfo with a sent requisition.
-- =============================================
-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-8-26
-- Description:	change inner join tables.
-- =============================================

CREATE PROCEDURE [dbo].[IsSent]
	@CaseInfoId int = null
AS
BEGIN
	SET NOCOUNT ON;

	select top 1 issent from graderesultdetail a
	inner join requisitionbugitem b on a.graderesultdetailid = b.requisitionbugitemid
	inner join requisition c on b.requisitionid=c.requisitionid
	inner join graderesult d on a.resultid = d.graderesultid
	where d.caseinfoid=@CaseInfoId
	
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateGradeResultDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[UpdateGradeResultDetail]
(
	@GradeResultDetailID int,
	@IsFixed bit
)
AS
	SET NOCOUNT OFF;
UPDATE [GradeResultDetail] 
SET [IsFixed] = @IsFixed 
WHERE [GradeResultDetailID] = @GradeResultDetailID
--非协和模式下如果病案的一个缺陷被翻修，就认为整个病案处在了翻修状态，
--方便评审的时候提示“病案翻修不能评审”！！！wind0907
declare @gradeResultID int
select @gradeResultID=ResultID from GradeResultDetail
where GradeResultDetailID=@GradeResultDetailID
update GradeReuslt set IsReworked=1
where GradeResultID=@gradeResultID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertGradeResultDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[InsertGradeResultDetail]
(
	@ResultID int,
	@BugID int,
	@Score int,
	@Owner int,
	@Description varchar(512)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [GradeResultDetail] ([ResultID], [BugID], [Score], [Owner], [Description],[IsFixed]) 
VALUES (@ResultID, @BugID, @Score, @Owner, @Description, 0)



' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteGradeResultDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[DeleteGradeResultDetail]
(
	@ResultID int = null
)
AS
	SET NOCOUNT OFF;
DELETE FROM [GradeResultDetail] 
WHERE ResultID=@ResultID

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertD_Doctor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[InsertD_Doctor]
(
	@Code nvarchar(MAX),
	@DepartmentId int,
	@JobTitleId int,
	@Name nvarchar(MAX),
	@Pinyin nvarchar(MAX),
	@GB nvarchar(MAX)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [D_Doctor] ([Code], [DepartmentId], [JobTitleId], [Name], [Pinyin], [GB]) VALUES (@Code, @DepartmentId, @JobTitleId, @Name, @Pinyin, @GB);
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateD_Doctor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateD_Doctor]
(
	@Code nvarchar(MAX),
	@DepartmentId int,
	@JobTitleId int,
	@Name nvarchar(MAX),
	@Pinyin nvarchar(MAX),
	@GB nvarchar(MAX),
	@Original_Id int,
	@IsNull_DepartmentId Int,
	@Original_DepartmentId int,
	@IsNull_JobTitleId Int,
	@Original_JobTitleId int
)
AS
	SET NOCOUNT OFF;
UPDATE [D_Doctor] SET [Code] = @Code, [DepartmentId] = @DepartmentId, [JobTitleId] = @JobTitleId, [Name] = @Name, [Pinyin] = @Pinyin, [GB] = @GB WHERE (([Id] = @Original_Id) AND ((@IsNull_DepartmentId = 1 AND [DepartmentId] IS NULL) OR ([DepartmentId] = @Original_DepartmentId)) AND ((@IsNull_JobTitleId = 1 AND [JobTitleId] IS NULL) OR ([JobTitleId] = @Original_JobTitleId)));
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertBug]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[InsertBug]
(
	@PredicateID int,
	@QcCaseItemID int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Bug] ([PredicateID], [QcCaseItemID]) VALUES ( @PredicateID, @QcCaseItemID);' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteBug]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[DeleteBug]
(
	@BugID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Bug] WHERE [BugID] = @BugID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateBug]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UpdateBug]
(
	@BugID int,
	@PredicateID int,
	@QcCaseItemID int
)
AS
	SET NOCOUNT OFF;
UPDATE [Bug] SET  [PredicateID] = @PredicateID, [QcCaseItemID] = @QcCaseItemID 
WHERE [BugID] = @BugID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertQcCaseItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[InsertQcCaseItem]
(
	@CaseItemID int,
	@QcItemID int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [QcCaseItem] ([CaseItemID], [QcItemID])
VALUES (@CaseItemID, @QcItemID);
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateQcCaseItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UpdateQcCaseItem]
(
	@QcCaseItemID int,
	@CaseItemID int,
	@QcItemID int
)
AS
	SET NOCOUNT OFF;
UPDATE [QcCaseItem] SET [CaseItemID] = @CaseItemID, [QcItemID] = @QcItemID 
WHERE [QcCaseItemID] = @QcCaseItemID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteQcCaseItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[DeleteQcCaseItem]
(
	@QcCaseItemID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [QcCaseItem] 
WHERE [QcCaseItemID] = @QcCaseItemID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertStandardCase]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[InsertStandardCase]
(
	@CaseItemID int,
	@StandardID int,
	@LimitScore int,
	@Sequence int,
	@Status bit,
	@Description varchar(512)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [StandardCase] ([CaseItemID], [StandardID], [LimitScore], [Sequence], [Status], [Description]) 
VALUES (@CaseItemID, @StandardID, @LimitScore, @Sequence, @Status, @Description);' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteStandardCase]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[DeleteStandardCase]
(
	@StandardCaseID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [StandardCase] WHERE [StandardCaseID] = @StandardCaseID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateStandardCase]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-7-30
-- Description:	
-- =============================================

CREATE PROCEDURE [dbo].[UpdateStandardCase]
(
	@CaseItemID int,
	@StandardID int,
	@LimitScore int,
	@Sequence int,
	@Status bit,
	@Description varchar(512),
	@StandardCaseID int
)
AS
	SET NOCOUNT OFF;
UPDATE 
	[StandardCase] 
SET 
	[CaseItemID] = @CaseItemID, 
	[StandardID] = @StandardID, 
	[LimitScore] = @LimitScore, 
	[Sequence] = @Sequence, 
	[Status] = @Status, 
	[Description] = @Description 
WHERE 
	[StandardCaseId] = @StandardCaseID
	


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectStandardCaseByStandard]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SelectStandardCaseByStandard]
	@standardid int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * from standardcase where standardid=@standardid
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectStandardCase]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[SelectStandardCase]
(
	@CaseItemID int = null,
	@StandardID int = null
)
AS
	SET NOCOUNT ON;
SELECT 
	sc.*,ci.Name as CaseItemName
FROM StandardCase sc
INNER JOIN CaseItem ci ON sc.CaseItemID=ci.CaseItemID
WHERE
	(sc.CaseItemID=@CaseItemID or @CaseItemID is null) AND
	(StandardID=@StandardID or @StandardID is null)
	
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateRequisition]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UpdateRequisition]
(
	@RequisitionID int,
	@GradeResultID int,
	@IsSent bit,
	@SendDate datetime,
	@Owner int
)
AS
	SET NOCOUNT OFF;
UPDATE [Requisition] SET  [GradeResultID] = @GradeResultID, [IsSent] = @IsSent, [SendDate] = @SendDate, [Owner]=@Owner
WHERE [RequisitionID] = @RequisitionID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertRequisition]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[InsertRequisition]
(
	@GradeResultID int,
	@IsSent bit,
	@SendDate datetime,
	@Owner int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Requisition] ([GradeResultID], [IsSent], [SendDate], [Owner]) 
VALUES ( @GradeResultID, @IsSent, @SendDate, @Owner);

select scope_identity()' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteRequisition]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[DeleteRequisition]
(
	@RequisitionID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [RequisitionBugItem] WHERE [RequisitionID] = @RequisitionID
DELETE FROM [Requisition] WHERE [RequisitionID] = @RequisitionID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteRequisitionBugItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[DeleteRequisitionBugItem]
(
	@RequisitionBugItemID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [RequisitionBugItem] 
WHERE [RequisitionBugItemID] = @RequisitionBugItemID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateRequisitionBugItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UpdateRequisitionBugItem]
(
	@RequisitionBugItemID int,
	@RequisitionID int,
	@GradeResultDetailID int
)
AS
	SET NOCOUNT OFF;
UPDATE [RequisitionBugItem] SET [RequisitionID] = @RequisitionID, [GradeResultDetailID] = @GradeResultDetailID 
WHERE [RequisitionBugItemID] = @RequisitionBugItemID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertRequisitionBugItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[InsertRequisitionBugItem]
(
	@RequisitionID int,
	@GradeResultDetailID int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [RequisitionBugItem] ( [RequisitionID], [GradeResultDetailID]) 
VALUES ( @RequisitionID, @GradeResultDetailID);' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertGradeResult]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[InsertGradeResult]
(
	@CaseInfoID int,
	@StandardID int,
	@Score int,
	@LevelID int,
	@QCUser int
)
AS
	SET NOCOUNT OFF;
declare @Num int
select @Num=count(*) from GradeResult
where CaseInfoID=@CaseInfoID and StandardID=@StandardID
if @Num=0
begin
	INSERT INTO [GradeResult] ([CaseInfoID], [StandardID], [Score], [LevelID],  [QCUser], [CreateDate], [IsReworked]) 
	VALUES ( @CaseInfoID, @StandardID, @Score, @LevelID, @QCUser, getdate(), 0)
end
else
begin
	update GradeResult set Score=@Score,LevelID=@LevelID,@QcUser=@QcUser
	where CaseInfoID=@CaseInfoID and StandardID=@StandardID
end


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteGradeResult]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[DeleteGradeResult]
(
	@GradeResultID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [GradeResult] 
WHERE[GradeResultID] = @GradeResultID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectGradeResult]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[SelectGradeResult]
(
	@ResultID int = null,
	@CaseInfoID int = null,
	@StandardID int = null
)
AS
	SET NOCOUNT ON;
IF @ResultID is null
Begin
	SELECT *
	FROM GradeResult
	WHERE CaseInfoID=@CaseInfoID and StandardID=@StandardID
END
ELSE
BEGIN
	SELECT *
	FROM GradeResult
	WHERE GradeResultID=@ResultID or @ResultID is null
END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateGradeResult]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UpdateGradeResult]
(
	@GradeResultID int,
	@ActualReturnDate datetime,
	@NotifyDate datetime,
	@ReworkScore int,
	@Description varchar(512)
)
AS
	SET NOCOUNT OFF;
UPDATE [GradeResult] 
SET	[ActualReturnDate] = @ActualReturnDate, 
	[NotifyDate] = @NotifyDate, 
	[ReworkScore] = @ReworkScore, 
	[IsReworked] = 1, 
	[Description] = @Description 
WHERE [GradeResultID] = @GradeResultID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[InsertUser]
(
	@GroupID int,
	@UserName varchar(128),
	@DisplayName varchar(128),
	@Pwd varchar(128),
	@Description varchar(128)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [User] ([GroupID], [UserName], [DisplayName], [Pwd],  [Description]) 
VALUES (@GroupID, @UserName, @DisplayName, @Pwd, @Description);
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[DeleteUser]
(
	@UserID int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [User] WHERE 
[UserID] = @UserID 


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UpdateUser]
(
	@UserID int,
	@GroupID int,
	@UserName varchar(128),
	@DisplayName varchar(128),
	@Pwd varchar(128),
	@Description varchar(128)
)
AS
	SET NOCOUNT OFF;
UPDATE [User] SET  [GroupID] = @GroupID, [UserName] = @UserName, 
	[DisplayName] = @DisplayName, [Pwd] = @Pwd,  [Description] = @Description 
WHERE [UserID] = @UserID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[SelectUser]
(
	@UserID int = null
)
AS
	SET NOCOUNT ON;
SELECT *
FROM  [User]
where UserID=@UserID or @UserID is null
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectD_CM3]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SelectD_CM3]
AS
	SET NOCOUNT ON;
SELECT     D_CM3.*
FROM         D_CM3' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteD_CM3]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DeleteD_CM3]
(
	@Original_Id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [D_CM3] WHERE (([Id] = @Original_Id))' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateD_CM3]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateD_CM3]
(
	@Code nvarchar(MAX),
	@Name nvarchar(MAX),
	@Pinyin nvarchar(MAX),
	@GB nvarchar(MAX),
	@Original_Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [D_CM3] SET [Code] = @Code, [Name] = @Name, [Pinyin] = @Pinyin, [GB] = @GB WHERE (([Id] = @Original_Id));
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertD_CM3]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[InsertD_CM3]
(
	@Code nvarchar(MAX),
	@Name nvarchar(MAX),
	@Pinyin nvarchar(MAX),
	@GB nvarchar(MAX)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [D_CM3] ( [Code], [Name], [Pinyin], [GB]) VALUES ( @Code, @Name, @Pinyin, @GB);
	
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertD_Department]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[InsertD_Department]
(
	@Code nvarchar(MAX),
	@Name nvarchar(MAX),
	@FullName nvarchar(MAX),
	@Pinyin nvarchar(MAX),
	@GB nvarchar(MAX)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [D_Department] ([Code], [Name], [FullName], [Pinyin], [GB]) VALUES (@Code, @Name, @FullName, @Pinyin, @GB);
	
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateD_Department]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateD_Department]
(
	@Code nvarchar(MAX),
	@Name nvarchar(MAX),
	@FullName nvarchar(MAX),
	@Pinyin nvarchar(MAX),
	@GB nvarchar(MAX),
	@Original_Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [D_Department] SET [Code] = @Code, [Name] = @Name, [FullName] = @FullName, [Pinyin] = @Pinyin, [GB] = @GB WHERE (([Id] = @Original_Id));
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectD_Department]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SelectD_Department]
AS
	SET NOCOUNT ON;
SELECT     D_Department.*
FROM         D_Department' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteD_Department]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DeleteD_Department]
(
	@Original_Id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [D_Department] WHERE (([Id] = @Original_Id))' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectGradeResultDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[SelectGradeResultDetail]
(
	@ResultID int = null,
	@DetailID int = null
)
AS
	SET NOCOUNT ON;
SELECT grd.GradeResultDetailID,grd.ResultID,grd.BugID,
ci.CaseItemID,ci.[Name] as CaseItemName,
qi.QcItemID,qi.[name] as QcItemName,
bp.BugPredicateID, bp.[Name] as BugPredicateName,
grd.Score,grd.Owner as OwnerID,
dbo.fnGetNameInDictionary(''Doctor'',grd.Owner) as Owner,
grd.IsFixed,grd.Description
FROM GradeResultDetail grd
left join Bug b on grd.BugID=b.BugID
left join QcCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
left join CaseItem ci on qci.CaseItemID=ci.CaseItemID
left join QcItem qi on qci.QcItemID=qi.QcItemID
left join BugPredicate bp on b.PredicateID=bp.BugPredicateID
WHERE (ResultID=@ResultID or @ResultID is null)
and (GradeResultDetailID=@DetailID or @DetailID is null)


set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectDocBugList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[SelectDocBugList]
(
	@Owner int,
	@ReqNum int = null,
	@CaseNum int = null,
	@NotifyDate datetime = null,
	@IsFixed bit
)
AS
	SET NOCOUNT ON;
SELECT distinct grd.GradeResultDetailID,grd.ResultID,grd.BugID,
ci.CaseItemID,ci.[Name] as CaseItemName,
qi.QcItemID,qi.[name] as QcItemName,
bp.BugPredicateID, bp.[Name] as BugPredicateName,
grd.Score,grd.Owner as OwnerID,
dbo.fnGetNameInDictionary(''Doctor'',grd.Owner) as Owner,
grd.IsFixed,grd.Description
FROM GradeResultDetail grd
left join GradeResult gr on gr.GradeResultID=grd.ResultID
left join CaseInfo c on gr.CaseInfoID=c.CaseInfoID
left join RequisitionBugItem rbi on grd.GradeResultDetailID=rbi.GradeResultDetailID
left join Bug b on grd.BugID=b.BugID
left join QcCaseItem qci on b.QcCaseItemID=qci.QcCaseItemID
left join CaseItem ci on qci.CaseItemID=ci.CaseItemID
left join QcItem qi on qci.QcItemID=qi.QcItemID
left join BugPredicate bp on b.PredicateID=bp.BugPredicateID
WHERE (grd.Owner=@Owner or @Owner is null)
and (grd.IsFixed=@IsFixed or @IsFixed is null)
and (c.CaseNum=@CaseNum or @CaseNum is null)
and (rbi.RequisitionID=@ReqNum or @ReqNum is null)
and (datediff(day,gr.NotifyDate,@NotifyDate)=0 or @NotifyDate is null)

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectRepairCase]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[SelectRepairCase]
(
	@StandardID int,
	@OutHospitalDate datetime = null,
	@QCDate datetime = null,
	@CaseNum int = null,
	@Owner int = null,
	@ReqNum int = null
)
AS
	SET NOCOUNT ON;
SELECT distinct c.CaseInfoID, c.CaseNum, c.Sequence, c.OutHospitalDate, 
	  c.InhospitalDoc as InhospitalDocID, dbo.fnGetNameInDictionary(''Doctor'',c.InhospitalDoc) as InhospitalDoc, 
      g.Score, g.LevelID,dbo.fnGetNameInDictionary(''Level'',g.LevelID) as [Level], 
	  g.ShouldReturnDate, g.ActualReturnDate, g.ReworkScore, 
      g.CreateDate, g.QCUser, g.IsReworked,g.NotifyDate
FROM CaseInfo c 
left JOIN GradeResult g ON c.CaseInfoID = g.CaseInfoID
left JOIN GradeResultDetail grd ON g.GradeResultID=grd.ResultID
left JOIN Requisition r ON (g.GradeResultID=r.GradeResultID or grd.Owner=r.Owner)
WHERE g.StandardID=@StandardID 
and (c.OutHospitalDate=@OutHospitalDate or @OutHospitalDate is null)
and (g.CreateDate=@QCDate or @QCDate is null)
and (c.CaseNum=@CaseNum or @CaseNum is null)
and (grd.Owner=@Owner or @Owner is null)
and (r.RequisitionID=@ReqNum or @ReqNum is null)











' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectRepairDoc]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[SelectRepairDoc]
(
	@Owner int = null,
	@ReqNum int = null,
	@SendDate datetime = null,
	@CaseNum int = null
)
AS
	SET NOCOUNT ON;
SELECT distinct grd.Owner as OwnerID,dbo.fnGetNameInDictionary(''Doctor'',grd.Owner) as Owner,
	r.SendDate
FROM Requisition r
INNER JOIN RequisitionBugItem rbi on r.RequisitionID=rbi.RequisitionID
INNER JOIN GradeResultDetail grd on rbi.GradeResultDetailID=grd.GradeResultDetailID
INNER JOIN GradeResult gr on grd.ResultID=gr.GradeResultID
INNER JOIN CaseInfo c on gr.CaseInfoID=c.CaseInfoID
WHERE (r.Owner=@Owner or @Owner is null) 
and (r.RequisitionID=@ReqNum or @ReqNum is null)
and (r.SendDate=@SendDate or @SendDate is null)
and (c.CaseNum=@CaseNum or @CaseNum is null)


















' 
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BUG_REFERENCE_BUGPREDI]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bug]'))
ALTER TABLE [dbo].[Bug]  WITH CHECK ADD  CONSTRAINT [FK_BUG_REFERENCE_BUGPREDI] FOREIGN KEY([PredicateID])
REFERENCES [dbo].[BugPredicate] ([BugPredicateID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BUG_REFERENCE_QCCASEIT]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bug]'))
ALTER TABLE [dbo].[Bug]  WITH CHECK ADD  CONSTRAINT [FK_BUG_REFERENCE_QCCASEIT] FOREIGN KEY([QcCaseItemID])
REFERENCES [dbo].[QcCaseItem] ([QcCaseItemID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_D_Doctor_D_Department]') AND parent_object_id = OBJECT_ID(N'[dbo].[D_Doctor]'))
ALTER TABLE [dbo].[D_Doctor]  WITH CHECK ADD  CONSTRAINT [FK_D_Doctor_D_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[D_Department] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_D_Doctor_D_JobTitle]') AND parent_object_id = OBJECT_ID(N'[dbo].[D_Doctor]'))
ALTER TABLE [dbo].[D_Doctor]  WITH CHECK ADD  CONSTRAINT [FK_D_Doctor_D_JobTitle] FOREIGN KEY([JobTitleId])
REFERENCES [dbo].[D_JobTitle] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QCCASEIT_REFERENCE_CASEITEM]') AND parent_object_id = OBJECT_ID(N'[dbo].[QcCaseItem]'))
ALTER TABLE [dbo].[QcCaseItem]  WITH CHECK ADD  CONSTRAINT [FK_QCCASEIT_REFERENCE_CASEITEM] FOREIGN KEY([CaseItemID])
REFERENCES [dbo].[CaseItem] ([CaseItemID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QCCASEIT_REFERENCE_QCITEM]') AND parent_object_id = OBJECT_ID(N'[dbo].[QcCaseItem]'))
ALTER TABLE [dbo].[QcCaseItem]  WITH CHECK ADD  CONSTRAINT [FK_QCCASEIT_REFERENCE_QCITEM] FOREIGN KEY([QcItemID])
REFERENCES [dbo].[QcItem] ([QcItemID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GRADERES_REFERENCE_CASEINFO]') AND parent_object_id = OBJECT_ID(N'[dbo].[GradeResult]'))
ALTER TABLE [dbo].[GradeResult]  WITH CHECK ADD  CONSTRAINT [FK_GRADERES_REFERENCE_CASEINFO] FOREIGN KEY([CaseInfoID])
REFERENCES [dbo].[CaseInfo] ([CaseInfoID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GRADERES_REFERENCE_STANDARD]') AND parent_object_id = OBJECT_ID(N'[dbo].[GradeResult]'))
ALTER TABLE [dbo].[GradeResult]  WITH CHECK ADD  CONSTRAINT [FK_GRADERES_REFERENCE_STANDARD] FOREIGN KEY([StandardID])
REFERENCES [dbo].[Standard] ([StandardID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GRADERES_REFERENCE_USER]') AND parent_object_id = OBJECT_ID(N'[dbo].[GradeResult]'))
ALTER TABLE [dbo].[GradeResult]  WITH CHECK ADD  CONSTRAINT [FK_GRADERES_REFERENCE_USER] FOREIGN KEY([QCUser])
REFERENCES [dbo].[User] ([UserID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_STANDARD_REFERENCE_CASEITEM]') AND parent_object_id = OBJECT_ID(N'[dbo].[StandardCase]'))
ALTER TABLE [dbo].[StandardCase]  WITH CHECK ADD  CONSTRAINT [FK_STANDARD_REFERENCE_CASEITEM] FOREIGN KEY([CaseItemID])
REFERENCES [dbo].[CaseItem] ([CaseItemID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_STANDARDCASE_REFERENCE_STANDARD]') AND parent_object_id = OBJECT_ID(N'[dbo].[StandardCase]'))
ALTER TABLE [dbo].[StandardCase]  WITH CHECK ADD  CONSTRAINT [FK_STANDARDCASE_REFERENCE_STANDARD] FOREIGN KEY([StandardID])
REFERENCES [dbo].[Standard] ([StandardID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_STANDARD_REFERENCE_BUG]') AND parent_object_id = OBJECT_ID(N'[dbo].[StandardBug]'))
ALTER TABLE [dbo].[StandardBug]  WITH CHECK ADD  CONSTRAINT [FK_STANDARD_REFERENCE_BUG] FOREIGN KEY([BugID])
REFERENCES [dbo].[Bug] ([BugID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_STANDARDBUG_REFERENCE_STANDARD]') AND parent_object_id = OBJECT_ID(N'[dbo].[StandardBug]'))
ALTER TABLE [dbo].[StandardBug]  WITH CHECK ADD  CONSTRAINT [FK_STANDARDBUG_REFERENCE_STANDARD] FOREIGN KEY([StandardID])
REFERENCES [dbo].[Standard] ([StandardID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_USER_REFERENCE_USERGROU]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_USER_REFERENCE_USERGROU] FOREIGN KEY([GroupID])
REFERENCES [dbo].[UserGroup] ([UserGroupID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_REQUISIT_REFERENCE_GRADERES]') AND parent_object_id = OBJECT_ID(N'[dbo].[RequisitionBugItem]'))
ALTER TABLE [dbo].[RequisitionBugItem]  WITH CHECK ADD  CONSTRAINT [FK_REQUISIT_REFERENCE_GRADERES] FOREIGN KEY([GradeResultDetailID])
REFERENCES [dbo].[GradeResultDetail] ([GradeResultDetailID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_REQUISIT_REFERENCE_REQUISIT]') AND parent_object_id = OBJECT_ID(N'[dbo].[RequisitionBugItem]'))
ALTER TABLE [dbo].[RequisitionBugItem]  WITH CHECK ADD  CONSTRAINT [FK_REQUISIT_REFERENCE_REQUISIT] FOREIGN KEY([RequisitionID])
REFERENCES [dbo].[Requisition] ([RequisitionID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GRADERES_REFERENCE_BUG]') AND parent_object_id = OBJECT_ID(N'[dbo].[GradeResultDetail]'))
ALTER TABLE [dbo].[GradeResultDetail]  WITH CHECK ADD  CONSTRAINT [FK_GRADERES_REFERENCE_BUG] FOREIGN KEY([BugID])
REFERENCES [dbo].[Bug] ([BugID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GRADERES_REFERENCE_GRADERES]') AND parent_object_id = OBJECT_ID(N'[dbo].[GradeResultDetail]'))
ALTER TABLE [dbo].[GradeResultDetail]  WITH CHECK ADD  CONSTRAINT [FK_GRADERES_REFERENCE_GRADERES] FOREIGN KEY([ResultID])
REFERENCES [dbo].[GradeResult] ([GradeResultID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_REQUISIT_REFERENCE_GRADERESULT]') AND parent_object_id = OBJECT_ID(N'[dbo].[Requisition]'))
ALTER TABLE [dbo].[Requisition]  WITH CHECK ADD  CONSTRAINT [FK_REQUISIT_REFERENCE_GRADERESULT] FOREIGN KEY([GradeResultID])
REFERENCES [dbo].[GradeResult] ([GradeResultID])
