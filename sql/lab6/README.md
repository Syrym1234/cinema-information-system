# 6-зертханалық жұмыс — кинотеатр дерекқоры (SQL Server)

**Жоба:** №12 «Кинотеатрдың ақпараттық жүйесі».

Бұл жұмыс 5-зертханалық жұмыстағы GitHub репозиторийін және 1–4-зертханалық жұмыстардағы кинотеатр жобасын жалғастырады. SQL Server үшін қарапайым 6 кесте құрылды: `Kinolar`, `Seans`, `Korermender`, `TopBron`, `Bron`, `TagamTapsyrys`.

## Файлдар және орындау реті

1. [`01_Create_Insert.sql`](01_Create_Insert.sql) — `CinemaLab6_Join` дерекқорын, алты кестені және үлгі деректерді құрады; **тек бір рет** орындаңыз. Бұрын осы аттас база жасалса, `CREATE DATABASE` қате беруі мүмкін. Дерекқорды бірден өшірмеңіз.
2. [`02_SELECT_JOIN.sql`](02_SELECT_JOIN.sql) — он `SELECT`, `WHERE`, `INNER JOIN` мысалы; бірнеше рет орындауға болады.
3. [`03_UPDATE_DELETE.sql`](03_UPDATE_DELETE.sql) — 99-нөмірлі тест фильмін `INSERT`, `UPDATE`, `DELETE` арқылы көрсетеді.
4. [ER-диаграмма](ER_diagram.png) — кестелер арасындағы байланыс сызбасы.
5. [Word есеп](../../docs/lab6/Lab6_Kinoteatr_esep.docx) — зертханалық жұмыстың түсіндірме есебі.

## Кестелер арасындағы байланыстар

- `Seans.kino_id → Kinolar.kino_id` — әр сеанс белгілі фильмге тиесілі.
- `TopBron.uyymdastyruwshy_id → Korermender.korermen_id` — топ ұйымдастырушысы.
- `Bron.korermen_id → Korermender.korermen_id` — брон жасаған көрермен.
- `Bron.seans_id → Seans.seans_id` — брондалған сеанс.
- `Bron.top_id → TopBron.top_id` — топтық брон (міндетті емес).
- `TagamTapsyrys.bron_id → Bron.bron_id` — алдын ала тағам тапсырысы.

Кестелерде `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`, `CHECK` қолданылады. Қарапайым SQL сақталған: `IF`, процедура, триггер жоқ.

## Мысал: фильм және сеанс

```sql
SELECT Kinolar.atauy, Seans.kuni, Seans.bagasy
FROM Seans
INNER JOIN Kinolar ON Seans.kino_id = Kinolar.kino_id;
```

`INNER JOIN` екі кестені ортақ `kino_id` өрісі бойынша біріктіреді. Мұғалімге нәтижесін SSMS-тің **Results** бөлімінен көрсетуге болады.

## Ескерту

GitHub дерекқор серверінің орнына жұмыс істемейді: бұл репозиторий SQL кодын, диаграмманы және есепті сақтайды. SQL файлдарының орындалуы SSMS-та тексеріледі.
