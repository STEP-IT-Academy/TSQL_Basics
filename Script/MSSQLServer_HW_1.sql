DROP PROCEDURE СписокРаботниковСупервайзера
GO

CREATE PROCEDURE СписокРаботниковСупервайзера
@датаНачалаПериода datetime = '',
@датаОкончанияПериода datetime = '',
@фамилияСупера varchar(60) = ''
as
DECLARE @SQL varchar(8000)
select с.id, с.Фамилия, count(з.Сотрудник) Колво_Звонков into #res
from Сотрудники с
left join Звонки з on с.id = з.Сотрудник
left join Группы г on с.Группа = г.id
left join Сотрудники сс on сс.id = г.Супервайзер
where dbo.sf_getOnlyDate(з.Дата_Время) between dbo.sf_getOnlyDate(@датаНачалаПериода) and dbo.sf_getOnlyDate(@датаОкончанияПериода) and сс.Фамилия like '%' + @фамилияСупера + '%'
group by с.id, с.Фамилия
SET @SQL = 'select * from #res'
BEGIN TRY 
exec(@SQL)
END TRY  
BEGIN CATCH  
    RAISERROR ('Ошибка !', 1, 1)
	select * from #res
END CATCH 