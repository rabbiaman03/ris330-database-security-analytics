/* Author: Rabbi Muhammad Aman */
/* RIS330 Assignment 1 */


/* Drop database if it exists and create fresh */
DROP DATABASE IF EXISTS seneca_code_inc;

/* Part 2: Database Creation (DDL) */


/* Create database */
CREATE DATABASE seneca_code_inc;
USE seneca_code_inc;

/* Create Client table with constraints */
CREATE TABLE client (
    client_id INT AUTO_INCREMENT,
    client_name VARCHAR(255) NOT NULL,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    province VARCHAR(2) NOT NULL,
    postal_code VARCHAR(7) NOT NULL,
    CONSTRAINT client_client_id_PK PRIMARY KEY (client_id),
    CONSTRAINT client_province_UK UNIQUE (province)
);

/* Create Programmer table with constraints */
CREATE TABLE programmer (
    programmer_id INT AUTO_INCREMENT,
    programmer_name VARCHAR(255) NOT NULL,
    office_number VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15),
    CONSTRAINT programmer_programmer_id_PK PRIMARY KEY (programmer_id)
);

/* Create Project table with constraints */
CREATE TABLE project (
    project_id INT AUTO_INCREMENT,
    project_name VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    budget DECIMAL(12,2) NOT NULL,
    client_id INT NOT NULL,
    CONSTRAINT project_project_id_PK PRIMARY KEY (project_id),
    CONSTRAINT project_project_name_UK UNIQUE (project_name),
    CONSTRAINT project_budget_CK CHECK(budget > 0),
    CONSTRAINT project_client_id_FK FOREIGN KEY (client_id) REFERENCES client(client_id)
);

/* Create bridge table for Project-Programmer relationship */
CREATE TABLE project_programmer (
    project_id INT,
    programmer_id INT,
    hours_worked DECIMAL(8,2) NOT NULL,
    CONSTRAINT project_programmer_PK PRIMARY KEY (project_id, programmer_id),
    CONSTRAINT project_programmer_hours_CK CHECK(hours_worked > 0),
    CONSTRAINT project_programmer_project_id_FK FOREIGN KEY (project_id) REFERENCES project(project_id),
    CONSTRAINT project_programmer_programmer_id_FK FOREIGN KEY (programmer_id) REFERENCES programmer(programmer_id)
);

/* Part 3: Database Loading (DML) */

/* Insert sample data into client table */
INSERT INTO client(client_id, client_name, street, city, province, postal_code)
VALUES(1, 'Seneca Polytechnic', '70 The Pond Road', 'Toronto', 'ON', 'M1K2T4');

INSERT INTO client(client_id, client_name, street, city, province, postal_code)
VALUES(2, 'Maple Leaf Foods', '30 Spruce Street', 'Mississauga', 'QC', 'H1A2B3');

INSERT INTO client(client_id, client_name, street, city, province, postal_code)
VALUES(3, 'Royal Bank of Canada', '1 Place Ville Marie', 'Montreal', 'BC', 'V6C3E9');

INSERT INTO client(client_id, client_name, street, city, province, postal_code)
VALUES(4, 'Telus Communications', '510 West Georgia St', 'Vancouver', 'AB', 'T2P4H6');

INSERT INTO client(client_id, client_name, street, city, province, postal_code)
VALUES(5, 'Suncor Energy', '150 6th Ave SW', 'Calgary', 'MB', 'R3C4E8');

/* Insert sample data into programmer table */
INSERT INTO programmer(programmer_id, programmer_name, office_number, phone_number)
VALUES(1, 'Steve Jobs', 'A101', '4164925050');

INSERT INTO programmer(programmer_id, programmer_name, office_number, phone_number)
VALUES(2, 'Ada Lovelace', 'B205', '6471234567');

INSERT INTO programmer(programmer_id, programmer_name, office_number, phone_number)
VALUES(3, 'Grace Hopper', 'C312', '9058889999');

INSERT INTO programmer(programmer_id, programmer_name, office_number, phone_number)
VALUES(4, 'Linus Torvalds', 'D418', '4167778888');

