-- 6-ЗЕРТХАНАЛЫҚ. SELECT + INNER JOIN (апай сұраған қосымша тапсырма)
-- Әуелі 01_CinemaLab6_Create_Insert.sql файлын ОРЫНДАУ керек.
-- Осы файлды F5 арқылы бірнеше рет орындауға болады.
-- JOIN: екі кестедегі ID мәндері сәйкес жолдарды біріктіреді.
USE CinemaLab6_Join;
GO

-- 1. Кестедегі БАРЛЫҚ жазба
SELECT * FROM Kinolar;

-- 2. Тек екі баған
SELECT atauy, zhanr FROM Kinolar;

-- 3. Бағасы 2500 теңгеден жоғары сеанстар
SELECT * FROM Seans WHERE bagasy > 2500;

-- 4. INNER JOIN: фильм + сеанс
-- Seans.kino_id -> Kinolar.kino_id
SELECT Kinolar.atauy, Seans.kuni, Seans.bastalu, Seans.bagasy
FROM Seans
INNER JOIN Kinolar ON Seans.kino_id = Kinolar.kino_id;

-- 5. INNER JOIN: көрермен + брондау
SELECT Korermender.aty, Bron.oryn_no, Bron.tolem_turi
FROM Bron
INNER JOIN Korermender ON Bron.korermen_id = Korermender.korermen_id;

-- 6. ҮШ БАЙЛАНЫС: көрермен + брондау + сеанс + фильм
SELECT Korermender.aty, Kinolar.atauy, Bron.oryn_no
FROM Bron
INNER JOIN Korermender ON Bron.korermen_id = Korermender.korermen_id
INNER JOIN Seans ON Bron.seans_id = Seans.seans_id
INNER JOIN Kinolar ON Seans.kino_id = Kinolar.kino_id;

-- 7. ТОПТЫҚ БРОНДАУ: топтың мүшелері мен орындары
SELECT TopBron.top_atauy, Korermender.aty, Bron.oryn_no
FROM Bron
INNER JOIN TopBron ON Bron.top_id = TopBron.top_id
INNER JOIN Korermender ON Bron.korermen_id = Korermender.korermen_id;

-- 8. ТАҒАМҒА ТАПСЫРЫС: кім қандай тағам алған
SELECT Korermender.aty, TagamTapsyrys.tagam_atauy,
       TagamTapsyrys.sany, TagamTapsyrys.bagasy
FROM TagamTapsyrys
INNER JOIN Bron ON TagamTapsyrys.bron_id = Bron.bron_id
INNER JOIN Korermender ON Bron.korermen_id = Korermender.korermen_id;

-- 9. Тек ТӨЛЕНГЕН ОНЛАЙН брондаулар
SELECT Korermender.aty, Bron.oryn_no, Bron.tolem_turi
FROM Bron
INNER JOIN Korermender ON Bron.korermen_id = Korermender.korermen_id
WHERE Bron.tolem_turi = N'online' AND Bron.tolendi = 1;

-- 10. Тағамның жалпы сомасын қарапайым көбейту арқылы шығару
SELECT tagam_atauy, sany, bagasy, sany * bagasy AS jalpy_soma
FROM TagamTapsyrys;
