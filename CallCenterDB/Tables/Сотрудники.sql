CREATE TABLE [dbo].[Сотрудники]
(
	id INT PRIMARY KEY IDENTITY,
	Фамилия NVARCHAR(30) NOT NULL,
	Имя NVARCHAR(30) NOT NULL,
	Отчество NVARCHAR(30) NULL,
	Дата_рождения DATE NOT NULL,
	Паспорт NVARCHAR(15) NOT NULL,
	Дата_найма DATE NOT NULL,
	Дата_увольнения DATE NULL,
	Должность INT NOT NULL FOREIGN KEY REFERENCES Должности(id),
	Группа INT FOREIGN KEY REFERENCES Группы(id)
)