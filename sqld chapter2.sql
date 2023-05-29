/* EQUl Join , Inner join */
/*
create table EMP (
  emp_num integer primary key,
  emp_name char(10),
  emp_age integer,
  emp_balance integer,
  dept_num integer,
  foreign key (dept_num) references dept(dept_num)
);*/
/*
insert into dept (dept_num,dept_name)
values (001, '인사팀'),
	   (002, '총무팀'),
	   (003, 'IT팀');
	   */
	   /*
insert into emp (emp_num, emp_name,emp_age, emp_balance, dept_num)
values (1000, '임베스트', 20, 10000, 001),
	   (1001, '문재인', 22, 21000, 002),
	   (1002, '안철수', 32, 32000, 002);
	 
SELECT * FROM EMP, DEPT
WHERE EMP.dept_num = dept.dept_num;

SELECT * FROM EMP, DEPT
WHERE EMP.dept_num = dept.dept_num
	AND EMP.EMP_NAME LIKE '임%'
ORDER BY EMP_NAME;

SELECT * FROM EMP INNER JOIN DEPT
ON EMP.dept_num = dept.dept_num
AND EMP.EMP_NAME LIKE '문%'
ORDER BY EMP_NAME; 

SELECT dept_num FROM DEPT
EXCEPT
SELECT dept_num FROM EMP;

SELECT dept_num FROM DEPT;
SELECT dept_num FROM EMP;
CREATE TABLE EMP (
  EMPNO NUMERIC(10,0) PRIMARY KEY,
  ENAME VARCHAR(20),
  DEPTNO NUMERIC(10,0),
  MGR NUMERIC(10,0),
  JOB VARCHAR(20),
  SAL NUMERIC(10,0)
);*/
/*
INSERT INTO EMP VALUES(1000, 'TEST1', 20, NULL, 'CLERK', 800);
INSERT INTO EMP VALUES(1001, 'TEST2', 30, 1000, 'SALESMAN', 1600);
INSERT INTO EMP VALUES(1002, 'TEST3', 30, 1000, 'SALESMAN', 1250);
INSERT INTO EMP VALUES(1003, 'TEST4', 20, 1000, 'MANAGER', 2975);
INSERT INTO EMP VALUES(1004, 'TEST5', 30, 1000, 'SALESMAN', 1250);
INSERT INTO EMP VALUES(1005, 'TEST6', 30, 1001, 'MANAGER', 2850);
INSERT INTO EMP VALUES(1006, 'TEST7', 10, 1001, 'MANAGER', 2450);
INSERT INTO EMP VALUES(1007, 'TEST8', 20, 1006, 'ANALYST', 3000);
INSERT INTO EMP VALUES(1008, 'TEST9', 30, 1006, 'PRESIDENT', 5000);
INSERT INTO EMP VALUES(1009, 'TEST10', 30,1002, 'SALESMAN', 1500);
INSERT INTO EMP VALUES(1010, 'TEST11', 20, 1002, 'CLERK', 1100);
INSERT INTO EMP VALUES(1011, 'TEST12', 30, 1001, 'CLERK', 950);
INSERT INTO EMP VALUES(1012, 'TEST13', 20, 1000, 'ANALYST', 3000);
INSERT INTO EMP VALUES(1013, 'TEST14', 10, 1000, 'CLERK', 1300);
COMMIT*/

/*그룹 함수 */
/*
select store, item, sum(cnt) as all_cnt, sum(cost) as all_cost
from test
group by GROUPING sets (store, item)

select
	case grouping(store) when 1 then 'total'else store end as store
	, case grouping(item) when 1 then 'subtotal' else item end as store
	,sum(cnt) as all_cnt
	,sum(cost) as all_cost
from test
group by store, item
with rollup

select store, item, sum(cnt) as all_cnt, sum(cost) as all_cost
from test
group by store, item
with cube

select store, item, sum(cnt) as all_cnt, sum(cost) as all_cost
from test
group by cube(store, item)
*/
/* 윈도우 함수 (windows fun)
create table test2 (
	t_name char(10),
	t_age integer,
	t_blance integer);
insert into test2 (t_name, t_age, t_blance)
values ('이름1', 25, 1000),
	   ('이름2', 25, 8000),
	   ('이름3', 24, 9000),
	   ('이름4', 25, 10000),
	   ('이름5', 25, 5000);
select distinct test2.*
		, rank() Over(partition by t_age order by t_blance desc) as rn
		from test2;

select distinct test2.*
		, dense_rank() Over(partition by t_age order by t_blance desc) as rn
		from test2;

select distinct test2.*
		, row_number() Over(partition by t_age order by t_blance desc) as rn
		from test2;*/

/* 중복 데이터 제거하기 */
/*
WITH cte AS (
  SELECT
    t_name,
    t_age,
    t_blance,
    ROW_NUMBER() OVER (PARTITION BY t_name, t_age, t_blance ORDER BY t_name) RN
  FROM
    test2
)
DELETE FROM cte WHERE RN > 1; */

/* 모든 테이블내 데이터 제거 */
/* DELETE FROM your_table_name;*/


/* 집계함수 (sum, avg, count, max, min)*/

select test2.* , sum(t_blance) over(partition by t_age order by t_blance desc) 나이별합계
	from test2;
select test2.* , sum(t_blance) over(
		partition by t_age
		order by t_blance desc
		range between unbounded preceding and unbounded following
		) 나이별합계
		from test2;
