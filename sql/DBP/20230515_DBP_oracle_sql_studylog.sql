prompt Enter the emoloyee's informataion:;
accept l_ename char format a10 prompt 'Last name: ';
accept l_empno number format '9999' prompt 'Employee #:';
accept l_sal number format 'mm/dd/yyyy' prompt 'Hire data (mm/dd/yyyy): ';
accept l_job char format a9 prompt 'Job:';
accept l_mgr number format '9999' prompt 'Manager''s Employee #:';
accept l_dept number format '99' prompt 'Depatment#:';

insert into emp (empno, ename, ejob, mgr,hiredate,sal, deptno)
values (&l_empno, '&l_ename', '&l_job',&l_mgr,to_date('&l_hired','mm/dd/yyyy'),&l_sal,&l_dept);

INSERT ALL
INTO enrollment (student_number, class_name, position_no) VALUES (100, 'BD445', 1)
INTO enrollment (student_number, class_name, position_no) VALUES (150, 'BA200', 1)
INTO enrollment (student_number, class_name, position_no) VALUES (200, 'BD445', 2)
INTO enrollment (student_number, class_name, position_no) VALUES (200, 'CS250', 1)
INTO enrollment (student_number, class_name, position_no) VALUES (300, 'CS150', 1)
INTO enrollment (student_number, class_name, position_no) VALUES (400, 'BA200', 2)
INTO enrollment (student_number, class_name, position_no) VALUES (400, 'BF410', 1)
INTO enrollment (student_number, class_name, position_no) VALUES (400, 'CS250', 2)
INTO enrollment (student_number, class_name, position_no) VALUES (450, 'BA200', 3)
SELECT 1 from dual;

INSERT ALL
INTO student (ssid, student_name, student_major,grade_level,age) VALUES(100, 'JONES', 'History', 'GR', 21)
INTO student (ssid, student_name, student_major,grade_level,age) VALUES(150, 'PARKS', 'Accounting', 'SO', 19)
INTO student (ssid, student_name, student_major,grade_level,age) VALUES(200, 'BAKER', 'Math', 'GR', 50)
INTO student (ssid, student_name, student_major,grade_level,age) VALUES(250, 'GLASS', 'History', 'SN', 50)
INTO student (ssid, student_name, student_major,grade_level,age) VALUES(300, 'BAKER', 'Accounting', 'SN', 41)
INTO student (ssid, student_name, student_major,grade_level,age) VALUES(350, 'RUSSEL', 'Math', 'JR', 20)
INTO student (ssid, student_name, student_major,grade_level,age) VALUES(400, 'RYE', 'Accounting', 'FR', 18)
INTO student (ssid, student_name, student_major,grade_level,age) VALUES(4, 'JONES', 'History', 'SN', 24)
SELECT 1 FROM DUAL;

INSERT ALL
INTO class(class_name, class_time, class_room) VALUES  ('BA200','M-F9','SC110')
INTO class(class_name, class_time, class_room) VALUES ('BD445','MWF3','SC213')
INTO class(class_name, class_time, class_room) VALUES ('BF410','MWF8','SC213')
INTO class(class_name, class_time, class_room) VALUES ('CS150','MWF3','EA304')
INTO class(class_name, class_time, class_room) VALUES  ('CS250','MWF12','EB210')
SELECT 1 FROM DUAL;
