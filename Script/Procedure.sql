-- ������� ������: ������������, ���������, �������(���������)
-- �������� ������: �������� �������, ���������, ��.�����, �������, ����, ��������� ������
use RecreationResources
go

CREATE PROCEDURE GetSerivces
@�������������� int,
@��������� int,
@str varchar(20)
as
DECLARE @SQL varchar(8000)
select ro.name ������������, c.name ���������, r.address ����������������, r.phoneNumber �������, ro.website ����, s.id id_�������, s.name ������, os.minCost ��������������������, os.currency ������ into #TmpTable
from RecreationalObjects ro
left join Requisites r on r.id = ro.requisite_id 
left join ObjectServices os on os.recreationalObject_id = ro.id
left join Services s on s.id = os.services_id
left join Categories c on c.id = ro.category_id
left join Locations l on ro.location_id = l.id
left join Regions reg on l.region_id = reg.id 
left join Areas a on reg.areas_id = a.id
where a.id = @�������������� and c.id = @���������
group by ro.name, c.name, r.address, r.phoneNumber, ro.website, a.name, reg.name, s.id,s.name, os.minCost, os.currency
SET @SQL = 'select ������������, ���������, ����������������, �������, ����, ������, ��������������������, ������ from #TmpTable where id_������� in ('+@str+')'
EXEC(@sql)

exec GetSerivces 2,1,'2,3,4,5'

drop procedure GetSerivces
