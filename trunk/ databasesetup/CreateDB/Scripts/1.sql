-- =============================================
-- Author:		yale.zhang
-- ALTER  date: 2008-7-30
-- Description:	retrieve data for report 4.6
-- =============================================
-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-8-12
-- Description:	add 4 effective number processing
-- =============================================
-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-8-31
-- Description:	add stat from doctor
-- =============================================
-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-11-10
-- Description:	fix date and comparing date problem.
-- =============================================
-- =============================================
-- Author:		yale.zhang
-- Create date: 2008-12-27
-- Description:	change qcdate to outhospitaldate
-- =============================================
-- =============================================
-- Author:		yale.zhang
-- Create date: 2009-1-4
-- Description:	change the logic of getting the number of out hospital cases and the number of requisitions.
-- =============================================
-- =============================================
-- Author:		yale.zhang
-- Create date: 2009-2-20
-- Description:	fixed 200% repair rate.
-- =============================================


ALTER PROCEDURE [dbo].[sp_Report4_6]
--10 parameters
	@Mode int = 0,
	@StandardId int = 1,
	@OutStart datetime = null,
	@OutEnd datetime = null,
	@QcStart datetime = null,
	@QcEnd datetime = null,
	@OutDeptId int = null,
	@OutWardId int = null,
    @OutDocId int = null,
	@CompStart datetime = null,
	@CompEnd datetime = null
AS
BEGIN
SET NOCOUNT ON;
---------------------------------------------------------------------------------



--create temp table storing parameter
--not repeatly
declare @init_p varchar(1024)
create table #p
(
	OutStart datetime,
	OutEnd datetime,
	StandardId int,
	CompStart datetime,
	CompEnd datetime,
    QcStart datetime,
    QcEnd datetime
)
insert into #p values(@OutStart, @OutEnd, @StandardId,@CompStart,@CompEnd,@QcStart,@QcEnd)
set @init_p = '
declare @s datetime
declare @e datetime
declare @sid int
declare @cs datetime
declare @ce datetime
declare @qs datetime
declare @qe datetime

select @s=OutStart from #p
select @e=OutEnd from #p
select @sid=StandardId from #p
select @cs=CompStart from #p
select @ce=CompEnd from #p
select @qs=QcStart from #p
select @qe=QcEnd from #p
'

