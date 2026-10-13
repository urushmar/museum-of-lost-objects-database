insert into employees (name, address, salary) values ('Consuelo Jillions', '54 Ryan Crossing', '37956');
insert into employees (name, address, salary) values ('Lloyd Datte', '208 Artisan Crossing', '53261');
insert into employees (name, address, salary) values ('Julienne Punshon', '9756 Eggendart Court', '45207');
insert into employees (name, address, salary) values ('Desiri Forstall', '9220 Bayside Way', '32288');
insert into employees (name, address, salary) values ('Eliza Limeburner', '3747 Trailsway Park', '34184');
insert into employees (name, address, salary) values ('Dillon Roch', '15 Kings Parkway', '37233');
insert into employees (name, address, salary) values ('Tish Sawfoot', '2 Fairview Pass', '49278');
insert into employees (name, address, salary) values ('Ashia Lockless', '31 Clyde Gallagher Drive', '52216');

insert into roles (role_name) values ('Curator');
insert into roles (role_name) values ('Restorer');
insert into roles (role_name) values ('Guide');

insert into employee_role (employees_employee_id, roles_role_id) values (1, 1);
insert into employee_role (employees_employee_id, roles_role_id) values (1, 3);
insert into employee_role (employees_employee_id, roles_role_id) values (2, 1);
insert into employee_role (employees_employee_id, roles_role_id) values (3, 2);
insert into employee_role (employees_employee_id, roles_role_id) values (4, 2);
insert into employee_role (employees_employee_id, roles_role_id) values (5, 3);
insert into employee_role (employees_employee_id, roles_role_id) values (6, 3);
insert into employee_role (employees_employee_id, roles_role_id) values (7, 1);
insert into employee_role (employees_employee_id, roles_role_id) values (7, 2);
insert into employee_role (employees_employee_id, roles_role_id) values (8, 2);

insert into category (category_name) values ('Clothing');
insert into category (category_name) values ('Documents');
insert into category (category_name) values ('Toys');
insert into category (category_name) values ('Personal accessories');
insert into category (category_name) values ('Photographs');
insert into category (category_name) values ('Books');
insert into category (category_name) values ('Furniture');

insert into location (section, room_number) values ('Wing A', '101');
insert into location (section, room_number) values ('Wing A', '102');
insert into location (section, room_number) values ('Wing B', '201');
insert into location (section, room_number) values ('Wing B', '202');
insert into location (section, room_number) values ('Wing C', '301');
insert into location (section, room_number) values ('Wing C', '302');
insert into location (section, room_number) values ('Storage', 'S01');

insert into donors (name, donation_date) values ('Martin Kovac', '2019-03-15');
insert into donors (name, donation_date) values ('Jana Novotna', '2020-07-22');
insert into donors (name, donation_date) values ('Petr Stransky', '2021-01-10');
insert into donors (name, donation_date) values ('Lucie Fialova', '2021-08-05');
insert into donors (name, donation_date) values ('Tomas Kral', '2022-02-28');
insert into donors (name, donation_date) values ('Marie Sedlakova', '2022-09-14');
insert into donors (name, donation_date) values ('Jan Vesely', '2023-04-01');
insert into donors (name, donation_date) values ('Petra Vlckova', '2023-11-30');
insert into donors (name, donation_date) values ('Ondrej Hajek', '2024-03-17');
insert into donors (name, donation_date) values ('Sarka Kopecka', '2024-08-21');

