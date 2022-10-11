CREATE DATABASE Domashno
GO
USE Domashno
GO
CREATE TABLE Speciality 
(
[Id] INT PRIMARY KEY IDENTITY,
[Names] VARCHAR(16) NOT NULL UNIQUE,
[Description] NVARCHAR(1024),
[GraduatesTitle] VARCHAR(32) NOT NULL UNIQUE,
[StartGrade] INT CONSTRAINT startGrade CHECK (StartGrade BETWEEN 1 AND 12) NOT NULL,
[EndGrade] INT CONSTRAINT endGrade CHECK (EndGrade BETWEEN 1 AND 12) NOT NULL,
)
GO
CREATE TABLE Classes(
[Id] INT PRIMARY KEY IDENTITY,
[Grade] INT CONSTRAINT Grade CHECK (Grade BETWEEN 1 and 12) NOT NULL,
[GradeLetter] VARCHAR(1),
CONSTRAINT letter CHECK (GradeLetter='A' OR GradeLetter='B' OR GradeLetter='C' OR GradeLetter='D'),
[SpecialityID] INT
FOREIGN KEY REFERENCES Speciality(Id) 
)
GO
CREATE TABLE Teachers (
[Id] INT PRIMARY KEY IDENTITY,                                     
[FirstName] VARCHAR(16) NOT NULL,
[LastName] VARCHAR(16) NOT NULL,
[Gender] BIT,
[Email] VARCHAR(32) NOT NULL UNIQUE,
[Subjects] VARCHAR(64) NOT NULL,
[ManagedClassID] INT
FOREIGN KEY REFERENCES Classes(Id)
)
GO
CREATE TABLE Students 
(
[Id] INT PRIMARY KEY IDENTITY,
[FirstName] VARCHAR(16) NOT NULL,
[SurName] VARCHAR(16),
[LastName] VARCHAR(16) NOT NULL,
[GSM] VARCHAR(16) NOT NULL,
[Email] NVARCHAR(32) NOT NULL UNIQUE,
[Addresses] NVARCHAR(64) NOT NULL,
[Age] INT CONSTRAINT Age_range CHECK (Age BETWEEN 8 AND 20) NOT NULL,
[Gender] BIT NOT NULL,
[ClassID] INT 
FOREIGN KEY REFERENCES Teachers(Id)
)

INSERT INTO Speciality (Names, Description, GraduatesTitle, StartGrade, EndGrade) VALUES
('Application programmer', 'A specialty that develops applied programming','Application programmer', 1, 6),
( 'computer engineering and technology', 'develops computer repair work', 'computer technology', 1, 6 ),
( 'car parts', 'improves car repair work', 'car parts', 1, 6)

INSERT INTO Classes (Grade, GradeLetter, SpecialityId) VALUES
(10, 'A', 1),
(9, 'B', 2),
(9, 'C' 3)

INSERT INTO Teachers (FirstName, LastName, Gender, Email, Subjects, ManagedClassID) VALUES
('Rosa', 'Tejada', 0, 'kmself@optonline.net', 'ART'),
('Abram', 'Bakula', 1, 'uncle@outlook.com', 'biology'),
('Sofia','Zubia', 0, 'dgatwood@aol.com', 'physical education') 

INSERT INTO Students (FirstName, Surname, LastName, GSM, Email, Addresses, Age, Gender, ClassID) VALUES
('Kosta','Ivanov','Mladenov', +35926813826, 'kostakirkata44@gmial.com', '657 Miller Overpass', 13, 1),
('Malinka', 'Mladenova', 'Ivanova', +35920217405, 'mali66@gmial.com', '39771 Imelda Parkway', 14, 0),
('Kamelia','Amelieva', 'Preslavova', +35927207385, 'smeier@sbcglobal.net', '67276 Vinnie Ports', 9, 0),
('Marin', 'Nedelchev', 'Goleminov',+35923471089, 'gfxguy@yahoo.com', '261 Magnus Corner', 15, 1),
('Sambo','Viktor','Dontworry',+35920626012, 'paina@live.com', '1958 Buck Drive',16, 1),
('John', 'Bob', 'Marley', +35925701864, 'ozawa@yahoo.ca', '9353 Barrows Hills',18, 1),
('Jessica', 'Jehna', 'Jahmeson', +35926607728, 'smeier@sbcglobal.net', '4245 Millie Forest', 14, 0),
('Tsvetanka', 'Penko', 'Vantchev', +35925701864, 'research@hotmail.com', '308 Carson Squares', 16, 0),
('Sasho', 'Daniel', 'Yankov', +35924884237, 'jrifkin@verizon.net', '42489 Wunsch Drive', 17, 1),
('Slavko', 'Anastasiya', 'Konstantinov',+35927786321,'haddawy@gmail.com', '448 Shannon Port', 19, 1) 

SELECT * FROM Students
SELECT * FROM Teachers
SELECT * FROM Classes
SELECT * FROM Speciality



