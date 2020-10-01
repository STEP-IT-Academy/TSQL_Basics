CREATE TABLE [dbo].[Звонки]
(
	Дата_Время DATETIME PRIMARY KEY,
	Линия INT NOT NULL FOREIGN KEY REFERENCES Линии(id),
	Время_ответа TIME(0) NOT NULL DEFAULT '00:00:00',
	Сотрудник INT NULL FOREIGN KEY REFERENCES Сотрудники(id),
	Время_разговора TIME(0) NOT NULL DEFAULT '00:00:00',
	Время_удержания TIME(0) NOT NULL DEFAULT '00:00:00'
)
