DROP PROCEDURE ����������������������������
GO

CREATE PROCEDURE ����������������������������
@����������������� datetime = '',
@�������������������� datetime = '',
@������������� varchar(60) = ''
as
DECLARE @SQL varchar(8000)
select �.id, �.�������, count(�.���������) �����_������� into #res
from ���������� �
left join ������ � on �.id = �.���������
left join ������ � on �.������ = �.id
left join ���������� �� on ��.id = �.�����������
where dbo.sf_getOnlyDate(�.����_�����) between dbo.sf_getOnlyDate(@�����������������) and dbo.sf_getOnlyDate(@��������������������) and ��.������� like '%' + @������������� + '%'
group by �.id, �.�������
SET @SQL = 'select * from #res'
BEGIN TRY 
exec(@SQL)
END TRY  
BEGIN CATCH  
    RAISERROR ('������ !', 1, 1)
	select * from #res
END CATCH 