DROP SCHEMA IF EXISTS NHL CASCADE;
CREATE SCHEMA NHL;

SET SEARCH_PATH = NHL;

-- Создание таблиц

-- Создаем таблицы для продуктов онлайн школы
DROP TABLE IF EXISTS club CASCADE;
CREATE TABLE club
(
    Club_id    serial PRIMARY KEY,
    Name_nm    VARCHAR(50),
    Coach_id   INTEGER,
    Stadium_id INTEGER
);

DROP TABLE IF EXISTS division CASCADE;
CREATE TABLE division
(
    Division_id INTEGER,
    club_id     INTEGER
);

DROP TABLE IF EXISTS line CASCADE;
CREATE TABLE line
(
    Line_id     serial PRIMARY KEY,
    Striker1_id INTEGER,
    Striker2_id INTEGER,
    Striker3_id INTEGER
);

DROP TABLE IF EXISTS player CASCADE;
CREATE TABLE player
(
    Player_id     serial PRIMARY KEY,
    Name_nm       VARCHAR(50),
    Position_desc VARCHAR(50),
    Club_id       INTEGER,
    Line_id       INTEGER,
    Number_num    INTEGER
);


DROP TABLE IF EXISTS stadium CASCADE;
CREATE TABLE stadium
(
    Stadium_id serial PRIMARY KEY,
    Club_id    INTEGER,
    Name_nm    VARCHAR(50),
    City_nm    VARCHAR(50)
);

DROP TABLE IF EXISTS match_table CASCADE;
CREATE TABLE match_table
(
    Match_id    serial PRIMARY KEY,
    club1_id    INTEGER,
    club2_id    INTEGER,
    Date_dt     DATE,
    Stadium_id  INTEGER,
    Main_ref_id INTEGER
);

DROP TABLE IF EXISTS referee CASCADE;
CREATE TABLE referee
(
    Referee_id     serial PRIMARY KEY,
    Name_nm        VARCHAR(50),
    Experience_num INTEGER
);


DROP TABLE IF EXISTS coach CASCADE;
CREATE TABLE coach
(
    Coach_id       serial PRIMARY KEY,
    Name_nm        VARCHAR(50),
    Club_id        INTEGER,
    Experience_num INTEGER
);

-- Заполняем таблицу club
INSERT INTO club(Club_id, Name_nm, coach_id, Stadium_id)
VALUES (1, 'Тампа-Бэй Лайтнинг', 1, 1); -- 'Сент-Пит Таймс'
INSERT INTO club(Club_id, Name_nm, coach_id, Stadium_id)
VALUES (2, 'Каролина Харрикейнз', 2, 2); --'Пи-эн-си-арена'
INSERT INTO club(Club_id, Name_nm, coach_id, Stadium_id)
VALUES (3, 'Флорида Пантерз', 3, 3); -- 'БанкАтлантик-центр'
INSERT INTO club(Club_id, Name_nm, coach_id, Stadium_id)
VALUES (4, 'Нэшвилл Предаторз', 4, 4); --'Бриджстоун-арена'
INSERT INTO club(Club_id, Name_nm, coach_id, Stadium_id)
VALUES (5, 'Питтсбург Пингвинз', 5, 5); --'Бриджстоун-арена'
INSERT INTO club(Club_id, Name_nm, coach_id, Stadium_id)
VALUES (6, 'Вашингтон Кэпиталз', 6, 6); --'Бриджстоун-арена'
INSERT INTO club(Club_id, Name_nm, coach_id, Stadium_id)
VALUES (7, 'Вегас Голден Найтс', 7, 7); --'Бриджстоун-арена'
INSERT INTO club(Club_id, Name_nm, coach_id, Stadium_id)
VALUES (8, 'Аризона Койотис', 8, 8);
--'Бриджстоун-арена'


--Заполняем таблицу division
INSERT INTO division(Division_id, club_id)
VALUES (1, 3);--central
INSERT INTO division(Division_id, club_id)
VALUES (1, 1);
INSERT INTO division(Division_id, club_id)
VALUES (1, 2);
INSERT INTO division(Division_id, club_id)
VALUES (1, 4);
INSERT INTO division(Division_id, club_id)
VALUES (2, 5); --east
INSERT INTO division(Division_id, club_id)
VALUES (2, 6);
INSERT INTO division(Division_id, club_id)
VALUES (3, 7); --west
INSERT INTO division(Division_id, club_id)
VALUES (3, 8);

