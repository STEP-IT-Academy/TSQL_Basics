--22. ������� �������� ��������� ����������������������� ��� ��������� �������� insert-�������� ����������� �������, ���������� � ���������.
/*���������:
INSERT INTO ����������(id ,������� ,��� ,�������� ,����_�������� ,������� ,����_����� ,����_���������� ,��������� ,������ ) VALUES('1','��������','��������','����������','1987-01-02','6161 864808','2011-05-03',NULL,'4','4')
INSERT INTO ����������(id ,������� ,��� ,�������� ,����_�������� ,������� ,����_����� ,����_���������� ,��������� ,������ ) VALUES('2','������','�������','��������','1990-01-02','8064 257116','2011-02-15',NULL,'6','2')
INSERT INTO ����������(id ,������� ,��� ,�������� ,����_�������� ,������� ,����_����� ,����_���������� ,��������� ,������ ) VALUES('3','��������','����������','���������','1981-02-05','9983 189856','2014-12-20',NULL,'1','2')
*/
drop procedure �����������������������
go
create procedure �����������������������
	@���������� varchar (30)
	as


--procedure
declare @AnsVarTable varchar(1024)=NULL
declare @AnsQuerTable varchar(1024)=NULL
select  @AnsVarTable=isnull(@AnsVarTable+', '+name,name),
		@AnsQuerTable=isnull(@AnsQuerTable+'+'''''', '''''' +isnull(convert(varchar(128),'+name+'),''NULL'')','''''''''+isnull(convert(varchar(128),'+name+'),''NULL'')')
from sys.columns 
where object_id=object_id(@����������)
drop table ##Temp
exec
(
	'select '+@AnsQuerTable+'as ������ into ##Temp from '+@����������
)
select 'insert into ' + @���������� + ' ('+@AnsVarTable+') values('+##Temp.������+')' as ������ from ##Temp
go
exec ����������������������� ���������
go
