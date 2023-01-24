-- Populate the DB with data --

-- Clinics --
/*CREATE TABLE clinic(
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
);*/
INSERT INTO clinic VALUES (DEFAULT,'clinic1email@vets.com','101-202-3344',123,'Main Street',DEFAULT,'North Syracuse','NY',13212);

/*CREATE TABLE employee(
    firstname varchar(20) NOT NULL,
    lastname varchar(20) NOT NULL,
    email varchar(50) NOT NULL,
    telephone_number varchar(20) NOT NULL,
    salary decimal(8,2) NOT NULL,
    emp_id int SERIAL DEFAULT VALUE,
    PRIMARY KEY (emp_id)
);*/
-- employees --
INSERT INTO employee VALUES ('Frederick','Henderson','f.henderson@randatmail.com','977-169-7666',196254.00,DEFAULT);
INSERT INTO employee VALUES ('Reid','Ross','r.ross@randatmail.com','265-394-7999',141002.00,DEFAULT);
INSERT INTO employee VALUES ('Belinda','Higgins','b.higgins@randatmail.com','715-446-6688',63073.00,DEFAULT);
INSERT INTO employee VALUES ('Lucas','Clark','l.clark@randatmail.com','582-237-6644',151560.00,DEFAULT);
INSERT INTO employee VALUES ('Kevin','Tucker','k.tucker@randatmail.com','884-398-8888',58092.00,DEFAULT);
INSERT INTO employee VALUES ('Sienna','Richardson','s.richardson@randatmail.com','360-963-2828',48396.00,DEFAULT);

-- medications --
/*CREATE TABLE medication(
    med_id int SERIAL DEFAULT VALUE,
    dose int NOT NULL,
    cost decimal(8,2) NOT NULL,
    med_name varchar(30) NOT NULL,
    PRIMARY KEY(med_id)
);*/
INSERT INTO medication VALUES (DEFAULT,250,21.00,'Metronidazole');
INSERT INTO medication VALUES (DEFAULT,100,33.37,'Doxycycline');
INSERT INTO medication VALUES (DEFAULT,25,45.99,'Ivermectin');
INSERT INTO medication VALUES (DEFAULT,50,56.99,'Ivermectin');
INSERT INTO medication VALUES (DEFAULT,100,67.99,'Ivermectin');
INSERT INTO medication VALUES (DEFAULT,200,0.94,'Ketoconazole'); -- one tablet
INSERT INTO medication VALUES (DEFAULT,50,47.75,'Ketoconazole');
INSERT INTO medication VALUES (DEFAULT,5,0.18,'Prednisone'); -- one tablet
INSERT INTO medication VALUES (DEFAULT,5,34.75,'Prednisone');
INSERT INTO medication VALUES (DEFAULT,50,0.89,'Tramdol'); -- one tablet
INSERT INTO medication VALUES (DEFAULT,20,0.35,'Tramdol'); -- one tablet

-- Procedures --
/*CREATE TABLE procedures(
    procedure_id int SERIAL DEFAULT VALUE,
    name varchar(20) NOT NULL,
    cost decimal(8,2) NOT NULL,
    PRIMARY KEY (procedure_id)
);*/
INSERT INTO procedures VALUES (DEFAULT,'Sterilization surgery',100.00);
INSERT INTO procedures VALUES (DEFAULT,'Dental surgery',500.00);
INSERT INTO procedures VALUES (DEFAULT,'Surgical oncology',2000.00);

-- Species --
/*CREATE TABLE species(
    species_id int SERIAL DEFAULT VALUE,
    species_name varchar(20) NOT NULL,
    PRIMARY KEY (species_id)
);*/
INSERT INTO species VALUES (DEFAULT, 'Felis catus');
INSERT INTO species VALUES (DEFAULT, 'Canis familiaris');
INSERT INTO species VALUES (DEFAULT, 'Avian');

-- Vets --
/*CREATE TABLE veterinarian(
    emp_id int NOT NULL,
    species_id int NOT NULL,
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id),
    FOREIGN KEY (species_id) REFERENCES species(species_id)
);*/
INSERT INTO veterinarian VALUES (1,1);
INSERT INTO veterinarian VALUES (2,2);
INSERT INTO veterinarian VALUES (4,3);

