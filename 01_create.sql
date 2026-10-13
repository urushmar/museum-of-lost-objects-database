
DROP TABLE IF EXISTS category CASCADE;
DROP TABLE IF EXISTS donors CASCADE;
DROP TABLE IF EXISTS employee_role CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS exhibition CASCADE;
DROP TABLE IF EXISTS exhibition_object CASCADE;
DROP TABLE IF EXISTS location CASCADE;
DROP TABLE IF EXISTS objects CASCADE;
DROP TABLE IF EXISTS restoration CASCADE;
DROP TABLE IF EXISTS roles CASCADE;
DROP TABLE IF EXISTS ticket CASCADE;


CREATE TABLE category (
    category_id SERIAL NOT NULL,
    category_name VARCHAR(256) NOT NULL
);
ALTER TABLE category ADD CONSTRAINT pk_category PRIMARY KEY (category_id);
ALTER TABLE category ADD CONSTRAINT uc_category_category_name UNIQUE (category_name);

CREATE TABLE donors (
    donor_id SERIAL NOT NULL,
    name VARCHAR(256) NOT NULL,
    donation_date VARCHAR(256) NOT NULL
);
ALTER TABLE donors ADD CONSTRAINT pk_donors PRIMARY KEY (donor_id);

CREATE TABLE employee_role (
    employee_id SERIAL NOT NULL,
    role_id SERIAL NOT NULL,
    employees_employee_id INTEGER NOT NULL,
    roles_role_id INTEGER NOT NULL
);
ALTER TABLE employee_role ADD CONSTRAINT pk_employee_role PRIMARY KEY (employee_id, role_id, employees_employee_id, roles_role_id);

CREATE TABLE employees (
    employee_id SERIAL NOT NULL,
    name VARCHAR(256) NOT NULL,
    address VARCHAR(256) NOT NULL,
    salary VARCHAR(256) NOT NULL
);
ALTER TABLE employees ADD CONSTRAINT pk_employees PRIMARY KEY (employee_id);

CREATE TABLE exhibition (
    exhibition_id SERIAL NOT NULL,
    exhibition_name VARCHAR(256) NOT NULL,
    theme VARCHAR(256) NOT NULL,
    start_date VARCHAR(256) NOT NULL,
    end_date VARCHAR(256) NOT NULL,
    visitor_capacity VARCHAR(256) NOT NULL
);
ALTER TABLE exhibition ADD CONSTRAINT pk_exhibition PRIMARY KEY (exhibition_id);
ALTER TABLE exhibition ADD CONSTRAINT uc_exhibition_exhibition_name UNIQUE (exhibition_name);

CREATE TABLE exhibition_object (
    exhibition_object_id SERIAL NOT NULL,
    exhibition_id INTEGER NOT NULL,
    object_id INTEGER NOT NULL,
    display_start_date VARCHAR(256),
    display_end_date VARCHAR(256)
);
ALTER TABLE exhibition_object ADD CONSTRAINT pk_exhibition_object PRIMARY KEY (exhibition_object_id, exhibition_id, object_id);

CREATE TABLE location (
    location_id SERIAL NOT NULL,
    section VARCHAR(256) NOT NULL,
    room_number VARCHAR(256) NOT NULL
);
ALTER TABLE location ADD CONSTRAINT pk_location PRIMARY KEY (location_id);

CREATE TABLE objects (
    object_id SERIAL NOT NULL,
    location_location_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    donor_id INTEGER,
    name VARCHAR(256) NOT NULL,
    physical_condition VARCHAR(256) NOT NULL,
    short_description VARCHAR(256) NOT NULL,
    location_id VARCHAR(256) NOT NULL,
    owner VARCHAR(256),
    origin VARCHAR(256)
);
ALTER TABLE objects ADD CONSTRAINT pk_objects PRIMARY KEY (object_id);

CREATE TABLE restoration (
    restoration_id SERIAL NOT NULL,
    employee_id INTEGER NOT NULL,
    object_id INTEGER NOT NULL,
    restoration_date VARCHAR(256) NOT NULL
);
ALTER TABLE restoration ADD CONSTRAINT pk_restoration PRIMARY KEY (restoration_id, employee_id, object_id);

CREATE TABLE roles (
    role_id SERIAL NOT NULL,
    role_name VARCHAR(256) NOT NULL
);
ALTER TABLE roles ADD CONSTRAINT pk_roles PRIMARY KEY (role_id);
ALTER TABLE roles ADD CONSTRAINT uc_roles_role_name UNIQUE (role_name);

CREATE TABLE ticket (
    ticket_id SERIAL NOT NULL,
    exhibition_id INTEGER NOT NULL,
    sold_date VARCHAR(256) NOT NULL,
    price VARCHAR(256) NOT NULL
);
ALTER TABLE ticket ADD CONSTRAINT pk_ticket PRIMARY KEY (ticket_id, exhibition_id);

ALTER TABLE employee_role ADD CONSTRAINT fk_employee_role_employees FOREIGN KEY (employees_employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE;
ALTER TABLE employee_role ADD CONSTRAINT fk_employee_role_roles FOREIGN KEY (roles_role_id) REFERENCES roles (role_id) ON DELETE CASCADE;

ALTER TABLE exhibition_object ADD CONSTRAINT fk_exhibition_object_exhibition FOREIGN KEY (exhibition_id) REFERENCES exhibition (exhibition_id) ON DELETE CASCADE;
ALTER TABLE exhibition_object ADD CONSTRAINT fk_exhibition_object_objects FOREIGN KEY (object_id) REFERENCES objects (object_id) ON DELETE CASCADE;

ALTER TABLE objects ADD CONSTRAINT fk_objects_location FOREIGN KEY (location_location_id) REFERENCES location (location_id) ON DELETE CASCADE;
ALTER TABLE objects ADD CONSTRAINT fk_objects_category FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE;
ALTER TABLE objects ADD CONSTRAINT fk_objects_donors FOREIGN KEY (donor_id) REFERENCES donors (donor_id) ON DELETE CASCADE;

ALTER TABLE restoration ADD CONSTRAINT fk_restoration_employees FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE;
ALTER TABLE restoration ADD CONSTRAINT fk_restoration_objects FOREIGN KEY (object_id) REFERENCES objects (object_id) ON DELETE CASCADE;

ALTER TABLE ticket ADD CONSTRAINT fk_ticket_exhibition FOREIGN KEY (exhibition_id) REFERENCES exhibition (exhibition_id) ON DELETE CASCADE;
