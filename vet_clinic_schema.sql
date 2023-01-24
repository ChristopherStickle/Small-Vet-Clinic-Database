-- CREATE DATABASE vet_clinic;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS pet;
DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS medication;
DROP TABLE IF EXISTS procedures;

DROP TABLE IF EXISTS appointment;
DROP TABLE IF EXISTS clinic;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS veterinarian;
DROP TABLE IF EXISTS med_history;

DROP TABLE IF EXISTS hours_of_operation;
DROP TABLE IF EXISTS pet_medication_relation;
DROP TABLE IF EXISTS employee_clinic_relation;
DROP TABLE IF EXISTS procedure_appointment_relation;
SET FOREIGN_KEY_CHECKS=1;

-- Tables------------------------------------------------------------
CREATE TABLE customer(
    firstname varchar(20) NOT NULL,
    lastname varchar(20) NOT NULL,
    email varchar(50),
    telephone_number varchar(20) NOT NULL,
    credit_card varchar(16),
    customer_id int SERIAL DEFAULT VALUE,
    PRIMARY KEY(customer_id)
);
CREATE TABLE species(
    species_id int SERIAL DEFAULT VALUE,
    species_name varchar(20) NOT NULL,
    PRIMARY KEY (species_id)
);
CREATE TABLE pet(
    pet_name varchar(20) NOT NULL,
    breed varchar(20) NOT NULL,
    species int NOT NULL,
    age varchar(10),
    customer_id int NOT NULL,
    FOREIGN KEY (species) REFERENCES species(species_id),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    PRIMARY KEY (customer_id, pet_name)
);
CREATE TABLE medication(
    med_id int SERIAL DEFAULT VALUE,
    dose int NOT NULL,
    cost decimal(8,2) NOT NULL,
    med_name varchar(30) NOT NULL,
    PRIMARY KEY(med_id)
);
CREATE TABLE procedures(
    procedure_id int SERIAL DEFAULT VALUE,
    name varchar(50) NOT NULL,
    cost decimal(8,2) NOT NULL,
    PRIMARY KEY (procedure_id)
);
CREATE TABLE clinic(
    clinic_num int SERIAL DEFAULT VALUE,
    email varchar(50) NOT NULL,
    telephone_number varchar(20) NOT NULL,
    building_num int NOT NULL,
    streetName varchar(100) NOT NULL,
    apartmentNumber varchar(20) DEFAULT NULL,
    city varchar(50) NOT NULL,
    state varchar(25) NOT NULL,
    zipCode int NOT NULL,
    PRIMARY KEY (clinic_num)
);
CREATE TABLE employee(
    firstname varchar(20) NOT NULL,
    lastname varchar(20) NOT NULL,
    email varchar(50) NOT NULL,
    telephone_number varchar(20) NOT NULL,
    salary decimal(8,2) NOT NULL,
    emp_id int SERIAL DEFAULT VALUE,
    PRIMARY KEY (emp_id)
);
CREATE TABLE veterinarian(
    emp_id int NOT NULL,
    species_id int NOT NULL,
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id),
    FOREIGN KEY (species_id) REFERENCES species(species_id)
);
CREATE TABLE appointment(
    customer_id int NOT NULL,
    pet_name varchar(20) NOT NULL,
    vet_id int NOT NULL,
    clinic_id int NOT NULL,
    apt_time time NOT NULL,
    apt_date date NOT NULL,
    apt_num int SERIAL DEFAULT VALUE,
    -- bill_id int NOT NULL,
    FOREIGN KEY (vet_id) REFERENCES veterinarian(emp_id),
    FOREIGN KEY (clinic_id) REFERENCES clinic(clinic_num),
    FOREIGN KEY (customer_id, pet_name) REFERENCES pet(customer_id, pet_name),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    -- FOREIGN KEY (bill_id) REFERENCES bill(bill_id),
    PRIMARY KEY (apt_num)
);
-- Multi-variable tables --------------------------------------------------
CREATE TABLE med_history(
    entry_id int SERIAL DEFAULT VALUE,
    pet_name varchar(20) NOT NULL,
    customer_id int,
    med_id int,
    procedure_id int,
    apt_num int,
    start_date date,
    end_date date,
    treatment_for varchar(30),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY(customer_id, pet_name) REFERENCES pet(customer_id, pet_name),
    FOREIGN KEY(med_id) REFERENCES medication(med_id),
    FOREIGN KEY(procedure_id) REFERENCES procedures(procedure_id),
    FOREIGN KEY(apt_num) REFERENCES appointment(apt_num),
    PRIMARY KEY (entry_id)
);
CREATE TABLE hours_of_operation( -- Sunday 1, Monday 2 etc
    clinic_num int NOT NULL,
    day_num int,
    time_open time,
    time_closed time,
    FOREIGN KEY(clinic_num) REFERENCES clinic(clinic_num)
);
-- Relation tables--------------------------------------------------------
CREATE TABLE pet_medication_relation(
    med_id int NOT NULL,
    pet_name varchar(20) NOT NULL,
    customer_id int NOT NULL,
    start_date date NOT NULL,
    notes varchar(150),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY(customer_id, pet_name) REFERENCES pet(customer_id, pet_name),
    FOREIGN KEY(med_id) REFERENCES medication(med_id),
    PRIMARY KEY (med_id,pet_name,customer_id,start_date)
);
CREATE TABLE employee_clinic_relation(
    emp_id int NOT NULL,
    clinic_id int NOT NULL,
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id),
    FOREIGN KEY(clinic_id) REFERENCES clinic(clinic_num)
);
CREATE TABLE procedure_appointment_relation(
    apt_num int NOT NULL,
    procedure_id int NOT NULL,
    preformed_by int NOT NULL,
    time_started time,
    time_completed time,
    FOREIGN KEY (preformed_by) REFERENCES employee(emp_id),
    FOREIGN KEY (apt_num) REFERENCES appointment(apt_num),
    FOREIGN KEY (procedure_id) REFERENCES procedures(procedure_id)
);
-- Future Implementations -----------------------------------------------------------------------------
/*CREATE TABLE bill(
    invoice_date date NOT NULL,
    due_date date NOT NULL,
    paid_status boolean NOT NULL,
    amount_due decimal(38,2) NOT NULL,
    bill_id int SERIAL DEFAULT VALUE,
    customer_id int NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    PRIMARY KEY (bill_id)
);
CREATE TABLE schedules(
    emp_id int NOT NULL,
    work_date date,
    start_time time,
    end_time time,
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id),
    PRIMARY KEY (emp_id, work_date, start_time),
    CONSTRAINT schedules UNIQUE (emp_id,work_date,start_time)
);*/