-- Customers --
/*CREATE TABLE customer(
    firstname varchar(20) NOT NULL,
    lastname varchar(20) NOT NULL,
    email varchar(50),
    telephone_number varchar(20) NOT NULL,
    credit_card varchar(16),
    customer_id int SERIAL DEFAULT VALUE,
    PRIMARY KEY(customer_id)
);*/
INSERT INTO customer(firstname,lastname,email,telephone_number,customer_id) VALUES ('Claudia','Smith','c.smith@email.com','101-222-3333',DEFAULT);
INSERT INTO customer(firstname,lastname,telephone_number,customer_id) VALUES ('Callum','Jones','101-333-4444',DEFAULT);
INSERT INTO customer(firstname,lastname,telephone_number,customer_id) VALUES ('Nick','Kent','101-444-5555',DEFAULT);
INSERT INTO customer(firstname,lastname,email,telephone_number,customer_id) VALUES ('Laura','Smith','lsmith@thisISemail.com','101-555-6666',DEFAULT);
INSERT INTO customer(firstname,lastname,email,telephone_number,customer_id) VALUES ('John','Robin','robinjj@emailme.com','101-666-7777',DEFAULT);
INSERT INTO customer(firstname,lastname,telephone_number,customer_id) VALUES ('Albert','Victor','101-777-8888',DEFAULT);
INSERT INTO customer(firstname,lastname,telephone_number,customer_id) VALUES ('Gary','Nex','101-888-9999',DEFAULT);

-- Pets --
/*CREATE TABLE pet(
    pet_name varchar(20) NOT NULL,
    breed varchar(20) NOT NULL,
    species int NOT NULL,
    age varchar(10),
    customer_id int NOT NULL,
    FOREIGN KEY (species) REFERENCES species(species_id),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    PRIMARY KEY (customer_id, pet_name)
);*/
INSERT INTO pet VALUES ('Bizzy','ALASKAN MALAMUTE',2,5,1);
INSERT INTO pet VALUES ('Tootsie','GREAT DANE',2,10,2);
INSERT INTO pet VALUES ('Ursula','AMERICAN ESKIMO',2,2,2);
INSERT INTO pet VALUES ('Xeon','BORDER COLLIE',2,7,3);
INSERT INTO pet VALUES ('Yukon','BELGIAN MALINOIS',2,15,4);
INSERT INTO pet VALUES ('Sue','PEKINGESE',2,6,1);
INSERT INTO pet VALUES ('Geb','AUSTRALIAN TERRIER',2,5,1);

INSERT INTO pet VALUES ('Deity','Persian',1,7,6);
INSERT INTO pet VALUES ('Yappa','British Shorthair',1,15,7);
INSERT INTO pet VALUES ('Quinton','Bengal',1,6,6);
INSERT INTO pet VALUES ('Noel','Scottish Fold',1,5,5);

INSERT INTO pet VALUES ('Tweety','Galah',3,3,3);
INSERT INTO pet VALUES ('Captain','Scarlet macaw',3,60,5);

-- Appointments --
/*CREATE TABLE appointment(
    customer_id int NOT NULL,
    pet_name varchar(20) NOT NULL,
    vet_id int NOT NULL,
    clinic_id int NOT NULL,
    apt_time time NOT NULL,
    apt_date date NOT NULL,
    apt_num int SERIAL DEFAULT VALUE,
    --bill_id int NOT NULL,
    FOREIGN KEY (vet_id) REFERENCES veterinarian(emp_id),
    FOREIGN KEY (clinic_id) REFERENCES clinic(clinic_num),
    FOREIGN KEY (pet_name) REFERENCES pet(pet_name),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    --FOREIGN KEY (bill_id) REFERENCES bill(bill_id),
    PRIMARY KEY (apt_num)
);*/
INSERT INTO appointment VALUES (6,'Deity',1, 1, '09:00:00', '2022-03-22', DEFAULT);
INSERT INTO appointment VALUES (6,'Quinton',2, 1, '10:00:00', '2022-03-22', DEFAULT);
INSERT INTO appointment VALUES (2,'Tootsie',2, 1, '11:00:00', '2022-03-22', DEFAULT);
INSERT INTO appointment VALUES (3,'Tweety',4, 1, '13:00:00', '2022-03-22', DEFAULT);
INSERT INTO appointment VALUES (1,'Geb',2, 1, '14:00:00', '2022-03-22', DEFAULT);
INSERT INTO appointment VALUES (7,'Yappa',1, 1, '15:00:00', '2022-03-22', DEFAULT);
INSERT INTO appointment VALUES (5,'Captain',4, 1, '16:00:00', '2022-03-22', DEFAULT);

INSERT INTO appointment VALUES (2,'Tootsie',2, 1, '10:00:00', '2022-03-23', DEFAULT);
INSERT INTO appointment VALUES (7,'Yappa',1, 1, '12:00:00', '2022-03-23', DEFAULT);
INSERT INTO appointment VALUES (2,'Ursula',2, 1, '13:00:00', '2022-03-23', DEFAULT);
INSERT INTO appointment VALUES (1,'Sue',2, 1, '14:00:00', '2022-03-23', DEFAULT);
INSERT INTO appointment VALUES (5,'Noel',1, 1, '15:00:00', '2022-03-23', DEFAULT);
INSERT INTO appointment VALUES (1,'Bizzy',2, 1, '16:00:00', '2022-03-23', DEFAULT);