--create report schema and x dimension
--30 cols
--not repeatly
create table #t
(
	Id int,
	CName nvarchar(128),
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
declare @groupbycol as varchar(512)
declare @ydimtable as varchar(512)
declare @ydimtablewhere varchar(512)
--科别
if @mode = 0
begin
	set @groupbycol = 'outhospitaldep'
	set @ydimtable = 'd_department'
	--determine which department
	if @OutDeptId is not null
	begin
		set @ydimtablewhere = 'where id=' + cast(@OutDeptId as varchar(16))
	end
	else
	begin
		set @ydimtablewhere = 'where 1=1'
	end
end
--病室
if @mode = 1
begin
	set @groupbycol = 'outhospitalward'
	set @ydimtable = 'd_ward'
	--determine which ward
	if @OutWardId is not null
	begin
		set @ydimtablewhere = 'where id=' + cast(@OutWardId as varchar(16))
	end
	else
	begin
		set @ydimtablewhere = 'where 1=1'
	end
end
--住院医师
if @mode = 2
begin
	set @groupbycol = 'inhospitaldoc'
	set @ydimtable = 'd_doctor'
	set @ydimtablewhere = 'where 1=1'
    if @OutDocId is not null
    begin
        set @ydimtablewhere = 'where id=' + cast(@OutDocId as varchar(16))
    end
    else
    begin
        set @ydimtablewhere = 'where 1=1'
    end
end

--create y dimension
--not repeatly
declare @sql varchar(8000)
set @sql = 'insert into #t select	id,name,0,0,0,
									0,0,0,0,0,
									0,0,0,0,0,
									0,0,0,0,0,
									0,0,0,0,0,
									0,0,0,0,0,
									0,0,0,0,0,
									0 from ' + @ydimtable + ' ' + @ydimtablewhere
exec(@sql)

------------------------------------------------------------------------------------------
------------A
declare @wherepre1 varchar(1024)
set @wherepre1 = '
	where
		( datediff(day,@s,OutHospitalDate)>=0 or @s is null ) and
		( datediff(day,@e,OutHospitalDate)<=0 or @e is null ) and
        ( datediff(day,@qs,g.CreateDate)>=0 or @qs is null ) and
        ( datediff(day,@qe,g.CreateDate)<=0 or @qe is null )
'

--insert OutHospCaseNumA
set @sql = @init_p + '
update #t
set OutHCaseNumA = a.num
from (
	select 
		c.'+@groupbycol+',
		count(*) as num 
	from caseinfo c
    left join GradeResult g on c.CaseInfoId=g.CaseInfoId
	'+@wherepre1+'
	group by c.'+@groupbycol+'
) a
join #t b on b.id=a.'+@groupbycol+'
'
exec(@sql)

--insert CheckedCaseNumA
set @sql = @init_p + '
update #t
set CheckedCaseNumA = a.num
from (
	select 
		c.'+@groupbycol+',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	'+@wherepre1+'
	group by c.'+@groupbycol+'
) a
join #t b on b.id=a.'+@groupbycol+'

update #t set CheckedRateA=dbo.GetQuotientFrom2Int(CheckedCaseNumA,OutHCaseNumA) where OutHCaseNumA != 0
'
--update #t set CheckedRateA=CheckedCaseNumA/cast(OutHCaseNumA as float) where OutHCaseNumA != 0

exec(@sql)

--insert PassedCaseNumA
set @sql = @init_p + '
update #t
set PassedCaseNumA = a.num
from (
	select 
		c.'+@groupbycol+',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	'+@wherepre1+' and g.levelid <= 2
	group by c.'+@groupbycol+'
) a
join #t b on b.id = a.'+@groupbycol+'

update #t set PassedRateA=dbo.GetQuotientFrom2Int(PassedCaseNumA,CheckedCaseNumA) where CheckedCaseNumA != 0
'
--update #t set PassedRateA=PassedCaseNumA/cast(CheckedCaseNumA as float) where CheckedCaseNumA != 0
exec(@sql)

--insert AvgScoreA
set @sql = @init_p + '
update #t
set AvgScoreA = a.num
from (
	select 
		c.'+@groupbycol+',
		avg(score) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	'+@wherepre1+'
	group by c.'+@groupbycol+'
) a
join #t b on b.id = a.'+@groupbycol+'
'
exec(@sql)

--insert LV1A
set @sql = @init_p + '
update #t
set LV1A = a.num
from (
	select 
		c.'+@groupbycol+',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	'+@wherepre1+' and g.levelid=1
	group by c.'+@groupbycol+'
) a
join #t b on b.id = a.'+@groupbycol+'

update #t set LV1ARate = dbo.GetQuotientFrom2Int(LV1A,CheckedCaseNumA) where CheckedCaseNumA != 0
'
--update #t set LV1ARate = LV1A/cast(CheckedCaseNumA as float) where CheckedCaseNumA != 0
exec(@sql)

--insert LV2A
set @sql = @init_p + '
update #t
set LV2A = a.num
from (
	select 
		c.'+@groupbycol+',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	'+@wherepre1+' and g.levelid=2
	group by c.'+@groupbycol+'
) a
join #t b on b.id = a.'+@groupbycol+'

update #t set LV2ARate = dbo.GetQuotientFrom2Int(LV2A,CheckedCaseNumA) where CheckedCaseNumA != 0
'
--update #t set LV2ARate = LV2A/cast(CheckedCaseNumA as float) where CheckedCaseNumA != 0
exec(@sql)


--insert LV3A
set @sql = @init_p + '
update #t
set LV3A = a.num
from (
	select 
		c.'+@groupbycol+',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	'+@wherepre1+' and g.levelid=3
	group by c.'+@groupbycol+'
) a
join #t b on b.id = a.'+@groupbycol+'

update #t set LV3ARate = dbo.GetQuotientFrom2Int(LV3A,CheckedCaseNumA) where CheckedCaseNumA != 0
'
--update #t set LV3ARate = LV3A/cast(CheckedCaseNumA as float) where CheckedCaseNumA != 0
exec(@sql)

--insert VetoA
set @sql = @init_p + '
update #t
set VetoA = a.num
from (
	select 
		c.'+@groupbycol+',
		count(*) as num
	from graderesult g
	left join caseinfo c on g.caseinfoid=c.caseinfoid
	'+@wherepre1+' and dbo.IsVetoGradeResult(graderesultid,@sid)=1
	group by c.'+@groupbycol+'
) a
join #t b on b.id = a.'+@groupbycol+'

update #t set VetoARate = dbo.GetQuotientFrom2Int(VetoA,CheckedCaseNumA) where CheckedCaseNumA != 0
'
--update #t set VetoARate = VetoA/cast(CheckedCaseNumA as float) where CheckedCaseNumA != 0
exec(@sql)


--insert SentReqA
set @sql = @init_p + '
update #t
set SentReqA = a.num
from (
	SELECT 
		DISTINCT
		c.'+@groupbycol+',
		COUNT(DISTINCT r.RequisitionID) AS num
	FROM RequisitionBugItem rbi
    INNER JOIN Requisition r ON rbi.RequisitionID=r.RequisitionID
    INNER JOIN GradeResultDetail gr ON rbi.GradeResultDetailID=gr.GradeResultDetailID
    INNER JOIN GradeResult g ON g.GradeResultID=gr.ResultID
    INNER JOIN CaseInfo c ON g.CaseInfoID=c.CaseInfoID
	'+@wherepre1+' and r.IsSent=1
	GROUP BY c.'+@groupbycol+'
) a
join #t b on b.id = a.'+@groupbycol+'
'
exec(@sql)



--insert RepairedA
set @sql = @init_p + '
update #t
set RepairedA = a.num
from (
	select 
		c.'+@groupbycol+',
		count(*) as num
	from graderesult g
	left join caseinfo c on g.caseinfoid=c.caseinfoid
	'+@wherepre1+' and g.isreworked=1
	group by c.'+@groupbycol+'
) a
join #t b on b.id = a.'+@groupbycol+'

update #t set RepairedRateA=dbo.GetQuotientFrom2Int(RepairedA,SentReqA) where SentReqA != 0
'
--update #t set RepairedRateA=RepairedA/cast(SentReqA as float) where SentReqA != 0
exec(@sql)

------------------------------------------------------------------------------------------
------------B
declare @wherepreB varchar(1024)
set @wherepreB = '
	where
		( datediff(day,@s,OutHospitalDate)>=0 or @s is null ) and
		( datediff(day,@e,OutHospitalDate)<=0 or @e is null ) and
        ( datediff(day,@cs,OutHospitalDate)>=0 or @cs is null ) and
        ( datediff(day,@ce,OutHospitalDate)<=0 or @ce is null )
'

--insert OutHospCaseNumB
set @sql = @init_p + '
update #t
set OutHCaseNumB = a.num
from (
	select 
		c.'+@groupbycol+',
		count(*) as num 
	from caseinfo c
    left join GradeResult g on c.caseinfoid=g.caseinfoid
	'+@wherepreB+'
	group by c.'+@groupbycol+'
) a
join #t b on b.id=a.'+@groupbycol+'
'
exec(@sql)


--insert CheckedCaseNumB
set @sql = @init_p + '
update #t
set CheckedCaseNumB = a.num
from (
	select 
		c.'+@groupbycol+',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	'+@wherepreB+'
	group by c.'+@groupbycol+'
) a
join #t b on b.id=a.'+@groupbycol+'

update #t set CheckedRateB=dbo.GetQuotientFrom2Int(CheckedCaseNumB,OutHCaseNumB) where OutHCaseNumB != 0
'
--update #t set CheckedRateB=CheckedCaseNumB/cast(OutHCaseNumB as float) where OutHCaseNumB != 0
exec(@sql)



--insert PassedCaseNumB
set @sql = @init_p + '
update #t
set PassedCaseNumB = a.num
from (
	select 
		c.'+@groupbycol+',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	'+@wherepreB+' and g.levelid <= 2
	group by c.'+@groupbycol+'
) a
join #t b on b.id = a.'+@groupbycol+'

update #t set PassedRateB=dbo.GetQuotientFrom2Int(PassedCaseNumB,CheckedCaseNumB) where CheckedCaseNumB != 0
'
--update #t set PassedRateB=PassedCaseNumB/cast(CheckedCaseNumB as float) where CheckedCaseNumB != 0
exec(@sql)

--insert AvgScoreB
set @sql = @init_p + '
update #t
set AvgScoreB = a.num
from (
	select 
		c.'+@groupbycol+',
		avg(score) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	'+@wherepreB+'
	group by c.'+@groupbycol+'
) a
join #t b on b.id = a.'+@groupbycol+'
'
exec(@sql)

--insert LV1B
set @sql = @init_p + '
update #t
set LV1B = a.num
from (
	select 
		c.'+@groupbycol+',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	'+@wherepreB+' and g.levelid=1
	group by c.'+@groupbycol+'
) a
join #t b on b.id = a.'+@groupbycol+'

update #t set LV1BRate = dbo.GetQuotientFrom2Int(LV1B,CheckedCaseNumB) where CheckedCaseNumB != 0
'
--update #t set LV1BRate = LV1B/cast(CheckedCaseNumB as float) where CheckedCaseNumB != 0
exec(@sql)

--insert LV2B
set @sql = @init_p + '
update #t
set LV2B = a.num
from (
	select 
		c.'+@groupbycol+',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	'+@wherepreB+' and g.levelid=2
	group by c.'+@groupbycol+'
) a
join #t b on b.id = a.'+@groupbycol+'

update #t set LV2BRate = dbo.GetQuotientFrom2Int(LV2B,CheckedCaseNumB) where CheckedCaseNumB != 0
'
--update #t set LV2BRate = LV2B/cast(CheckedCaseNumB as float) where CheckedCaseNumB != 0
exec(@sql)



--insert LV3B
set @sql = @init_p + '
update #t
set LV3B = a.num
from (
	select 
		c.'+@groupbycol+',
		count(*) as num
	from GradeResult g
	left join caseinfo c on c.caseinfoid = g.caseinfoid
	'+@wherepreB+' and g.levelid=3
	group by c.'+@groupbycol+'
) a
join #t b on b.id = a.'+@groupbycol+'

update #t set LV3BRate = dbo.GetQuotientFrom2Int(LV3B,CheckedCaseNumB) where CheckedCaseNumB != 0
'
--update #t set LV3BRate = LV3B/cast(CheckedCaseNumB as float) where CheckedCaseNumB != 0
exec(@sql)



--insert VetoB
set @sql = @init_p + '
update #t
set VetoB = a.num
from (
	select 
		c.'+@groupbycol+',
		count(*) as num
	from graderesult g
	left join caseinfo c on g.caseinfoid=c.caseinfoid
	'+@wherepreB+' and dbo.IsVetoGradeResult(graderesultid,@sid)=1
	group by c.'+@groupbycol+'
) a
join #t b on b.id = a.'+@groupbycol+'

update #t set VetoBRate = dbo.GetQuotientFrom2Int(VetoB,CheckedCaseNumB) where CheckedCaseNumB != 0
'
--update #t set VetoBRate = VetoB/cast(CheckedCaseNumB as float) where CheckedCaseNumB != 0
exec(@sql)



--insert SentReqB
set @sql = @init_p + '
update #t
set SentReqB = a.num
from (
	select 
	    DISTINCT
		c.'+@groupbycol+',
		count(DISTINCT r.RequisitionID) as num
	FROM RequisitionBugItem rbi
    INNER JOIN Requisition r ON rbi.RequisitionID=r.RequisitionID
    INNER JOIN GradeResultDetail gr ON rbi.GradeResultDetailID=gr.GradeResultDetailID
    INNER JOIN GradeResult g ON g.GradeResultID=gr.ResultID
    INNER JOIN CaseInfo c ON g.CaseInfoID=c.CaseInfoID
	'+@wherepreB+' and r.issent=1
	group by c.'+@groupbycol+'
) a
join #t b on b.id = a.'+@groupbycol+'
'
exec(@sql)

--insert RepairedB
set @sql = @init_p + '
update #t
set RepairedB = a.num
from (
	select 
		c.'+@groupbycol+',
		count(*) as num
	from graderesult g
	left join caseinfo c on g.caseinfoid=c.caseinfoid
	'+@wherepreB+' and g.isreworked=1
	group by c.'+@groupbycol+'
) a
join #t b on b.id = a.'+@groupbycol+'

update #t set RepairedRateB=dbo.GetQuotientFrom2Int(RepairedB,SentReqB) where SentReqB != 0
'
--update #t set RepairedRateB=RepairedB/cast(SentReqB as float) where SentReqB != 0
exec(@sql)

--retrive table
select * from #t

--clear temp table
drop table #t
drop table #p



---------------------------------------------------------------------------------
END