--Заполняем таблицу Stadium
INSERT INTO stadium(stadium_id, Club_id, Name_nm, City_nm)
VALUES (1, 1, 'Сент-Пит Таймс', 'Тампа');
INSERT INTO stadium(stadium_id, Club_id, Name_nm, City_nm)
VALUES (2, 2, 'Пи-эн-си-арена', 'Каролина');
INSERT INTO stadium(stadium_id, Club_id, Name_nm, City_nm)
VALUES (3, 3, 'БанкАтлантик-центр', 'Флорида');
INSERT INTO stadium(stadium_id, Club_id, Name_nm, City_nm)
VALUES (4, 4, 'Бриджстоун-арена', 'Нэшвилл');

--Заполняем таблицу Coach
INSERT INTO coach(Coach_id, Name_nm, Club_id, Experience_num)
VALUES (1, 'Джон Купер', 1, 23);
INSERT INTO coach(Coach_id, Name_nm, Club_id, Experience_num)
VALUES (2, 'Род Бриндамор', 2, 15);
INSERT INTO coach(Coach_id, Name_nm, Club_id, Experience_num)
VALUES (3, 'Джоэль Кенневилль', 3, 19);
INSERT INTO coach(Coach_id, Name_nm, Club_id, Experience_num)
VALUES (4, 'Джон Хайнс', 4, 10);

--Заполняем таблицу Referee
INSERT INTO referee(Referee_id, Name_nm, Experience_num)
VALUES (1, 'Александр Александров', 5);
INSERT INTO referee(Referee_id, Name_nm, Experience_num)
VALUES (2, 'Иван Иванов', 7);
INSERT INTO referee(Referee_id, Name_nm, Experience_num)
VALUES (3, 'Анатолий Вассерман', 12);
INSERT INTO referee(Referee_id, Name_nm, Experience_num)
VALUES (4, 'Герман Стерлигов', 8);
INSERT INTO referee(Referee_id, Name_nm, Experience_num)
VALUES (5, 'Дракула', 1000);
INSERT INTO referee(Referee_id, Name_nm, Experience_num)
VALUES (6, 'Виталий Путин', 22);

