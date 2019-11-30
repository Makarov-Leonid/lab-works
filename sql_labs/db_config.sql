#группа
CREATE TABLE grup_(
  id INTEGER PRIMARY KEY,
  year INTEGER NOT NULL,
  students INTEGER NOT NULL,
  faculty VARBINARY(255) NOT NULL
) ENGINE InnoDB;

#предмет
CREATE TABLE CLASSES(
  Department VARBINARY(255) NOT NULL,
  Name VARBINARY(255) NOT NULL PRIMARY KEY,
  hours INTEGER NOT NULL
) ENGINE InnoDB;
#сессия
CREATE TABLE SESSION(
  teacher VARBINARY(255) NOT NULL,
  type ENUM('credit','exam') NOT NULL,
  time_ DATE NOT NULL,
  grup_ INTEGER,
  classes  VARBINARY(255) NOT NULL,
  FOREIGN KEY(grup_) REFERENCES grup_(id),
  FOREIGN KEY(classes) REFERENCES CLASSES(Name)
) ENGINE InnoDB;



INSERT INTO grup_(id, year, students, faculty) VALUES(1,1,29,'Изучения рептилоидов');
INSERT INTO grup_(id, year, students, faculty) VALUES(305,1,27,'Прикладной мемологии');
INSERT INTO grup_(id, year, students, faculty) VALUES(407,2,12,'Информационных рептили');
INSERT INTO grup_(id, year, students, faculty) VALUES(300,2,30,'Спартанцев');
INSERT INTO grup_(id, year, students, faculty) VALUES(666,4,4,'Изучения АРГЕНТ энергии');
INSERT INTO grup_(id, year, students, faculty) VALUES(777,4,7,'Дядюшки Нургла');
INSERT INTO grup_(id, year, students, faculty) VALUES(999,4,9,'Изучения варпa');
INSERT INTO grup_(id, year, students, faculty) VALUES(181,1,23,'Работяг');
INSERT INTO grup_(id, year, students, faculty) VALUES(182,1,24,'Тунеяндцев');
INSERT INTO grup_(id, year, students, faculty) VALUES(183,2,25,'Преподования');
INSERT INTO grup_(id, year, students, faculty) VALUES(184,3,2,'Распиливания Бюджета');
INSERT INTO grup_(id, year, students, faculty) VALUES(185,4,3,'Фантастический тварей');
INSERT INTO grup_(id, year, students, faculty) VALUES(186,1,1,'Изучения Петухов');
INSERT INTO grup_(id, year, students, faculty) VALUES(187,1,29,'Гадания на мертвом петухе');
INSERT INTO grup_(id, year, students, faculty) VALUES(188,4,15,'Блогеров');
INSERT INTO grup_(id, year, students, faculty) VALUES(189,4,15,'Психологической помощи');
INSERT INTO grup_(id, year, students, faculty) VALUES(190,3,15,'Санитаров леса');
INSERT INTO grup_(id, year, students, faculty) VALUES(191,3,15,'Озвучки фильмов');
INSERT INTO grup_(id, year, students, faculty) VALUES(192,4,12,'Social Justice Warriors');
INSERT INTO grup_(id, year, students, faculty) VALUES(193,4,3,'Гендерфлюидных вертосексуалов');
INSERT INTO grup_(id, year, students, faculty) VALUES(473,2,29,'Бойцов Кекистана');

