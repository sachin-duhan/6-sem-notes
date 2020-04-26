/*FUNCTIONS*/

CREATE OR REPLACE FUNCTION totalDoctors
RETURN number IS
   total number(2) := 0;
BEGIN
   SELECT count(*) into total
   FROM DOCTOR;

   RETURN total;
END;
/

/* OUTPUT */
Function created.

/* EXAMPLE*/
DECLARE
   c number(2);
BEGIN
   c := totalDoctors();
   dbms_output.put_line('Total no. of Doctors: ' || c);
END;
/

/* OUTPUT */

Total no. of Doctors: 6

PL/SQL procedure successfully completed.


/* WRITE A FUNCTION TO COMPUTE THE FACTORIAL OF A NUMBER */

DECLARE
   num number;
   factorial number;

FUNCTION fact(x number)
RETURN number
IS
   f number;
BEGIN
   IF x=0 THEN
      f := 1;
   ELSE
      f := x * fact(x-1);
   END IF;
RETURN f;
END;

BEGIN
   num:= 6;
   factorial := fact(num);
   dbms_output.put_line(' Factorial '|| num || ' is ' || factorial);
END;
/

/* OUTPUT */

Factorial 6 is 720

PL/SQL procedure successfully completed.


