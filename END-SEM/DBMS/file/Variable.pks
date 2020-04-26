/* INTRODUCTION TO PL SQL */

DECLARE 
   -- variable declaration 
   message  varchar2(20):= 'Hello, World!'; 
BEGIN 
   /* 
   *  PL/SQL executable statement(s) 
   */ 
   dbms_output.put_line(message); 
END; 
/


/* OUTPUT */

Hello World

PL/SQL procedure successfully completed.



/* VARIABLE AND CODE EXAMPLE 2*/

DECLARE
   a integer := 10;
   b integer := 20;
   c integer;
   f real;
BEGIN
   c := a + b;
   dbms_output.put_line('Value of c: ' || c);
   f := 70.0/3.0;
   dbms_output.put_line('Value of f: ' || f);
END;
/

/* OUTPUT */
Value of c: 30
Value of f: 23.333333333333333333

PL/SQL procedure successfully completed.
PI CONSTANT NUMBER := 3.141592654; 


/*EXAMPLE 3 */

DECLARE 
   -- constant declaration 
   pi constant number := 3.141592654; 
   -- other declarations 
   radius number(5,2);  
   dia number(5,2);  
   circumference number(7, 2); 
   area number (10, 2); 
BEGIN  
   -- processing 
   radius := 9.5;  
   dia := radius * 2;  
   circumference := 2.0 * pi * radius; 
   area := pi * radius * radius; 
   -- output 
   dbms_output.put_line('Radius: ' || radius); 
   dbms_output.put_line('Diameter: ' || dia); 
   dbms_output.put_line('Circumference: ' || circumference); 
   dbms_output.put_line('Area: ' || area); 
END; 
/ 



/* GENERAL QUERY EXAMPLE */

DECLARE
   d_id DOCTORS.id%type := 1;
   d_name  DOCTORS.name%type;
   d_addr DOCTORS.address%type;
   d_sal  DOCTORS.salary%type;
BEGIN
   SELECT name, address, salary INTO d_name, d_addr, d_sal
   FROM DOCTORS
   WHERE id = d_id;
   dbms_output.put_line('Doctor is ' || d_name || ' from ' || d_addr || ' earns ' || d_sal);
END;
/