INSERT INTO CLASSES(Department, Name, hours) VALUES('Главная кафедра', 'мемология', 100);
INSERT INTO CLASSES(Department, Name, hours) VALUES('Главная кафедра', 'изучение тролей', 100);
INSERT INTO CLASSES(Department, Name, hours) VALUES('Главная кафедра', 'изучение матчасти', 150);
INSERT INTO CLASSES(Department, Name, hours) VALUES('Главная кафедра', 'изучение соц. феменизма', 200);
INSERT INTO CLASSES(Department, Name, hours) VALUES('Главная кафедра', 'Оказание первой помощи в twiter', 100);
INSERT INTO CLASSES(Department, Name, hours) VALUES('Самая главная кафедра', 'Введение в мемы', 75);
INSERT INTO CLASSES(Department, Name, hours) VALUES('Самая главная кафедра', 'Экономика', 150);
INSERT INTO CLASSES(Department, Name, hours) VALUES('Самая главная кафедра', 'искусство манифестов', 150);
INSERT INTO CLASSES(Department, Name, hours) VALUES('Самая главная кафедра', 'Английский язык', 200);
INSERT INTO CLASSES(Department, Name, hours) VALUES('Самая главная кафедра', 'графический дизайн', 175);
INSERT INTO CLASSES(Department, Name, hours) VALUES('Кафедра физики', 'Исскуство коммуникации', 150);
INSERT INTO CLASSES(Department, Name, hours) VALUES('Кафедра физики', 'Демонология', 150);
INSERT INTO CLASSES(Department, Name, hours) VALUES('Кафедра физики', 'Энергетика', 200);
INSERT INTO CLASSES(Department, Name, hours) VALUES('Кафедра физики', 'Введение в физику', 200);
INSERT INTO CLASSES(Department, Name, hours) VALUES('Кафедра биологии', 'изучение гомункулов', 200);
INSERT INTO CLASSES(Department, Name, hours) VALUES('Кафедра биологии', 'анатомия человека', 100);
INSERT INTO CLASSES(Department, Name, hours) VALUES('Кафедра биологии', 'анатомия ксеносов', 100);
INSERT INTO CLASSES(Department, Name, hours) VALUES('Кафедра биологии', 'полевая медицина', 250);
INSERT INTO CLASSES(Department, Name, hours) VALUES('Кафедра психологии', 'Искусство пропаганды', 200);
INSERT INTO CLASSES(Department, Name, hours) VALUES('Кафедра психологии', 'Психоанализ', 250);
INSERT INTO CLASSES(Department, Name, hours) VALUES('Кафедра Мемологии', 'SJV', 250);

INSERT INTO SESSION(teacher, type, time_, grup_, classes) VALUES('Жракон Сергей Егорович','exam','2019/01/29',473,'Демонология');
INSERT INTO SESSION(teacher, type, time_, grup_, classes) VALUES('Гудини Сергей Верст','credit','2019/1/23',186,'Энергетика');
INSERT INTO SESSION(teacher, type, time_, grup_, classes) VALUES('Серый Алекс Вольфович','exam','2019/1/23',186,'Оказание первой помощи в twiter');
INSERT INTO SESSION(teacher, type, time_, grup_, classes) VALUES('Гудини Сергей Верст','exam','2019/1/24',193,'изучение гомункулов');
INSERT INTO SESSION(teacher, type, time_, grup_, classes) VALUES('Жракон Сергей Егорович','exam','2019/1/24',193,'Демонология');
INSERT INTO SESSION(teacher, type, time_, grup_, classes) VALUES('Зеле Шнайд Эр','credit','2019/1/29',188,'Искусство пропаганды');
INSERT INTO SESSION(teacher, type, time_, grup_, classes) VALUES('Гудини Сергей Верст','credit','2019/1/28',999,'Энергетика');
INSERT INTO SESSION(teacher, type, time_, grup_, classes) VALUES('Гудини Сергей Верст','credit','2019/1/26',666,'Энергетика');
INSERT INTO SESSION(teacher, type, time_, grup_, classes) VALUES('Фавн Алек Фир','exam','2019/1/26',999,'Английский язык');
INSERT INTO SESSION(teacher, type, time_, grup_, classes) VALUES('Щитов Александр Сергеевич','exam','2019/1/27',300,'полевая медицина');
INSERT INTO SESSION(teacher, type, time_, grup_, classes) VALUES('Амасек Виктор Анатольевич','credit','2019/1/21',187,'изучение гомункулов');
