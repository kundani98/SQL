----------chapter9:Inspecting and Modfying Data -------

CREATE TABLE meat_poultry_egg_inspect (
    est_number varchar(50) CONSTRAINT est_number_key PRIMARY KEY,
    company varchar(100),
    street varchar(100),
    city varchar(30),
    st varchar(2),
    zip varchar(5),
    phone varchar(14),
    grant_date date,
    activities text,
    dbas text
);

COPY meat_poultry_egg_inspect 
FROM 'C:\Users\Kundani Nemugumoni\Documents\Code College\BootCamp\1_SQL\2_SQL Solutions\Chapter_09\MPI_Directory_by_Establishment_Name.csv'
WITH (FORMAT CSV,HEADER,DELIMITER ',');

CREATE INDEX company_idx ON meat_poultry_egg_inspect (company);

SELECT count(*) FROM meat_poultry_egg_inspect;

--Interviewing the Data Set
SELECT company,
       street,
       city,
       st,
       count(*) AS address_count
FROM meat_poultry_egg_inspect
GROUP BY company, street, city, st
HAVING count(*) > 1
ORDER BY company, street, city, st;

SELECT st,
 count(*) AS st_count
FROM meat_poultry_egg_inspect
GROUP BY st
ORDER BY st; 

--Try it yourself 1
ALTER TABLE meat_poultry_egg_inspect ADD COLUMN meat_processing boolean; 
ALTER TABLE meat_poultry_egg_inspect ADD COLUMN poultry_processing boolean; 

SELECT * FROM meat_poultry_egg_inspect; 


--Try it yourself 2
UPDATE meat_poultry_egg_inspect 
SET meat_processing  = TRUE 
WHERE activities ILIKE '%meat processing%';

UPDATE meat_poultry_egg_inspect 
SET poultry_processing = TRUE 
WHERE activities ILIKE '%poultry_processing%';

--Try it yourself 3 

SELECT count(meat_processing) AS meat, count(poultry_processing) AS Poultry
FROM meat_poultry_egg_inspect; ABORT

SELECT count(*)
FROM meat_poultry_egg_inspect
WHERE meat_processing = TRUE AND
      poultry_processing = TRUE;