--Заполняем таблицу Player
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (1, 'Булат Путин', 'striker', 1, 0, 1);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (2, 'Ли Васильев', 'striker', 1, 0, 80);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (3, 'Денис Сафин', 'striker', 1, 0, 43);
INSERT INTO line(Line_id, striker1_id, striker2_id, striker3_id)
VALUES (1, 1, 2, 3);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (4, 'Федор из Ривии', 'striker', 1, 1, 90);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (5, 'Федор Пушкин', 'striker', 1, 1, 66);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (6, 'Дмитрий Фольтест', 'striker', 1, 1, 92);
INSERT INTO line(Line_id, striker1_id, striker2_id, striker3_id)
VALUES (2, 4, 5, 6);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (7, 'Иван Фольтест', 'defender', 1, -1, 17);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (8, 'Денис Пушкин', 'defender', 1, -1, 87);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (9, 'Влад Овечкин', 'defender', 1, -1, 67);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (10, 'Денис Уик', 'goalkeeper', 1, -1, 12);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (11, 'Артем из Ривии', 'striker', 2, 0, 1);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (12, 'Александр Васильев', 'striker', 2, 0, 10);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (13, 'Уил Пушкин', 'striker', 2, 0, 89);
INSERT INTO line(Line_id, striker1_id, striker2_id, striker3_id)
VALUES (3, 11, 12, 13);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (14, 'Глеб Платинский', 'striker', 2, 1, 69);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (15, 'Антон Сафин', 'striker', 2, 1, 49);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (16, 'Заур Пушкин', 'striker', 2, 1, 96);
INSERT INTO line(Line_id, striker1_id, striker2_id, striker3_id)
VALUES (4, 14, 15, 16);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (17, 'Жерар Артемьев', 'defender', 2, -1, 98);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (18, 'Ли Панкратов-Черный', 'defender', 2, -1, 4);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (19, 'Герман Зубков', 'defender', 2, -1, 64);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (20, 'Дик Артемьев', 'goalkeeper', 2, -1, 54);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (21, 'Ли Васильев', 'striker', 3, 0, 1);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (22, 'Дмитрий Путин', 'striker', 3, 0, 81);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (23, 'Дмитрий Пирожков', 'striker', 3, 0, 2);
INSERT INTO line(Line_id, striker1_id, striker2_id, striker3_id)
VALUES (5, 21, 22, 23);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (24, 'Уил из Ривии', 'striker', 3, 1, 82);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (25, 'Дик Путин', 'striker', 3, 1, 22);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (26, 'Дик из Ривии', 'striker', 3, 1, 30);
INSERT INTO line(Line_id, striker1_id, striker2_id, striker3_id)
VALUES (6, 24, 25, 26);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (27, 'Артем Пирожков', 'defender', 3, -1, 4);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (28, 'Дмитрий Фольтест', 'defender', 3, -1, 45);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (29, 'Антон Пушкин', 'defender', 3, -1, 85);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (30, 'Герман Кузнецов', 'goalkeeper', 3, -1, 15);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (31, 'Влад Фольтест', 'striker', 4, 0, 1);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (32, 'Иван Уик', 'striker', 4, 0, 26);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (33, 'Денис Зубков', 'striker', 4, 0, 87);
INSERT INTO line(Line_id, striker1_id, striker2_id, striker3_id)
VALUES (7, 31, 32, 33);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (34, 'Герман Овечкин', 'striker', 4, 1, 81);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (35, 'Жерар Баринов', 'striker', 4, 1, 7);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (36, 'Ли Фольтест', 'striker', 4, 1, 2);
INSERT INTO line(Line_id, striker1_id, striker2_id, striker3_id)
VALUES (8, 34, 35, 36);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (37, 'Джон из Ривии', 'defender', 4, -1, 80);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (38, 'Дмитрий Сафин', 'defender', 4, -1, 49);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (39, 'Заур Панкратов-Черный', 'defender', 4, -1, 53);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (40, 'Заур Овечкин', 'goalkeeper', 4, -1, 38);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (41, 'Антон Беляков', 'striker', 5, 0, 1);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (42, 'Александр Артемьев', 'striker', 5, 0, 80);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (43, 'Булат Путин', 'striker', 5, 0, 37);
INSERT INTO line(Line_id, striker1_id, striker2_id, striker3_id)
VALUES (9, 41, 42, 43);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (44, 'Иван Пушкин', 'striker', 5, 1, 45);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (45, 'Александр Пушкин', 'striker', 5, 1, 62);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (46, 'Дмитрий из Ривии', 'striker', 5, 1, 32);
INSERT INTO line(Line_id, striker1_id, striker2_id, striker3_id)
VALUES (10, 44, 45, 46);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (47, 'Денис Смит', 'defender', 5, -1, 33);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (48, 'Ли Артемьев', 'defender', 5, -1, 97);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (49, 'Артем Пушкин', 'defender', 5, -1, 29);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (50, 'Джон Зубков', 'goalkeeper', 5, -1, 30);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (51, 'Денис Смит', 'striker', 6, 0, 1);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (52, 'Густав Путин', 'striker', 6, 0, 81);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (53, 'Антон Сафин', 'striker', 6, 0, 25);
INSERT INTO line(Line_id, striker1_id, striker2_id, striker3_id)
VALUES (11, 51, 52, 53);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (54, 'Денис Смит', 'striker', 6, 1, 35);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (55, 'Александр Кузнецов', 'striker', 6, 1, 76);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (56, 'Глеб Кузнецов', 'striker', 6, 1, 9);
INSERT INTO line(Line_id, striker1_id, striker2_id, striker3_id)
VALUES (12, 54, 55, 56);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (57, 'Джон Пушкин', 'defender', 6, -1, 99);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (58, 'Денис из Ривии', 'defender', 6, -1, 4);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (59, 'Артем Овечкин', 'defender', 6, -1, 90);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (60, 'Дмитрий Путин', 'goalkeeper', 6, -1, 34);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (61, 'Федор Пушкин', 'striker', 7, 0, 1);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (62, 'Жерар Панкратов-Черный', 'striker', 7, 0, 98);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (63, 'Герман Фольтест', 'striker', 7, 0, 49);
INSERT INTO line(Line_id, striker1_id, striker2_id, striker3_id)
VALUES (13, 61, 62, 63);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (64, 'Заур Путин', 'striker', 7, 1, 17);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (65, 'Ли Пушкин', 'striker', 7, 1, 23);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (66, 'Заур Васильев', 'striker', 7, 1, 41);
INSERT INTO line(Line_id, striker1_id, striker2_id, striker3_id)
VALUES (14, 64, 65, 66);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (67, 'Иван Иванов', 'defender', 7, -1, 48);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (68, 'Уил Зубков', 'defender', 7, -1, 60);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (69, 'Денис Овечкин', 'defender', 7, -1, 21);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (70, 'Булат Зубков', 'goalkeeper', 7, -1, 58);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (71, 'Заур Фольтест', 'striker', 8, 0, 1);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (72, 'Иван Уик', 'striker', 8, 0, 11);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (73, 'Дик Зубков', 'striker', 8, 0, 62);
INSERT INTO line(Line_id, striker1_id, striker2_id, striker3_id)
VALUES (15, 71, 72, 73);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (74, 'Артем Путин', 'striker', 8, 1, 80);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (75, 'Иван Зубков', 'striker', 8, 1, 65);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (76, 'Федор Васильев', 'striker', 8, 1, 67);
INSERT INTO line(Line_id, striker1_id, striker2_id, striker3_id)
VALUES (16, 74, 75, 76);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (77, 'Густав Платинский', 'defender', 8, -1, 24);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (78, 'Влад Уик', 'defender', 8, -1, 26);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (79, 'Иван из Ривии', 'defender', 8, -1, 63);
INSERT INTO player(player_id, Name_nm, position_desc, club_id, line_id, number_num)
VALUES (80, 'Дик Кузнецов', 'goalkeeper', 8, -1, 21);

