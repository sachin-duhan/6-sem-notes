/*PACKAGES*/

CREATE OR REPLACE PACKAGE BODY dod_sal AS

   PROCEDURE find_sal(d_id DOCTORS.id%TYPE) IS
   d_sal DOCTORS.salary%TYPE;
   BEGIN
      SELECT salary INTO d_sal
      FROM DOCTORS
      WHERE id = d_id;
      dbms_output.put_line('Salary: '|| d_sal);
   END find_sal;
END dod_sal;
/

/* OUTPUT */
Package body created.



/* EXAMPLE 1 */

CREATE OR REPLACE PACKAGE c_package AS 
   -- Adds a doctor 
   PROCEDURE addDoctor(d_id   DOCTORS.id%type, 
   d_name DOCTORS.No.ame%type, 
   d_age  DOCTORS.age%type, 
   d_addr DOCTORS.address%type,  
   d_sal  DOCTORS.salary%type); 
   
   -- Removes a doctor 
   PROCEDURE delDoctor(d_id  DOCTORS.id%TYPE); 
   --Lists all DOCTORS 
   PROCEDURE listdoctor; 
  
END c_package; 
/



/* CREATING A PACKAGE BODY */

CREATE OR REPLACE PACKAGE BODY c_package AS
   PROCEDURE addDoctor(d_id  DOCTORS.id%type,
      d_name DOCTORS.No.ame%type,
      d_age  DOCTORS.age%type,
      d_addr  DOCTORS.address%type,
      d_sal   DOCTORS.salary%type)
   IS
   BEGIN
      INSERT INTO DOCTORS (id,name,age,address,salary)
         VALUES(d_id, d_name, d_age, d_addr, d_sal);
   END addDoctor;

   PROCEDURE delDoctor(d_id   DOCTORS.id%type) IS
   BEGIN
      DELETE FROM DOCTORS
      WHERE id = d_id;
   END delDoctor;

   PROCEDURE listdoctor IS
   CURSOR c_DOCTORS is
      SELECT  name FROM DOCTORS;
   TYPE d_list is TABLE OF DOCTORS.Name%type;
   name_list d_list := d_list();
   counter integer :=0;
   BEGIN
      FOR n IN c_DOCTORS LOOP
      counter := counter +1;
      name_list.extend;
      name_list(counter) := n.name;
      dbms_output.put_line('doctor(' ||counter|| ')'||name_list(counter));
      END LOOP;
   END listdoctor;

END c_package;
/


/* USING THE PACKAGE */

DECLARE
   code DOCTORS.id%type:= 8;
BEGIN
   c_package.addDoctor(7, 'Rajnish', 25, 'Chennai', 3500);
   c_package.addDoctor(8, 'Subham', 32, 'Delhi', 7500);
   c_package.delDoctor(code);
   c_package.listdoctor;
END;
/

