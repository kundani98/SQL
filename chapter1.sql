----------Chapter 1:Creating Database and Table--------

----Creating database called analysis
CREATE DATABASE analysis;


----Creating a table named teachers with six columns
CREATE TABLE teachers( 
	id BigSerial, 
	first_name VARCHAR(25), 
	last_name VARCHAR(50),
	school VARCHAR(50),
	hire_date date, 
	salary numeric
);


----Inserting data into the teachers table 
INSERT INTO teachers(first_name,last_name,school,hire_date,salary)
VALUES ('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),
       ('Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22', 65000),
       ('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500),
       ('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),
       ('Betty', 'Diaz', 'Myers Middle School', '2005-08-30', 43500),
       ('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);
	   
SELECT * FROM teachers;	 


--------Try it yourself 1------ 
CREATE TABLE animal_types(
	animal_type_id BigSerial CONSTRAINT animal_types_key PRIMARY KEY, 
	animal_name VARCHAR(100), 
	scientific_name VARCHAR(100)
	
);

CREATE TABLE animal_specs( 
	animal_specs_id BigSerial CONSTRAINT animal_specs_id_key PRIMARY KEY, 
	animal_type_id BigInt REFERENCES animal_types(animal_type_id),
	date_acquired date NOT NULL, 
	gender VARCHAR(10)
	);
	
----Try it yourself 2-------- 
INSERT INTO animal_types(animal_name,scientific_name)
VALUES('Big Cat','Lion'), 
		('Cobra','Snake');
SELECT * FROM animal_types;

INSERT INTO animal_specs(animal_type_id,date_acquired,gender)
VALUES(1, '3/12/1996', 'Female'),
	  (2, '9/30/2000', 'MALE'); 
SELECT * FROM animal_specs;	

SELECT * FROM animal_types AS t
JOIN animal_specs AS s
ON t.animal_type_id = s.animal_type_id
	  