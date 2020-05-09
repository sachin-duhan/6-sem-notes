BEGIN 
-- STEP 1
   UPDATE course
     SET cost = cost - (cost * 0.10) 
    WHERE prerequisite IS NULL;
-- STEP 2
   UPDATE course
     SET cost = cost + (cost * 0.10) 
    WHERE prerequisite IS NOT NULL; 
END;


COMMIT [WORK];


BEGIN
INSERT INTO student
  (student_id, last_name, zip, registration_date,
   created_by, created_date, modified_by,
   modified_date
  )
  VALUES (student_id_seq.nextval, 'Tashi', 10015,
          '01-JAN-99', 'STUDENTA', '01-JAN-99',
          'STUDENTA', '01-JAN-99'
         );
END;


SELECT * 
FROM student 
WHERE last_name = 'Tashi';


COMMIT;


ROLLBACK [WORK];


SAVEPOINT name;


ROLLBACK [WORK] to SAVEPOINT name;


BEGIN
   INSERT INTO student
     ( student_id, Last_name, zip, registration_date,
       created_by, created_date, modified_by,
       modified_date
     )
     VALUES ( student_id_seq.nextval, 'Tashi', 10015,
              '01-JAN-99', 'STUDENTA', '01-JAN-99',
              'STUDENTA','01-JAN-99'
            );
   SAVEPOINT A;
   INSERT INTO student
     ( student_id, Last_name, zip, registration_date,
       created_by, created_date, modified_by,
       modified_date
     )
     VALUES (student_id_seq.nextval, 'Sonam', 10015,
             '01-JAN-99', 'STUDENTB','01-JAN-99',
             'STUDENTB', '01-JAN-99'
            );
  SAVEPOINT B;
  INSERT INTO student
    ( student_id, Last_name, zip, registration_date,
     created_by, created_date, modified_by,
     modified_date
    )
  VALUES (student_id_seq.nextval, 'Norbu', 10015,
          '01-JAN-99', 'STUDENTB', '01-JAN-99',
          'STUDENTB', '01-JAN-99'
         );
  SAVEPOINT C;
  ROLLBACK TO B;
END;


SELECT *
FROM student
WHERE last_name = 'Norbu';


ROLLBACK to SAVEPOINT A;


DECLARE
     v_Counter NUMBER;
   BEGIN
     v_counter := 0;
     FOR i IN 1..100
     LOOP
       v_counter := v_counter + 1;
       IF v_counter = 10
       THEN
         COMMIT;
         v_counter := 0;
      END IF;
    END LOOP;
END;


