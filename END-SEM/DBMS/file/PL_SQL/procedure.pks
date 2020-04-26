/*PROCEDURE*/

CREATE OR REPLACE PROCEDURE greetings 
AS 
BEGIN 
   dbms_output.put_line('Hello World!'); 
END; 
/

EXECUTE greetings;

/*OUTPUT*/
Hello World!

PL/SQL procedure successfully completed.



DROP PROCEDURE greetings;



/* CODE EXAMPLE 2 */

DECLARE
   a number;
   b number;
   c number;
PROCEDURE findMin(x IN number, y IN number, z OUT number) IS
BEGIN
   IF x < y THEN
      z:= x;
   ELSE
      z:= y;
   END IF;
END;
BEGIN
   a:= 23;
   b:= 45;
   findMin(a, b, c);
   dbms_output.put_line('Minimum of (23, 45) : ' || c);
END;
/


/* OUTPUT */
Minimum of (23, 45) : 23

PL/SQL procedure successfully completed.

