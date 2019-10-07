#1 задание 3 лабы
SELECT SESSION.grup_ as Группа
FROM SESSION
GROUP BY SESSION.grup_
ORDER BY DATEDIFF(
  MAX(SESSION.time_),
  MIN(SESSION.time_)) DESC
LIMIT 1;

#2 задание 3 лабы
SELECT SESSION.teacher as Преподаватель
FROM SESSION LEFT JOIN grup_
on (SESSION.grup_ = grup_.id)
GROUP BY SESSION.teacher
ORDER BY SUM(grup_.students) DESC
LIMIT 1;

#3 задание 3 лабы О
#Определить, процент сдаваемых группой '473' экзаменов от общего числа предметов для каждой категории.
#Не понял задания
#4 задание 3 лабы
#Определить, не сдает ли какая-либо группа два экзамена или зачета в один день.
SELECT IF(count(time_)>1,1,0) as result
FROM SESSION
GROUP BY grup_, type
ORDER BY result DESC
LIMIT 1;

#Доп. выборки
#Сколько часов обучения выделялось на каждый факультет.
SELECT grup_.faculty as Факультеты, SUM(CLASSES.hours) as Часы
FROM SESSION JOIN grup_ ON SESSION.grup_=grup_.id
JOIN CLASSES ON SESSION.classes = CLASSES.Name
GROUP BY grup_.faculty
ORDER BY Часы DESC;
#Сколько преподавателей выделели для каждой кафедры
SELECT CLASSES.Department as Кафедры, COUNT(SESSION.teacher) as Количество_преподавтелей
FROM SESSION JOIN CLASSES ON SESSION.classes = CLASSES.Name
GROUP BY CLASSES.Department
ORDER BY Количество_преподавтелей;
#Определить сколько дней преподаватели будут заняты принятием экзаменов\зачетов
SELECT SESSION.teacher as Преподователь,
DATEADD(day, 1, DATEDIFF(
  MAX(SESSION.time_),
  MIN(SESSION.time_)
)) as Время
FROM SESSION
GROUP BY SESSION.teacher;
#Определить кафедры, на которых не проводятся экзамены
SELECT CLASSES.Department
FROM CLASSES
WHERE CLASSES.Department NOT IN (
        SELECT CLASSES.Department
        FROM CLASSES JOIN SESSION ON (CLASSES.Name = SESSION.classes)
        GROUP BY CLASSES.Department)
GROUP BY CLASSES.Department;

#_____
#Запросы на изменение базы
#_____

#Зделать замену 21 числа Амасек Виктора на Щитова Александра
UPDATE SESSION
SET teacher='Щитов Александр Сергеевич'
WHERE teacher='Амасек Виктор Анатольевич' AND time_='2019/1/21';
#Увеличить количество часов на изучение SJV на 50
UPDATE CLASSES
SET hours = hours + 50
WHERE Department='Кафедра Мемологии' AND Name='SJV';
#Изменить тип приема на устный(должно сработать ограничение целостности)
UPDATE SESSION
SET type='ustniy'
WHERE grup_=300;
#Изменить предмет для экзамена 300 группы
#(должно сработать ограничение целостность)
UPDATE SESSION
SET classes = 'Война внутри'
Where grup_ = 300;

#_____
#Запросы на удаление базы
#_____

#Удалить все записи о экзаменаъ\зачетах 300 группы.
DELETE FROM SESSION
WHERE grup_ = 300;
#Удалить все записи о Кафедре биологии(ошибка целостности)
DELETE FROM CLASSES
WHERE Department='Кафедра биологии';
#Удалить все экзамены\зачеты, если учащиеся занимались по
#дисциплине меньше 100 часов
DELETE SESSION
FROM SESSION INNER JOIN CLASSES ON (SESSION.classes=CLASSES.Name)
WHERE CLASSES.hours < 100;
