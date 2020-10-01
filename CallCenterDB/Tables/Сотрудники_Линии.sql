CREATE TABLE [dbo].[Сотрудники_Линии]
(
	Сотрудник INT FOREIGN KEY REFERENCES Сотрудники(id),
	Линия INT FOREIGN KEY REFERENCES Линии(id)
	CONSTRAINT PK PRIMARY KEY(Сотрудник, Линия)
)
