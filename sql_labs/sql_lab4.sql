-- _____
-- Создание представлений
-- _____
--
-- CREATE [OR REPLACE]
-- [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]
-- VIEW view_name [(column_list)]
-- AS select_statement
-- [WITH [CASCADED | LOCAL] CHECK OPTION]
--
--
-- Task_1(Факультет, курс, количество зачетов, количество экзаменов в летнюю сессию)



CREATE OR REPLACE
VIEW Task_1
AS select faculty, year, SUM(credit), SUM(exam)
from (SELECT grup_.faculty as faculty,
          grup_.year as year,
          case
            when SESSION.type = 'credit' then 1
            else 0
          end as credit,
          case
            when SESSION.type = 'exam' and MONTH(SESSION.time_) >= 2 and MONTH(SESSION.time_) <= 8 then 1
            else 0
          end as exam
from SESSION right join grup_ on SESSION.grup_ = grup_.id) as temp
group by faculty, year;

-- Task_2(Группа, название предмета, даты всех экзаменов и зачетов по этому предмету.)

CREATE OR REPLACE
VIEW Task_2
AS SELECT SESSION.grup_ as grup_,
          CLASSES.Name as name_,
          SESSION.time_ as time_
from SESSION left join CLASSES on SESSION.classes = CLASSES.Name
order by grup_, name_;

-- Task_3(ФИО преподавателя, название предмета, количество видов контроля по этому предмету для этого преподователя.)

--TODO: Task_3 не работает корректно, доделать

-- CREATE OR REPLACE
-- VIEW Task_3
-- AS select SESSION.teacher as teacher,
--           SESSION.classes as classes,
--           case
--              when exists(select * from SESSION where type = 'credit' and SESSION.teacher = teacher) and
--              exists(select * from SESSION where type = 'exam') then 2
--              when exists(select * from SESSION where type = 'credit') or
--              exists(select * from SESSION where type = 'exam') then 1
--              else 0
--           end
-- from (select * from SESSION) as
-- group by classes
-- order by teacher, classes;

-- Task_4(Название предмета, кафедра, общее количество студентов, сдающих этот предмет в зимнюю сессию.)