INSERT INTO match_table(club1_id, club2_id, date_dt, stadium_id, main_ref_id)
VALUES (1, 2, '2021-10-28', 2, 3);
INSERT INTO match_table(club1_id, club2_id, date_dt, stadium_id, main_ref_id)
VALUES (3, 5, '2021-11-02', 3, 5);
INSERT INTO match_table(club1_id, club2_id, date_dt, stadium_id, main_ref_id)
VALUES (1, 4, '2021-12-05', 4, 6);
INSERT INTO match_table(club1_id, club2_id, date_dt, stadium_id, main_ref_id)
VALUES (2, 7, '2021-08-20', 2, 1);

--Посмотрим, когда ближайший матч Тампы
select date_dt, name_nm
from match_table
         inner join club
                    on (club.club_id = match_table.club1_id or club.club_id = match_table.club2_id)
                           and club.Name_nm = 'Тампа-Бэй Лайтнинг'
order by date_dt
limit 1

--Посмотрим в каком городе пройдет эта игра и на каком стадионе
select stadium.Name_nm, stadium.City_nm
from stadium
inner join (select date_dt, name_nm, match_table.stadium_id
            from match_table
                     inner join club
                                on (club.club_id = match_table.club1_id or club.club_id = match_table.club2_id)
                                       and club.Name_nm = 'Тампа-Бэй Лайтнинг'
            where date_dt = '2021-10-28'
            order by date_dt) as c
on c.Stadium_id = stadium.Stadium_id

--Посмотрим сколько матчей сыграют все команды
select name_nm, count(name_nm)
    from match_table
        inner join club
            on (club.club_id = match_table.club1_id or club.club_id = match_table.club2_id)
group by (name_nm)

--Посмотрим состав двух самых играющих команд
select player.Name_nm, player.Position_desc, player.Number_num, club.Name_nm
from player
inner join club
on player.Club_id = club.Club_id
where club.Club_id in (select club_id
    from match_table
        inner join club
            on (club.club_id = match_table.club1_id or club.club_id = match_table.club2_id)
group by (club_id)
order by (count(club_id)) DESC
limit 2)

-- Посмотрим вратарей играющих в восточном дивизионе
select player.name_nm, Position_desc, Number_num, c.Name_nm
from player
inner join (select club_id, name_nm
            from division
            inner join club
            on club.Club_id = division.club_id
            where Division.Division_id = 2) as c
on player.Club_id = c.Club_id
where Position_desc='goalkeeper'
