-- Входные данные: расположение, категория, сервисы(Несколько)
-- Выходные данные: название объекта, категория, юр.адрес, телефон, сайт, стоимость услуги
use RecreationResources
go

CREATE PROCEDURE GetSerivces
@Местоположение int,
@Категория int,
@str varchar(20)
as
DECLARE @SQL varchar(8000)
select ro.name наименование, c.name Категория, r.address ЮридическийАдрес, r.phoneNumber Телефон, ro.website Сайт, s.id id_Сервиса, s.name Сервис, os.minCost МинимальнаяСтоимость, os.currency Валюта into #TmpTable
from RecreationalObjects ro
left join Requisites r on r.id = ro.requisite_id 
left join ObjectServices os on os.recreationalObject_id = ro.id
left join Services s on s.id = os.services_id
left join Categories c on c.id = ro.category_id
left join Locations l on ro.location_id = l.id
left join Regions reg on l.region_id = reg.id 
left join Areas a on reg.areas_id = a.id
where a.id = @Местоположение and c.id = @Категория
group by ro.name, c.name, r.address, r.phoneNumber, ro.website, a.name, reg.name, s.id,s.name, os.minCost, os.currency
SET @SQL = 'select Наименование, Категория, ЮридическийАдрес, Телефон, Сайт, Сервис, МинимальнаяСтоимость, Валюта from #TmpTable where id_Сервиса in ('+@str+')'
EXEC(@sql)

exec GetSerivces 2,1,'2,3,4,5'

drop procedure GetSerivces
