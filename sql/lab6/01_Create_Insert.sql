-- 1) ЖАҢА ДЕРЕКҚОР
CREATE DATABASE CinemaLab6_Join;
GO
USE CinemaLab6_Join;
GO

-- 2) НЕГІЗГІ 6 КЕСТЕ
-- Фильмдер
CREATE TABLE Kinolar (
    kino_id INT PRIMARY KEY,
    atauy NVARCHAR(100) NOT NULL,
    zhanr NVARCHAR(50) NOT NULL
);

-- Көрермендер
CREATE TABLE Korermender (
    korermen_id INT PRIMARY KEY,
    aty NVARCHAR(100) NOT NULL,
    telefon VARCHAR(20) UNIQUE
);

-- Сеанстар. kino_id фильммен байланысты.
CREATE TABLE Seans (
    seans_id INT PRIMARY KEY,
    kino_id INT NOT NULL,
    kuni DATE NOT NULL,
    bastalu TIME NOT NULL,
    bagasy INT NOT NULL CHECK (bagasy > 0),
    FOREIGN KEY (kino_id) REFERENCES Kinolar(kino_id)
);

-- Топтық брондау. Ұйымдастырушы көрерменге сілтейді.
CREATE TABLE TopBron (
    top_id INT PRIMARY KEY,
    top_atauy NVARCHAR(100) NOT NULL,
    uyymdastyruwshy_id INT NOT NULL,
    FOREIGN KEY (uyymdastyruwshy_id) REFERENCES Korermender(korermen_id)
);

-- Брондау. Көрермен, сеанс және қажет болса топпен байланысты.
CREATE TABLE Bron (
    bron_id INT PRIMARY KEY,
    korermen_id INT NOT NULL,
    seans_id INT NOT NULL,
    top_id INT NULL,
    oryn_no INT NOT NULL CHECK (oryn_no > 0),
    tolem_turi NVARCHAR(20) NOT NULL,
    tolendi BIT NOT NULL,
    FOREIGN KEY (korermen_id) REFERENCES Korermender(korermen_id),
    FOREIGN KEY (seans_id) REFERENCES Seans(seans_id),
    FOREIGN KEY (top_id) REFERENCES TopBron(top_id),
    UNIQUE (seans_id, oryn_no)
);

-- Тағам тапсырысы. Әр тапсырыс брондауға байланады.
CREATE TABLE TagamTapsyrys (
    tapsyrys_id INT PRIMARY KEY,
    bron_id INT NOT NULL,
    tagam_atauy NVARCHAR(100) NOT NULL,
    sany INT NOT NULL CHECK (sany > 0),
    bagasy INT NOT NULL CHECK (bagasy > 0),
    FOREIGN KEY (bron_id) REFERENCES Bron(bron_id)
);
GO

-- 3) INSERT - ӘР КЕСТЕГЕ ҮЛГІ ДЕРЕК ЕНГІЗУ
INSERT INTO Kinolar (kino_id, atauy, zhanr) VALUES
(1, N'Интерстеллар', N'Фантастика'),
(2, N'Аватар', N'Фантастика'),
(3, N'Жусан иісі', N'Драма'),
(4, N'Дюна', N'Фантастика');

INSERT INTO Korermender (korermen_id, aty, telefon) VALUES
(1, N'Аружан', '87010000001'),
(2, N'Данияр', '87010000002'),
(3, N'Мадина', '87010000003'),
(4, N'Аян', '87010000004');

INSERT INTO Seans (seans_id, kino_id, kuni, bastalu, bagasy) VALUES
(1, 1, '2026-10-21', '14:00', 2500),
(2, 2, '2026-10-21', '18:00', 3000),
(3, 3, '2026-10-22', '16:00', 2800),
(4, 4, '2026-10-22', '19:00', 2700);

INSERT INTO TopBron (top_id, top_atauy, uyymdastyruwshy_id) VALUES
(1, N'Достар тобы', 1);

INSERT INTO Bron (bron_id, korermen_id, seans_id, top_id, oryn_no, tolem_turi, tolendi) VALUES
(1, 1, 1, 1, 5, N'online', 1),
(2, 2, 1, 1, 6, N'online', 1),
(3, 3, 2, NULL, 7, N'kassa', 0),
(4, 4, 4, NULL, 3, N'online', 1),
(5, 3, 3, NULL, 4, N'kassa', 1);

INSERT INTO TagamTapsyrys (tapsyrys_id, bron_id, tagam_atauy, sany, bagasy) VALUES
(1, 1, N'Попкорн', 2, 1200),
(2, 2, N'Кола', 1, 800),
(3, 4, N'Начос', 1, 1500);
GO

-- 4) ТЕКСЕРУ: БАРЛЫҚ КЕСТЕНІҢ МӘЛІМЕТТЕРІ
SELECT * FROM Kinolar;
SELECT * FROM Korermender;
SELECT * FROM Seans;
SELECT * FROM TopBron;
SELECT * FROM Bron;
SELECT * FROM TagamTapsyrys;
