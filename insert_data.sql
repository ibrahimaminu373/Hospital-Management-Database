INSERT INTO Gender (GenderID, GenderName) VALUES
(1, 'Male'),
(2, 'Female');

INSERT INTO BloodType (BloodTypeID, BloodTypeName) VALUES
(1, 'A+'), (2, 'A-'),
(3, 'B+'), (4, 'B-'),
(5, 'O+'), (6, 'O-'),
(7, 'AB+'),(8, 'AB-');

INSERT INTO Department (DepartmentName, FloorNumber) VALUES
('Cardiology',        3),
('Neurology',         5),
('Pediatrics',        2),
('Emergency',         1),
('Orthopedics',       4);

INSERT INTO Doctor (FirstName, LastName, Email, PhoneNumber, LicenseNumber, DepartmentID, YearsExperience) VALUES
('James',   'Okafor',   'j.okafor@hospital.com',   '+2348011111111', 'LIC-10021', 1, 12),
('Amara',   'Nwosu',    'a.nwosu@hospital.com',    '+2348022222222', 'LIC-10022', 2,  8),
('Chukwu',  'Eze',      'c.eze@hospital.com',      '+2348033333333', 'LIC-10023', 3, 15),
('Fatima',  'Aliyu',    'f.aliyu@hospital.com',    '+2348044444444', 'LIC-10024', 4,  5),
('Emeka',   'Obiora',   'e.obiora@hospital.com',   '+2348055555555', 'LIC-10025', 5, 20);




-- ?????????????????????????????????????????
--  INSERT — Patients
-- ?????????????????????????????????????????

INSERT INTO Patient (FirstName, LastName, DateOfBirth, GenderID, BloodTypeID, Email, PhoneNumber, Address, EmergencyContact) VALUES
('Tunde',   'Bakare',  '1990-03-15', 1, 5,    'tunde.b@gmail.com',    '+2348061111111', '12 Broad St, Lagos',       'Ngozi Bakare'),
('Ngozi',   'Obi',     '1985-07-22', 2, 2,    'ngozi.obi@gmail.com',  '+2348062222222', '7 Marina Rd, Abuja',       'Chidi Obi'),
('Segun',   'Adeyemi', '2000-11-05', 1, 3,    'segun.a@yahoo.com',    '+2348063333333', '45 Allen Ave, Ikeja',      'Bisi Adeyemi'),
('Halima',  'Musa',    '1978-01-30', 2, 6,    'halima.m@gmail.com',   '+2348064444444', '3 Kano Close, Kano',       'Musa Ibrahim'),
('Chidi',   'Nwachukwu','1995-09-18',1, 1,    'chidi.n@outlook.com',  '+2348065555555', '88 Aba Rd, Port Harcourt', 'Ada Nwachukwu'),
('Aisha',   'Bello',   '2010-06-12', 2, NULL, NULL,                   '+2348066666666', '21 Wuse Zone 4, Abuja',    'Usman Bello');

INSERT INTO Appointment (PatientID, DoctorID, AppointmentDate, DurationMinutes, Status, Notes) VALUES
(1, 9, '2024-07-01 09:00:00', 45,  'Completed',  'Routine cardiac checkup'),
(2, 10, '2024-07-02 10:30:00', 60,  'Completed',  'Migraine follow-up'),
(3, 13, '2024-07-03 08:00:00', 30,  'Completed',  'Vaccination visit'),
(4, 11, '2024-07-04 14:00:00', 45,  'Cancelled',  'Patient request'),
(5, 10, '2024-07-05 11:00:00', 30,  'Completed',  'Chest pain evaluation'),
(6, 13, '2024-07-06 09:30:00', 20,  'Completed',  'Pediatric routine check'),
(1, 12, '2024-07-08 10:00:00', 30,  'Scheduled',  'Neurology referral'),
(3, 9, '2024-07-09 13:00:00', 60,  'Scheduled',  'Knee pain assessment');



-- ?????????????????????????????????????????
--  INSERT — Medical Records
-- ?????????????????????????????????????????

INSERT INTO MedicalRecord (PatientID, DoctorID, AppointmentID, Diagnosis, Treatment, Prescription, FollowUpDate) VALUES
(1, 11, 7, 'Mild hypertension',          'Lifestyle modification',      'Amlodipine 5mg daily',         '2024-08-01'),
(2, 12, 9, 'Chronic migraine',           'Rest and hydration',          'Sumatriptan 50mg as needed',   '2024-08-15'),
(3, 9, 5, 'Due for MMR vaccine',        'MMR administered',            NULL,                           NULL),
(5, 10, 8, 'Musculoskeletal chest pain', 'Physiotherapy recommended',   'Ibuprofen 400mg x 5 days',     '2024-07-20'),
(6, 13, 10, 'Healthy development',        'No intervention required',    NULL,                           '2025-01-06');


---------


INSERT INTO Doctor (FirstName, LastName, Email, PhoneNumber, LicenseNumber, DepartmentID, YearsExperience) VALUES
('James',   'Okafor',   'j.okafor@hospital.com',   '+2348011111111', 'LIC-10021', 1, 12),
('Amara',   'Nwosu',    'a.nwosu@hospital.com',    '+2348022222222', 'LIC-10022', 2,  8),
('Chukwu',  'Eze',      'c.eze@hospital.com',      '+2348033333333', 'LIC-10023', 3, 15),
('Fatima',  'Aliyu',    'f.aliyu@hospital.com',    '+2348044444444', 'LIC-10024', 4,  5),
('Emeka',   'Obiora',   'e.obiora@hospital.com',   '+2348055555555', 'LIC-10025', 5, 20);



INSERT INTO Patient (FirstName, LastName, DateOfBirth, GenderID, BloodTypeID, Email, PhoneNumber, Address, EmergencyContact) VALUES
('Tunde',   'Bakare',  '1990-03-15', 1, 5,    'tunde.b@gmail.com',    '+2348061111111', '12 Broad St, Lagos',       'Ngozi Bakare',   '+2348071111111'),
('Ngozi',   'Obi',     '1985-07-22', 2, 2,    'ngozi.obi@gmail.com',  '+2348062222222', '7 Marina Rd, Abuja',       'Chidi Obi',      '+2348072222222'),
('Segun',   'Adeyemi', '2000-11-05', 1, 3,    'segun.a@yahoo.com',    '+2348063333333', '45 Allen Ave, Ikeja',      'Bisi Adeyemi',   '+2348073333333'),
('Halima',  'Musa',    '1978-01-30', 2, 6,    'halima.m@gmail.com',   '+2348064444444', '3 Kano Close, Kano',       'Musa Ibrahim',   '+2348074444444'),
('Chidi',   'Nwachukwu','1995-09-18',1, 1,    'chidi.n@outlook.com',  '+2348065555555', '88 Aba Rd, Port Harcourt', 'Ada Nwachukwu',  '+2348075555555'),
('Aisha',   'Bello',   '2010-06-12', 2, NULL, NULL,                   '+2348066666666', '21 Wuse Zone 4, Abuja',    'Usman Bello',    '+2348076666666');


