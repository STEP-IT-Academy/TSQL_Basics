drop procedure �����������������

create procedure �����������������(
@���������� date,
@������������� date,
@��������� varchar(30))
as
select v.�������������,v.�����������������,v.������,
	isnull((
		select sum(v1.��������)
		from �������������������� v1
		where v1.����<@���������� and v1.�������������=v.�������������
	),0) ������������������,
	isnull((
		select sum(v1.��������)
		from �������������������� v1
		where v1.���� between @���������� and @������������� and v1.�������������=v.�������������
	),0) �����������������,
	isnull((
		select sum(v1.��������)
		from �������������������� v1
		where v1.����>@������������� and v1.�������������=v.�������������
	),0) ���������������������	
from ���������� s
join �������������������� v on v.�������������=s.id and (v.������=@��������� or @���������='%')
group by v.�������������,v.�����������������,v.������
order by �������������
GO

select * 
from ����������

exec ����������������� '2009-09-14', '2014-10-01', 1