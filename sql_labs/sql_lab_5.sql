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
AS select temp.faculty, temp.year, SUM(temp.credit), SUM(temp.exam)
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
      from SESSION left join grup_ on SESSION.grup_ = grup_.id) as temp
group by faculty, year;

-- Task_2(Группа, название предмета, даты всех экзаменов и зачетов по этому предмету.)

CREATE OR REPLACE
VIEW Task_2
AS SELECT SESSION.grup_ as grup_,
          CLASSES.Name as name_,
          GROUP_CONCAT(SESSION.time_) as time_
from SESSION left join CLASSES on SESSION.classes = CLASSES.Name
group by grup_, name_;

-- Task_3(ФИО преподавателя, название предмета, количество видов контроля по этому предмету для этого преподователя.)

CREATE OR REPLACE
VIEW Task_3
AS select SESSION.teacher as teacher,
          SESSION.classes as classes,
          temp.num_ as num_
from SESSION left join
  (select teacher, SUM(number_) as num_
  from (select teacher, type, 1 as number_ from SESSION group by teacher, type) as temp
  group by teacher) as temp_ on SESSION.teacher = temp_.teacher
group by teacher, classes
order by teacher, classes;

-- Task_4(Название предмета, кафедра, общее количество студентов, сдающих этот предмет в зимнюю сессию.)
--TODO: доделать Task_4
CREATE OR REPLACE
VIEW Task_4
as select SESSION.classes as subject,
          CLASSES.Department as Department,
          SUM(grup_.students) as students
from SESSION
  left join CLASSES on SESSION.classes = CLASSES.Name
  left join grup_ on SESSION.grup_ = grup_.id
group by subject, Department;
