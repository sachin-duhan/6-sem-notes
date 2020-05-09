/* MAKING TRIGGER */

CREATE OR REPLACE TRIGGER display_salary_changes 
BEFORE DELETE OR INSERT OR UPDATE ON doctors 
FOR EACH ROW 
WHEN (NEW.ID > 0) 
DECLARE 
   sal_diff number; 
BEGIN 
   sal_diff := :NEW.salary  - :OLD.salary; 
   dbms_output.put_line('Old salary: ' || :OLD.salary); 
   dbms_output.put_line('New salary: ' || :NEW.salary); 
   dbms_output.put_line('Salary difference: ' || sal_diff); 
END; 
/ 


/* OUTPUT */

Trigger created.


/* CREATING AN INSERT */

INSERT INTO doctors (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (7, 'Kriti', 22, 'HP', 7500.00 ); 

/* OUPTUT WHEN WE INSERT A DOCUMENT */

Old salary:
New salary: 7500
Salary difference:


/* MAKING AN UPDATE IN THE DOCUMENT */

UPDATE doctors
SET salary = salary + 500
WHERE id = 2;


/* OUPTUT WHILE UPDATING THE RECORD */


Old salary: 1500 
New salary: 2000 
Salary difference: 500 
