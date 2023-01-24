-- List all the pet names that have an appointment scheduled on a specific day along with their owners name, the timeslot and the vet they are seeing
CREATE OR REPLACE VIEW Today_Appointments as
SELECT apt_date, CONCAT( c.firstname, ' ',c.lastname) as customer_name, pet_name, apt_time, CONCAT( 'Dr.',e.lastname) as Vet
FROM appointment JOIN customer c on c.customer_id = appointment.customer_id JOIN veterinarian v on appointment.vet_id = v.emp_id JOIN employee e on e.emp_id = v.emp_id
WHERE apt_date = '2022-03-22'
ORDER BY apt_time;

-- List all the customers with emails
CREATE OR REPLACE VIEW email_list as
SELECT CONCAT( firstname, ' ',lastname) as customer_name, email
FROM customer
WHERE email IS NOT NULL;

/*List all the procedures that were preformed on a specific day along with the pet's name that it was preformed on,
      the vets name that preformed the procedure, and how long the procedure took*/
CREATE OR REPLACE VIEW Procedures_Preformed as
SELECT a.apt_date, a.pet_name, CONCAT( 'Dr.',e.lastname) as Vet, TIMEDIFF(procedure_appointment_relation.time_completed,procedure_appointment_relation.time_started ) as total_time
FROM procedure_appointment_relation JOIN appointment a on a.apt_num = procedure_appointment_relation.apt_num
     JOIN employee e on e.emp_id = procedure_appointment_relation.preformed_by
WHERE apt_date = '2022-03-23';

-- List all the birds that were seen on a given day along with who saw them
CREATE OR REPLACE VIEW Vet_saw as
SELECT CONCAT( 'Dr.',e.lastname) as Vet, species_name, pet_name, apt_date
FROM appointment JOIN veterinarian v on v.emp_id = appointment.vet_id JOIN employee e on e.emp_id = v.emp_id
    JOIN species s on s.species_id = v.species_id
WHERE apt_date = '2022-03-22' AND species_name = 'Avian';

-- For patient "Tootsie" list all their recent appointments, procedures, any active medications, any treatment notes, and any future scheduled appointments
CREATE OR REPLACE VIEW Tootsie as
SELECT DISTINCT apt_num, pet_name, med_name, procedures.name as procedure_name, start_date as date, treatment_for
FROM med_history LEFT OUTER JOIN procedures
ON procedures.procedure_id = med_history.procedure_id
LEFT OUTER JOIN medication
ON med_history.med_id = medication.med_id
WHERE pet_name = 'Tootsie'
ORDER BY date;

-- List any open appointment slots for a specific day at clinic 1
CREATE TABLE slots (time time NOT NULL PRIMARY KEY);
INSERT INTO slots
VALUES
('09:00:00'),
('10:00:00'),
('11:00:00'),
('12:00:00'),
('13:00:00'),
('14:00:00'),
('15:00:00'),
('16:00:00');
CREATE OR REPLACE VIEW Available_apt_Slots as
SELECT *
FROM slots
WHERE time NOT IN
        (
        SELECT apt_time
        FROM appointment
        WHERE apt_date = '2022-03-23'
        );
DROP TABLE IF EXISTS apt_slots;

-- List any procedures planned for a specific day at clinic 1
CREATE OR REPLACE VIEW planned_procedures as
SELECT apt_date, pet_name, apt_time, name
FROM appointment JOIN procedure_appointment_relation p on appointment.apt_num = p.apt_num JOIN procedures p2 on p2.procedure_id = p.procedure_id
WHERE apt_date = '2022-03-22';

-- List all the pets with their names that have undergone a neutering procedure at clinic 1
CREATE OR REPLACE VIEW neutered_at_c1 as
SELECT pet_name
FROM med_history JOIN procedures p on med_history.procedure_id = p.procedure_id
WHERE p.procedure_id = 1;

-- List any pets currently on a Heartworm medication
CREATE OR REPLACE VIEW Anti_parasite as
SELECT pet_name, med_name, dose, notes
FROM pet_medication_relation JOIN medication m on m.med_id = pet_medication_relation.med_id
WHERE m.med_name = 'Ivermectin';

