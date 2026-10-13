/*
Queries navigation
 D1 - List all objects that are currently displayed in exhibitions.
 D2 - Find all employees who have performed at least one restoration activity.
 D3 - Show all donors and count how many objects each donor has donated.
 D4 - List all objects that have never been restored.
 D5 - List all employees who have never performed a restoration.
 D6 - List objects displayed only in exhibitions with theme “Memory”.
 D7 - List employees who are only guides (not curators or restorers).
 D8 - Show categories missing from each D1 exhibition.
 D9 - Show objects with no donor in three different SQL forms
 D10 - List all categories that currently have zero objects.
 D11 - List names of all employees together with the date of each restoration they performed, joined
 D12 - List all objects together with their category name
 D13 - Show all possible combinations of employees and roles
 D14 - List all objects and their donor name including objects with no donor
 D15 - Show all objects and all donors including donors with no objects and objects with no donor
 D16 - List all objects that have at least one restoration
 D17 - Show the average number of objects per location
 D18 - List all exhibitions and show the count of tickets sold for each one
 D19 - List all objects where there exists at least one restoration record
 D20 - List names of all people connected to the museum combining employees and donors
 D21 - Find names that appear in both employees and donors tables
 D22 - Show total number of objects, number of distinct categories, and number of distinct locations across all objects
 D23 - Create a view showing full exhibition schedule with object details.
 D24 - Use the view from L to list all currently displayed objects.
 D25 - Insert tickets for all exhibitions that currently have no tickets
 D26 - Give a 10% salary raise to employees who performed more than 2 restorations
 D27 - Delete all tickets with price 0 for exhibitions that have already ended
 D28 - List employees with salary above 34000 who have performed more than 1 restoration, showing their name and restoration count, ordered by restoration count from highest to lowest.
 D29 - List donors who have donated at least one object from every category in the database.
 */
--D1	List all objects that are currently displayed in exhibitions.
--RA objects <* exhibition_object <* exhibition

SELECT DISTINCT object_id,
                location_location_id,
                category_id,
                donor_id,
                name,
                physical_condition,
                short_description,
                location_id,
                owner,
                origin
FROM (
    SELECT DISTINCT object_id,
                    location_location_id,
                    category_id,
                    donor_id,
                    name,
                    physical_condition,
                    short_description,
                    location_id,
                    owner,
                    origin
    FROM OBJECTS
    NATURAL JOIN EXHIBITION_OBJECT
) R1
NATURAL JOIN EXHIBITION;
  
--D2	Find all employees who have performed at least one restoration activity.
--RA employees <* restoration

SELECT DISTINCT employee_id,
                name,
                address,
                salary
FROM EMPLOYEES
NATURAL JOIN RESTORATION;


--D3 Show all donors and count how many objects each donor has donated.
SELECT donors.name, COUNT(objects.object_id)
FROM donors
LEFT JOIN objects ON donors.donor_id = objects.donor_id
GROUP BY donors.name
  
--D4	List all objects that have never been restored.
--RA objects !<* restoration 
SELECT DISTINCT *
FROM OBJECTS
EXCEPT
SELECT DISTINCT object_id,
                location_location_id,
                category_id,
                donor_id,
                name,
                physical_condition,
                short_description,
                location_id,
                owner,
                origin
FROM OBJECTS
NATURAL JOIN RESTORATION;



--D5 List all employees who have never performed a restoration.
--RA employees !<* restoration
SELECT DISTINCT *
FROM EMPLOYEES
EXCEPT
SELECT DISTINCT employee_id, name, address, salary
FROM EMPLOYEES
NATURAL JOIN RESTORATION;


--D6 List objects displayed only in exhibitions with theme “Memory”.
SELECT DISTINCT objects.name FROM objects
JOIN exhibition_object USING (object_id)
JOIN exhibition USING (exhibition_id)
WHERE exhibition.exhibition_name = 'Wartime Memories'
EXCEPT
SELECT DISTINCT objects.name
FROM objects
JOIN exhibition_object USING (object_id)
JOIN exhibition USING (exhibition_id)
WHERE exhibition.exhibition_name != 'Wartime Memories';
  
--D7	List employees who are only guides (not curators or restorers).
SELECT employees.name FROM employees
JOIN employee_role ON employees.employee_id = employee_role.employees_employee_id
JOIN roles ON employee_role.roles_role_id = roles.role_id
WHERE roles.role_name = 'Guide'
EXCEPT
SELECT employees.name
FROM employees
JOIN employee_role ON employees.employee_id = employee_role.employees_employee_id
JOIN roles ON employee_role.roles_role_id = roles.role_id
WHERE roles.role_name != 'Guide';
  
--D8 Show categories missing from each D1 exhibition.
SELECT exhibition.exhibition_name, category.category_name
FROM exhibition
CROSS JOIN category
WHERE NOT EXISTS
(
    SELECT object_id
    FROM exhibition_object
    JOIN objects USING (object_id)
    WHERE exhibition_object.exhibition_id = exhibition.exhibition_id
    AND objects.category_id = category.category_id
);
  
--D9 Show objects with no donor in three different SQL forms 
SELECT DISTINCT name FROM objects
WHERE object_id NOT IN
(
    SELECT DISTINCT object_id FROM objects
    WHERE donor_id IS NOT NULL
);

SELECT DISTINCT name FROM objects
WHERE NOT EXISTS
(
    SELECT DISTINCT object_id FROM objects AS objects2
    WHERE objects2.object_id = objects.object_id
    AND objects2.donor_id IS NOT NULL
);

