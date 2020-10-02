--22. Создать хранимую процедуру СкриптЗаполненияТаблицы для генерации скпиптов insert-запросов содержимого таблицы, переданной в параметре.
/*Результат:
INSERT INTO Сотрудники(id ,Фамилия ,Имя ,Отчество ,Дата_рождения ,Паспорт ,Дата_найма ,Дата_увольнения ,Должность ,Группа ) VALUES('1','Мясников','Всеволод','Алексеевич','1987-01-02','6161 864808','2011-05-03',NULL,'4','4')
INSERT INTO Сотрудники(id ,Фамилия ,Имя ,Отчество ,Дата_рождения ,Паспорт ,Дата_найма ,Дата_увольнения ,Должность ,Группа ) VALUES('2','Беляев','Ярослав','Павлович','1990-01-02','8064 257116','2011-02-15',NULL,'6','2')
INSERT INTO Сотрудники(id ,Фамилия ,Имя ,Отчество ,Дата_рождения ,Паспорт ,Дата_найма ,Дата_увольнения ,Должность ,Группа ) VALUES('3','Степанов','Константин','Борисович','1981-02-05','9983 189856','2014-12-20',NULL,'1','2')
*/
drop procedure СкриптЗаполненияТаблицы
go
create procedure СкриптЗаполненияТаблицы
	@ИмяТаблицы varchar (30)
	as


--procedure
declare @AnsVarTable varchar(1024)=NULL
declare @AnsQuerTable varchar(1024)=NULL
select  @AnsVarTable=isnull(@AnsVarTable+', '+name,name),
		@AnsQuerTable=isnull(@AnsQuerTable+'+'''''', '''''' +isnull(convert(varchar(128),'+name+'),''NULL'')','''''''''+isnull(convert(varchar(128),'+name+'),''NULL'')')
from sys.columns 
where object_id=object_id(@ИмяТаблицы)
drop table ##Temp
exec
(
	'select '+@AnsQuerTable+'as Запрос into ##Temp from '+@ИмяТаблицы
)
select 'insert into ' + @ИмяТаблицы + ' ('+@AnsVarTable+') values('+##Temp.Запрос+')' as Запрос from ##Temp
go
exec СкриптЗаполненияТаблицы Должности
go
