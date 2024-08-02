PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "endpoint_reasons" (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	endpoint_id INTEGER,
	reason_name TEXT,
	reason_hierarchy TEXT
);
INSERT INTO endpoint_reasons VALUES(1,1,'Смена материала','Переналадка');
INSERT INTO endpoint_reasons VALUES(2,1,'Смена задания','Переналадка');
INSERT INTO endpoint_reasons VALUES(3,1,'Наладка','Переналадка');
INSERT INTO endpoint_reasons VALUES(4,1,'Отсутствие питания','Поломка->Электрическая часть');
INSERT INTO endpoint_reasons VALUES(5,1,'Перебои напряжения','Поломка->Электрическая часть');
INSERT INTO endpoint_reasons VALUES(6,1,'Сломался подшипник','Поломка->Механическая часть');
INSERT INTO endpoint_reasons VALUES(7,1,'Неисправность подвижной части','Поломка->Механическая часть');
INSERT INTO endpoint_reasons VALUES(8,2,'Обед','Простои по расписанию');
INSERT INTO endpoint_reasons VALUES(9,2,'Перерыв','Простои по расписанию');
INSERT INTO endpoint_reasons VALUES(10,2,'Пересменка','Простои по расписанию');
INSERT INTO endpoint_reasons VALUES(11,2,'Отсутствие питания','Поломка->Электрическая часть');
INSERT INTO endpoint_reasons VALUES(12,2,'Перебои напряжения','Поломка->Электрическая часть');
INSERT INTO endpoint_reasons VALUES(13,3,'Пересменка','Простои по расписанию');
INSERT INTO endpoint_reasons VALUES(14,4,'Смена материала','Переналадка');
INSERT INTO endpoint_reasons VALUES(15,4,'Смена задания','Переналадка');
INSERT INTO endpoint_reasons VALUES(16,4,'Перерыв','Простои по расписанию');
INSERT INTO endpoint_reasons VALUES(17,4,'Пересменка','Простои по расписанию');
INSERT INTO endpoint_reasons VALUES(18,3,'Перебои напряжения','Поломка->Электрическая часть');
INSERT INTO endpoint_reasons VALUES(19,3,'Сломался подшипник','Поломка->Механическая часть');
INSERT INTO endpoint_reasons VALUES(20,3,'Перерыв','Простои по расписанию');
INSERT INTO endpoint_reasons VALUES(21,5,'Отсутствие питания','Поломка->Электрическая часть');
INSERT INTO endpoint_reasons VALUES(22,5,'Перебои напряжения','Поломка->Электрическая часть');
INSERT INTO endpoint_reasons VALUES(23,5,'Сломался подшипник','Поломка->Механическая часть');
INSERT INTO endpoint_reasons VALUES(24,5,'Неисправность подвижной части','Поломка->Механическая часть');
INSERT INTO endpoint_reasons VALUES(25,5,'Отсутствие питания','Поломка->Электрическая часть');
INSERT INTO endpoint_reasons VALUES(26,6,'Обед','Простои по расписанию');
INSERT INTO endpoint_reasons VALUES(27,6,'Перерыв','Простои по расписанию');
INSERT INTO endpoint_reasons VALUES(28,6,'Пересменка','Простои по расписанию');
INSERT INTO endpoint_reasons VALUES(29,6,'Отсутствие питания','Поломка->Электрическая часть');
INSERT INTO endpoint_reasons VALUES(30,2,'Перебои напряжения','Поломка->Механическая часть');
INSERT INTO endpoint_reasons VALUES(31,3,'Перебои напряжения','Поломка->Механическая часть');
INSERT INTO endpoint_reasons VALUES(32,5,'Перебои напряжения','Поломка->Механическая часть');
INSERT INTO endpoint_reasons VALUES(33,4,'Перебои напряжения','Поломка->Механическая часть');
CREATE TABLE endpoints (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT
, active TEXT);
INSERT INTO endpoints VALUES(1,'Фрезерный станок','true');
INSERT INTO endpoints VALUES(2,'Лазерный станок','false');
INSERT INTO endpoints VALUES(3,'ЧПУ станок','true');
INSERT INTO endpoints VALUES(4,'Пильный станок','true');
INSERT INTO endpoints VALUES(5,'Старый ЧПУ','true');
INSERT INTO endpoints VALUES(6,'Сварка','false');
CREATE TABLE endpoint_groups (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	endpoint_id INTEGER,
	name TEXT
);
INSERT INTO endpoint_groups VALUES(1,1,'Производство деревянных изделий');
INSERT INTO endpoint_groups VALUES(2,2,'Производство деревянных изделий');
INSERT INTO endpoint_groups VALUES(3,3,'Производство фанеры');
INSERT INTO endpoint_groups VALUES(4,4,'Производство фанеры');
INSERT INTO endpoint_groups VALUES(5,5,'Производство деревянных изделий');
INSERT INTO endpoint_groups VALUES(6,6,'Производство фанеры');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('endpoints',6);
INSERT INTO sqlite_sequence VALUES('endpoint_reasons',33);
INSERT INTO sqlite_sequence VALUES('endpoint_groups',6);
COMMIT;
