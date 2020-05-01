/* EXCEPTION HANDLING IN PL SQL */

/* EXAMPLE 1*/

DECLARE 
   d_id DOCTORs.id%type := 812; /* Docter_id is give here */ 
   d_name DOCTORs.Name%type; 
BEGIN 
   SELECT  name INTO d_name 
   FROM DOCTORs 
   WHERE id = d_id;  
   DBMS_OUTPUT.PUT_LINE ('Name: '||  d_name); 

EXCEPTION 
   WHEN no_data_found THEN 
      dbms_output.put_line('No such Doctor!'); 
   WHEN others THEN 
      dbms_output.put_line('Error!'); 
END; 
/



/*------------------------------------------------------------
NEXT SCREENSHOT IS OF OUTPUT GIVEN BELOW!
------------------------------------------------------------*/



/* OUTPUT */

No such Doctor!

PL/SQL procedure successfully completed.


/*------------------------------------------------------------
    NEXT SCREENSHOT IS OF THE CODE BELOW
------------------------------------------------------------*/



/* RAISING EXCEPTION IN PL SQL */

--- defining my expecption

DECLARE 
   invalid-id-exception EXCEPTION; 




/*------------------------------------------------------------
    NEXT SCREENSHOT IS OF THE CODE BELOW
------------------------------------------------------------*/




/* DECLARATION & IMPLEMENTATION */

DECLARE
   d_id DOCTORs.id%type := &cd_id;
   d_name DOCTORs.Name%type;
   -- user defined exception
   invalid-id-exception EXCEPTION;
BEGIN
   IF d_id <= 0 THEN
      RAISE invalid-id-exception;
   ELSE
      SELECT name INTO d_name
      FROM DOCTORs
      WHERE id = d_id;
      DBMS_OUTPUT.PUT_LINE ('Name: '||  d_name);
   END IF;

EXCEPTION
   WHEN invalid-id-exception THEN
      dbms_output.put_line('ID must be greater than zero!');
   WHEN no_data_found THEN
      dbms_output.put_line('No such Doctor!');
   WHEN others THEN
      dbms_output.put_line('Error!');
END;
/



/*------------------------------------------------------------
    NEXT SCREENSHOT IS OF THE OUTPUT BELOW
------------------------------------------------------------*/



/* OUTPUT */

Enter value for cd_id: -6
ID must be greater than zero!

PL/SQL procedure successfully completed.


Enter value for cd_id: 12921
No such Doctor!

PL/SQL procedure successfully completed.


/*------------------------------------------------------------
    NEXT SCREENSHOT IS OF THE CODE BELOW
------------------------------------------------------------*/




/* FETCHING DETAILS OF A DOCTOR */

DECLARE
    d_name DOCTORs.NAME%TYPE;
    d_id DOCTORs.doctor_id%TYPE := 12; /*doctor_id  is given here!*/
BEGIN
    -- get the Doctor
    SELECT NAME INTO d_name
    FROM DOCTORs
    WHERE doctor_id > d_id;

    -- show the Doctor name
    dbms_output.put_line('Doctor name is ' || d_name);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            dbms_output.put_line('Doctor ' || d_id ||  ' does not exist');
        WHEN TOO_MANY_ROWS THEN
            dbms_output.put_line('The database returns more than one Doctor');
END;
/


/*------------------------------------------------------------
    NEXT SCREENSHOT IS OF THE CODE BELOW
------------------------------------------------------------*/

/* OUTPUT */

Doctor 12 does not exist

PL/SQL procedure successfully completed.
