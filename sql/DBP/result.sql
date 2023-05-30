/*
create table my_account(
 --a_date date, a_reserve varchar2(20), a_expr_date    DATE,a_item_dist    VARCHAR2(20),   a_b_no         VARCHAR2(3),
   --a_c_no         VARCHAR2(8)
   a_no           VARCHAR2(8),
   a_serial_no    DECIMAL(5),
   a_date         DATE,
   a_amount       NUMBER(13),
   a_open_date    DATE,
   a_reserve      VARCHAR2(20),
   a_expr_date    DATE,
   a_item_dist    VARCHAR2(20),
   a_item_name    VARCHAR2(20),
   a_b_no         VARCHAR2(3),
   a_c_no         VARCHAR2(8)
);
*/


CREATE OR REPLACE PROCEDURE test_debit (
acco_no in VARCHAR2,
cust_no in VARCHAR2,
amount in NUMBER,
err_message out VARCHAR2)
IS
old_balance number(13);
new_balance number(13);
account_no varchar2(8);
serial_no decimal(5);
acc_date date;
open_date date;
item_dist varchar2(20);
item_name varchar2(20);
b_no varchar2(3);
deposit_shortage EXCEPTION;
BEGIN
SELECT sum(a_amount), a_no, max(a_serial_no)+1, SYSDATE
INTO old_balance, account_no, serial_no, acc_date
FROM my_account
WHERE a_c_no = cust_no and a_no=acco_no
GROUP BY a_no;

SELECT a_open_date, a_item_dist, a_item_name, a_b_no
INTO open_date, item_dist, item_name, b_no
FROM my_account
WHERE a_no = acco_no
GROUP BY a_open_date, a_item_dist, a_item_name, a_b_no;
new_balance := old_balance - amount;
IF new_balance < 0 THEN
RAISE deposit_shortage ;
ELSE
INSERT INTO my_account
VALUES(account_no, serial_no, acc_date, amount, open_date, null, null,item_dist, item_name, b_no, cust_no);
END IF;
EXCEPTION
WHEN deposit_shortage THEN
err_message := 'Remaining deposit is not enough.';
END test_debit;