-- Hours of Operation --
/*CREATE TABLE hours_of_operation( -- Sunday 1, Monday 2 etc
    clinic_num int NOT NULL,
    day_num int,
    time_open time,
    time_closed time,
    FOREIGN KEY(clinic_num) REFERENCES clinic(clinic_num),
);*/
INSERT INTO hours_of_operation VALUES (1,2,'09:00:00','17:00:00');
INSERT INTO hours_of_operation VALUES (1,3,'09:00:00','17:00:00');
INSERT INTO hours_of_operation VALUES (1,4,'09:00:00','17:00:00');
INSERT INTO hours_of_operation VALUES (1,5,'09:00:00','17:00:00');
INSERT INTO hours_of_operation VALUES (1,6,'09:00:00','17:00:00');

-- Pet-Med-Relation -- These pets are currently on these medications
/*CREATE TABLE pet_medication_relation(
    med_id int NOT NULL,
    pet_name varchar(20) NOT NULL,
    customer_id int NOT NULL,
    start_date date NOT NULL,
    notes varchar(150),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY(pet_name) REFERENCES pet(pet_name),
    FOREIGN KEY(med_id) REFERENCES medication(med_id),
    PRIMARY KEY (med_id,pet_name,customer_id,start_date)
);*/
INSERT INTO pet_medication_relation VALUES (3,'Sue',1,'2021-08-11','Heartworm prevention.');
INSERT INTO pet_medication_relation VALUES (3,'Noel',5,'2022-1-20','Heartworm prevention.');
INSERT INTO pet_medication_relation VALUES (4,'Tootsie',2,'2019-11-20','Heartworm prevention.');
INSERT INTO pet_medication_relation VALUES (6,'Tootsie',2,'2019-11-20','Skin treatment.');
INSERT INTO pet_medication_relation VALUES (8,'Bizzy',1,'2021-08-11','Addison''s disease treatment.');
INSERT INTO pet_medication_relation VALUES (11,'Deity',6,'2022-03-22','Dental Surgery pain killer.');

-- Emp-Clinic-Relation --
/*CREATE TABLE employee_clinic_relation(
    emp_id int NOT NULL,
    clinic_id int NOT NULL,
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id),
    FOREIGN KEY(clinic_id) REFERENCES clinic(clinic_num)
);*/
INSERT INTO employee_clinic_relation VALUES (1,1);
INSERT INTO employee_clinic_relation VALUES (2,1);
INSERT INTO employee_clinic_relation VALUES (3,1);
INSERT INTO employee_clinic_relation VALUES (4,1);
INSERT INTO employee_clinic_relation VALUES (5,1);
INSERT INTO employee_clinic_relation VALUES (6,1);

-- Procedure-Apt-Relation --
/*CREATE TABLE procedure_appointment_relation(
    apt_num int NOT NULL,
    procedure_id int NOT NULL,
    preformed_by int NOT NULL,
    time_started time,
    time_completed time,
    FOREIGN KEY (preformed_by) REFERENCES employee(emp_id),
    FOREIGN KEY (apt_num) REFERENCES appointment(apt_num),
    FOREIGN KEY (procedure_id) REFERENCES procedure(procedure_id),
);*/
INSERT INTO procedure_appointment_relation VALUES (8,1,2,'10:00:00','12:30:00');
INSERT INTO procedure_appointment_relation VALUES (9,1,1,'12:00:00','13:20:00');
INSERT INTO procedure_appointment_relation VALUES (5,2,2,'14:00:00','16:10:00');
INSERT INTO procedure_appointment_relation VALUES (1,2,1,'09:00:00','11:40:00');

-- Medical History --
/*CREATE TABLE med_history(
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
);*/
-- Add the Procedures that have been done
INSERT INTO med_history(pet_name, customer_id, apt_num, procedure_id, start_date)
SELECT appointment.pet_name, appointment.customer_id, procedure_appointment_relation.apt_num,
       procedure_appointment_relation.procedure_id, appointment.apt_date
FROM procedure_appointment_relation JOIN appointment
WHERE appointment.apt_num = procedure_appointment_relation.apt_num;
-- add medicine currently taken
INSERT INTO med_history(pet_name, customer_id, med_id, start_date, treatment_for)
SELECT pet_name, customer_id, med_id, start_date, notes
FROM pet_medication_relation;
-- add completed appointments
INSERT INTO med_history(pet_name, customer_id, apt_num, start_date)
SELECT pet_name, customer_id, apt_num, apt_date
FROM appointment
WHERE apt_date < NOW();