/* SAVEPOINTS  */

CREATE TABLE toys
(
   toy_id     INTEGER,
   toy_name   VARCHAR2 (100),
   colour     VARCHAR2 (10)
)

/
DECLARE
   l_count   INTEGER;
BEGIN
   INSERT INTO toys (toy_id, toy_name, colour)
        VALUES (8, 'Pink Rabbit', 'pink');
   SAVEPOINT after_six;
   INSERT INTO toys (toy_id, toy_name, colour)
        VALUES (9, 'Purple Ninja', 'purple');
   SELECT COUNT (*)
     INTO l_count
     FROM toys
    WHERE toy_id IN (8, 9);
   DBMS_OUTPUT.put_line (l_count);
   ROLLBACK TO SAVEPOINT after_six;
   SELECT COUNT (*)
     INTO l_count
     FROM toys
    WHERE toy_id IN (8, 9);
   DBMS_OUTPUT.put_line (l_count);
   ROLLBACK;
   SELECT COUNT (*)
     INTO l_count
     FROM toys
    WHERE toy_id IN (8, 9);
   DBMS_OUTPUT.put_line (l_count);
END;
/


/* OUTPUT */

2
1
0


/* AUTNOMOUS TRANSACTION  */


PRAGMA AUTONOMOUS_TRANSACTION;


CREATE OR REPLACE FUNCTION nothing RETURN INTEGER
IS
   PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
   UPDATE employees SET last_name = 'abc';
   RETURN 1;
END;
/
BEGIN
   DBMS_OUTPUT.put_line (nothing);
END;
/


/*OUTPUT*/
ORA-06519: active autonomous transaction detected and rolled back
ORA-06512: at "STEVEN.NOTHING", line 10
ORA-06512: at line 2


/* error logging procedure  */

CREATE OR REPLACE PACKAGE BODY error_mgr 
IS 
   PROCEDURE log_error (app_info_in IN VARCHAR2) 
   IS 
      PRAGMA AUTONOMOUS_TRANSACTION; 
      c_code   CONSTANT INTEGER := SQLCODE; 
   BEGIN 
      INSERT INTO error_log (created_on, 
                             created_by, 
                             errorcode, 
                             callstack, 
                             errorstack, 
                             backtrace, 
                             error_info) 
           VALUES (SYSTIMESTAMP, 
                   USER, 
                   c_code, 
                   DBMS_UTILITY.format_call_stack, 
                   DBMS_UTILITY.format_error_stack, 
                   DBMS_UTILITY.format_error_backtrace, 
                   app_info_in); 
      COMMIT; 
   END; 
END;



/* SET TRANSACTION STATEMENT */



set transaction read only;
select * from toys;
update toys
set    price = price + 1;
declare
  pragma autonomous_transaction;
begin
  update toys set price = 99.00;
  commit;
end;
/
select * from toys;
commit;
select * from toys;