insert into objects (location_location_id, category_id, donor_id, name, physical_condition, short_description, location_id, owner, origin) values (1, 1, 1, 'Woollen scarf', 'good', 'Red scarf found on tram no. 22 in 1998.', '1', 'Unknown', 'Prague');
insert into objects (location_location_id, category_id, donor_id, name, physical_condition, short_description, location_id, owner, origin) values (2, 2, null, 'Birth certificate', 'fair', 'Document dated 1942, found in demolished building.', '2', null, 'Brno');
insert into objects (location_location_id, category_id, donor_id, name, physical_condition, short_description, location_id, owner, origin) values (3, 3, 2, 'Tin soldier set', 'poor', 'Set of 12 hand-painted soldiers, circa 1960.', '3', 'Jana Novotna', 'Prague');
insert into objects (location_location_id, category_id, donor_id, name, physical_condition, short_description, location_id, owner, origin) values (4, 4, 3, 'Pocket watch', 'good', 'Silver pocket watch engraved with initials J.K.', '4', 'Petr Stransky', 'Vienna');
insert into objects (location_location_id, category_id, donor_id, name, physical_condition, short_description, location_id, owner, origin) values (1, 5, null, 'Family photograph', 'fair', 'Sepia portrait of unknown family, early 20th century.', '1', null, 'Unknown');
insert into objects (location_location_id, category_id, donor_id, name, physical_condition, short_description, location_id, owner, origin) values (2, 6, 4, 'Leather diary', 'good', 'Diary kept by a young woman during WWII.', '2', 'Lucie Fialova', 'Prague');
insert into objects (location_location_id, category_id, donor_id, name, physical_condition, short_description, location_id, owner, origin) values (3, 1, 5, 'Childs shoe pair', 'poor', 'Small leather shoes, size 24, circa 1930.', '3', 'Unknown', 'Olomouc');
insert into objects (location_location_id, category_id, donor_id, name, physical_condition, short_description, location_id, owner, origin) values (5, 3, 6, 'Wooden rocking horse', 'fair', 'Hand-carved rocking horse missing one ear.', '5', 'Marie Sedlakova', 'Plzen');
insert into objects (location_location_id, category_id, donor_id, name, physical_condition, short_description, location_id, owner, origin) values (6, 2, null, 'Telegram', 'poor', 'Fragile telegram announcing end of war, 1945.', '6', null, 'Prague');
insert into objects (location_location_id, category_id, donor_id, name, physical_condition, short_description, location_id, owner, origin) values (4, 1, 7, 'Embroidered handkerchief', 'good', 'White handkerchief with floral embroidery.', '4', 'Jan Vesely', 'Moravia');
insert into objects (location_location_id, category_id, donor_id, name, physical_condition, short_description, location_id, owner, origin) values (5, 3, 8, 'Glass marble collection', 'good', 'Collection of 30 coloured glass marbles in original tin.', '5', 'Petra Vlckova', 'Brno');
insert into objects (location_location_id, category_id, donor_id, name, physical_condition, short_description, location_id, owner, origin) values (6, 2, 9, 'Identity card 1968', 'fair', 'Czechoslovak identity card from the Prague Spring era.', '6', 'Ondrej Hajek', 'Prague');
insert into objects (location_location_id, category_id, donor_id, name, physical_condition, short_description, location_id, owner, origin) values (1, 6, 10, 'Childrens book', 'good', 'Illustrated fairy tale book printed in 1955.', '1', 'Sarka Kopecka', 'Prague');
insert into objects (location_location_id, category_id, donor_id, name, physical_condition, short_description, location_id, owner, origin) values (7, 7, null, 'Wooden chair', 'poor', 'Simple oak chair, early 20th century, found in attic.', '7', null, 'Unknown');
insert into objects (location_location_id, category_id, donor_id, name, physical_condition, short_description, location_id, owner, origin) values (4, 4, 1, 'Compass', 'good', 'Brass compass with engraved lid, possibly military.', '4', 'Unknown', 'Bratislava');



insert into exhibition (exhibition_name, theme, start_date, end_date, visitor_capacity) values ('Wartime Memories', 'Objects connected to WW2 and its aftermath', '2023-01-15', '2023-06-30', '200');
insert into exhibition (exhibition_name, theme, start_date, end_date, visitor_capacity) values ('Childhood Lost', 'Toys and items belonging to children of the past', '2023-09-01', '2024-01-31', '150');
insert into exhibition (exhibition_name, theme, start_date, end_date, visitor_capacity) values ('Identity and Documents', 'Personal documents and identity objects', '2024-03-01', '2024-09-30', '180');
insert into exhibition (exhibition_name, theme, start_date, end_date, visitor_capacity) values ('Everyday Wonders', 'Ordinary objects with extraordinary stories', '2025-02-01', '2025-08-31', '250');
insert into exhibition (exhibition_name, theme, start_date, end_date, visitor_capacity) values ('Prague Through Objects', 'Items that tell the story of Prague', '2026-01-10', '2026-12-31', '300');