SELECT DISTINCT name FROM objects
EXCEPT
SELECT DISTINCT name FROM objects
WHERE donor_id IS NOT NULL;
  
--D10	List all categories that currently have zero objects.
--RA category !<* objects  
SELECT DISTINCT *
FROM CATEGORY
EXCEPT
SELECT DISTINCT category_id, category_name
FROM CATEGORY
NATURAL JOIN OBJECTS;
  
--D11	List names of all employees together with the date of each restoration they performed, joined
 --RA {employees * restoration}[name, restoration_date]
SELECT DISTINCT name, restoration_date
FROM EMPLOYEES
NATURAL JOIN RESTORATION;
  
--D12 List all objects together with their category name
--RA {objects * category}[objects.name, category.category_name] 
SELECT DISTINCT OBJECTS.name, CATEGORY.category_name
FROM OBJECTS
NATURAL JOIN CATEGORY; 

--D13 Show all possible combinations of employees and roles
--RA employees × roles
SELECT DISTINCT *
FROM EMPLOYEES
CROSS JOIN ROLES;

--D14 List all objects and their donor name including objects with no donor
SELECT objects.name AS object_name, donors.name AS donor_name FROM objects
LEFT JOIN donors ON objects.donor_id = donors.donor_id;
  
--D15 Show all objects and all donors including donors with no objects and objects with no donor
SELECT objects.name, donors.name FROM objects
FULL OUTER JOIN donors ON objects.donor_id = donors.donor_id;
  
--D16 List all objects that have at least one restoration 
--RA objects <* restoration
SELECT DISTINCT object_id,
                location_location_id,
                category_id,
                donor_id,
                name,
                physical_condition,
                short_description,
                location_id,
                owner,
                origin
FROM OBJECTS
NATURAL JOIN RESTORATION;
  
--D17	Show the average number of objects per location
SELECT AVG(object_count)
FROM
(
    SELECT location_location_id, COUNT(object_id) object_count
    FROM objects
    GROUP BY location_location_id
) location_counts;
  
--D18	List all exhibitions and show the count of tickets sold for each one
SELECT exhibition_name,
       (SELECT COUNT(*) FROM ticket
        WHERE ticket.exhibition_id = exhibition.exhibition_id) AS tickets_sold
FROM exhibition;
  
--D19	List all objects where there exists at least one restoration record
 SELECT DISTINCT object_id,
                location_location_id,
                category_id,
                donor_id,
                name,
                physical_condition,
                short_description,
                location_id,
                owner,
                origin
FROM OBJECTS
NATURAL JOIN RESTORATION; 
  
--D20 List names of all people connected to the museum combining employees and donors 
 --RA employees[name] ∪ donors[name]
SELECT DISTINCT name
FROM EMPLOYEES
UNION
SELECT DISTINCT name
FROM DONORS;
  
--D21 Find names that appear in both employees and donors tables 
--RA employees[name] ∩ donors[name]
SELECT DISTINCT name
FROM EMPLOYEES
INTERSECT
SELECT DISTINCT name
FROM DONORS;
  
--D22 Show total number of objects, number of distinct categories, and number of distinct locations across all objects
SELECT COUNT(object_id), COUNT(DISTINCT category_id), COUNT(DISTINCT location_id) FROM objects
  
--D23 Create a view showing full exhibition schedule with object details.
CREATE OR REPLACE VIEW exhibition_schedule AS
SELECT exhibition.exhibition_name, exhibition.theme, exhibition.start_date, exhibition.end_date, objects.name, objects.physical_condition
FROM exhibition
JOIN exhibition_object USING (exhibition_id)
JOIN objects USING (object_id);
  
--D24 Use the view from L to list all currently displayed objects.
SELECT exhibition_name, name, physical_condition
FROM exhibition_schedule
WHERE end_date IS NULL;  
  
--D25	Insert tickets for all exhibitions that currently have no tickets 
INSERT INTO ticket (exhibition_id, sold_date, price)
SELECT exhibition_id, '2026-01-01', '0'
FROM exhibition
WHERE exhibition_id NOT IN
(
    SELECT exhibition_id FROM ticket
); 
  
--D26	Give a 10% salary raise to employees who performed more than 2 restorations
UPDATE employees
SET salary = CAST(CAST(salary AS NUMERIC) * 1.10 AS VARCHAR)
WHERE employee_id IN
(
    SELECT employee_id FROM restoration
    GROUP BY employee_id
    HAVING COUNT(employee_id) > 2
); 
  
--D27 Delete all tickets with price 0 for exhibitions that have already ended
DELETE FROM ticket
WHERE price = '0'
AND exhibition_id IN
(
    SELECT exhibition_id
    FROM exhibition
    WHERE end_date < '2026-01-01'
);  
  
--D28 List employees with salary above 34000 who have performed more than 1 restoration, showing their name and restoration count, ordered by restoration count from highest to lowest.
SELECT employees.name, COUNT(restoration.restoration_id) restoration_count
FROM employees
JOIN restoration ON employees.employee_id = restoration.employee_id
WHERE CAST(employees.salary AS NUMERIC) > 34000
GROUP BY employees.name
HAVING COUNT(restoration.restoration_id) > 1
ORDER BY restoration_count DESC; 
  
--D29	List donors who have donated at least one object from every category in the database.
SELECT DISTINCT *
FROM DONORS
EXCEPT
SELECT DISTINCT donor_id,
                name,
                donation_date
FROM DONORS
NATURAL JOIN (
    SELECT DISTINCT *
    FROM CATEGORY
    EXCEPT
    SELECT DISTINCT category_id,
                    category_name
    FROM CATEGORY
    NATURAL JOIN OBJECTS
) R1;
