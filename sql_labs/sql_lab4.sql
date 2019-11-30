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
-- Task_1(факультет, курс, количество зачетов, количество экзаменов)

CREATE OR REPLACE
VIEW Task_1
AS SELECT grup_.faculty as faculty,
          grup_.year as year,
          case
            when SESSION.type = 'credit' then 1
            else 0
          end as credit,
          case
            when SESSION.type = 'exam' and MONTH(SESSION.time_) >= 2 and MONTH(SESSION.time_) <= 8 then 1
            else 0
          end as exam
from SESSION right join grup_ on SESSION.grup_ = grup_.id
group by exam, credit, faculty, year;