insert into exhibition_object (exhibition_id, object_id, display_start_date, display_end_date) values (1, 2, '2023-01-15', '2023-06-30');
insert into exhibition_object (exhibition_id, object_id, display_start_date, display_end_date) values (1, 6, '2023-01-15', '2023-06-30');
insert into exhibition_object (exhibition_id, object_id, display_start_date, display_end_date) values (1, 9, '2023-01-15', '2023-06-30');
insert into exhibition_object (exhibition_id, object_id, display_start_date, display_end_date) values (2, 3, '2023-09-01', '2024-01-31');
insert into exhibition_object (exhibition_id, object_id, display_start_date, display_end_date) values (2, 7, '2023-09-01', '2024-01-31');
insert into exhibition_object (exhibition_id, object_id, display_start_date, display_end_date) values (2, 8, '2023-09-01', '2024-01-31');
insert into exhibition_object (exhibition_id, object_id, display_start_date, display_end_date) values (2, 11, '2023-09-01', '2024-01-31');
insert into exhibition_object (exhibition_id, object_id, display_start_date, display_end_date) values (3, 12, '2024-03-01', '2024-09-30');
insert into exhibition_object (exhibition_id, object_id, display_start_date, display_end_date) values (3, 2, '2024-04-01', '2024-09-30');
insert into exhibition_object (exhibition_id, object_id, display_start_date, display_end_date) values (4, 1, '2025-02-01', '2025-08-31');
insert into exhibition_object (exhibition_id, object_id, display_start_date, display_end_date) values (4, 4, '2025-02-01', '2025-08-31');
insert into exhibition_object (exhibition_id, object_id, display_start_date, display_end_date) values (4, 10, '2025-02-01', '2025-08-31');
insert into exhibition_object (exhibition_id, object_id, display_start_date, display_end_date) values (4, 15, '2025-02-01', '2025-08-31');
insert into exhibition_object (exhibition_id, object_id, display_start_date, display_end_date) values (5, 5, '2026-01-10', null);
insert into exhibition_object (exhibition_id, object_id, display_start_date, display_end_date) values (5, 13, '2026-01-10', null);

insert into ticket (exhibition_id, sold_date, price) values (1, '2023-02-01', '150');
insert into ticket (exhibition_id, sold_date, price) values (1, '2023-02-15', '150');
insert into ticket (exhibition_id, sold_date, price) values (1, '2023-03-15', '150');
insert into ticket (exhibition_id, sold_date, price) values (1, '2023-04-20', '100');
insert into ticket (exhibition_id, sold_date, price) values (2, '2023-09-05', '120');
insert into ticket (exhibition_id, sold_date, price) values (2, '2023-10-10', '120');
insert into ticket (exhibition_id, sold_date, price) values (2, '2023-11-20', '80');
insert into ticket (exhibition_id, sold_date, price) values (2, '2024-01-15', '120');
insert into ticket (exhibition_id, sold_date, price) values (3, '2024-03-10', '130');
insert into ticket (exhibition_id, sold_date, price) values (3, '2024-05-22', '130');
insert into ticket (exhibition_id, sold_date, price) values (3, '2024-07-04', '130');
insert into ticket (exhibition_id, sold_date, price) values (4, '2025-02-14', '140');
insert into ticket (exhibition_id, sold_date, price) values (4, '2025-03-08', '140');
insert into ticket (exhibition_id, sold_date, price) values (4, '2025-06-01', '140');
insert into ticket (exhibition_id, sold_date, price) values (5, '2026-01-15', '160');
insert into ticket (exhibition_id, sold_date, price) values (5, '2026-02-20', '160');
insert into ticket (exhibition_id, sold_date, price) values (5, '2026-04-01', '110');

insert into restoration (object_id, employee_id, restoration_date) values (2, 3, '2022-11-10');
insert into restoration (object_id, employee_id, restoration_date) values (6, 4, '2022-12-01');
insert into restoration (object_id, employee_id, restoration_date) values (9, 3, '2023-01-05');
insert into restoration (object_id, employee_id, restoration_date) values (7, 8, '2023-06-15');
insert into restoration (object_id, employee_id, restoration_date) values (8, 7, '2023-07-20');
insert into restoration (object_id, employee_id, restoration_date) values (3, 4, '2024-02-14');
insert into restoration (object_id, employee_id, restoration_date) values (14, 3, '2024-05-09');
insert into restoration (object_id, employee_id, restoration_date) values (12, 8, '2024-08-30');
insert into restoration (object_id, employee_id, restoration_date) values (5, 7, '2025-01-12');
insert into restoration (object_id, employee_id, restoration_date) values (15, 4, '2025-03-25');

COMMIT;