INSERT INTO programmer(programmer_id, programmer_name, office_number, phone_number)
VALUES(5, 'Margaret Hamilton', 'E525', '6134445555');

/* Insert sample data into project table */
INSERT INTO project(project_id, project_name, start_date, end_date, budget, client_id)
VALUES(1, 'Mind Craft', '2024-11-01', '2025-01-15', 100000.00, 1);

INSERT INTO project(project_id, project_name, start_date, end_date, budget, client_id)
VALUES(2, 'Banking System Upgrade', '2024-09-15', '2025-03-20', 250000.00, 3);

INSERT INTO project(project_id, project_name, start_date, end_date, budget, client_id)
VALUES(3, 'Mobile App Development', '2024-10-01', '2025-02-28', 150000.00, 2);

INSERT INTO project(project_id, project_name, start_date, end_date, budget, client_id)
VALUES(4, 'Network Infrastructure', '2024-08-01', '2024-12-31', 300000.00, 4);

INSERT INTO project(project_id, project_name, start_date, end_date, budget, client_id)
VALUES(5, 'Data Analytics Platform', '2024-12-01', '2025-06-30', 180000.00, 5);

/* Insert sample data into project_programmer bridge table */
INSERT INTO project_programmer(project_id, programmer_id, hours_worked)
VALUES(1, 1, 66.00);

INSERT INTO project_programmer(project_id, programmer_id, hours_worked)
VALUES(1, 2, 45.50);

INSERT INTO project_programmer(project_id, programmer_id, hours_worked)
VALUES(2, 3, 120.75);

INSERT INTO project_programmer(project_id, programmer_id, hours_worked)
VALUES(2, 4, 85.25);

INSERT INTO project_programmer(project_id, programmer_id, hours_worked)
VALUES(3, 1, 95.00);

INSERT INTO project_programmer(project_id, programmer_id, hours_worked)
VALUES(3, 5, 60.50);

INSERT INTO project_programmer(project_id, programmer_id, hours_worked)
VALUES(4, 2, 110.25);

INSERT INTO project_programmer(project_id, programmer_id, hours_worked)
VALUES(4, 4, 75.75);

INSERT INTO project_programmer(project_id, programmer_id, hours_worked)
VALUES(5, 3, 88.00);

INSERT INTO project_programmer(project_id, programmer_id, hours_worked)
VALUES(5, 5, 42.50);

/* Verify Data Loading (Part 3 verification) */

/* Show all data from client table */
SELECT 'Client Table Data:' AS '';
SELECT * FROM client;

/* Show all data from programmer table */
SELECT 'Programmer Table Data:' AS '';
SELECT * FROM programmer;

/* Show all data from project table */
SELECT 'Project Table Data:' AS '';
SELECT * FROM project;

/* Show all data from project_programmer table */
SELECT 'Project_Programmer Table Data:' AS '';
SELECT * FROM project_programmer;

/* Part 4: Database Modification and Deletion (DML) */


/* Temporary disable safe update mode */
SET SQL_SAFE_UPDATES = 0;

/* Modification of two rows in programmer table */
UPDATE programmer
SET office_number = 'A102', phone_number = '4165551234'
WHERE programmer_name = 'Steve Jobs';

UPDATE programmer
SET office_number = 'B206', phone_number = '6479998888'
WHERE programmer_name = 'Ada Lovelace';

/* First delete related records from project_programmer table */
DELETE FROM project_programmer
WHERE programmer_id = 5;

/* Then delete the programmer */
DELETE FROM programmer
WHERE programmer_name = 'Margaret Hamilton';

/* Re-enable safe update mode */
SET SQL_SAFE_UPDATES = 1;


/* Verify Modifications and Deletions (Part 4 verification) */


/* Show updated programmer table after modifications and deletion */
SELECT 'Programmer Table After Modifications and Deletion:' AS '';
SELECT * FROM programmer;

/* Show remaining assignments in project_programmer table */
SELECT 'Project_Programmer Table After Deletion:' AS '';
SELECT * FROM project_programmer;
