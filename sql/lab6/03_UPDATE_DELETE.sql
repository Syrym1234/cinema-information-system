-- 6-ЗЕРТХАНАЛЫҚ. INSERT, UPDATE, DELETE тәжірибесі
-- Алдымен 01_CinemaLab6_Create_Insert.sql орындаңыз.
-- 99-нөмірлі ТЕСТ фильм қана қосылып, өзгертіліп, соңында өшіріледі.
-- Басқа фильмдер өзгермейді. Бұл файлды қайталап орындауға болады.
USE CinemaLab6_Join;
GO

-- 1. INSERT - тест фильмді қосу
INSERT INTO Kinolar (kino_id, atauy, zhanr)
VALUES (99, N'Тест фильмі', N'Драма');
SELECT * FROM Kinolar WHERE kino_id = 99;

-- 2. UPDATE - тек осы фильмнің жанрын өзгерту
UPDATE Kinolar
SET zhanr = N'Комедия'
WHERE kino_id = 99;
SELECT * FROM Kinolar WHERE kino_id = 99;

-- 3. DELETE - тек тест фильмді өшіру
DELETE FROM Kinolar
WHERE kino_id = 99;
SELECT * FROM Kinolar WHERE kino_id = 99;
SELECT * FROM Kinolar;
