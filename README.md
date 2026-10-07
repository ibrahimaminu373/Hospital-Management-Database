Hospital Management Database
A relational database schema for managing core hospital operations — patients, doctors, departments, appointments, and medical records — built in T-SQL (Microsoft SQL Server).
Tech Stack
Database engine: Microsoft SQL Server (T-SQL)
Schema Overview
Table	Purpose
`Department`	Hospital departments, each tied to a floor number
`Gender`	Lookup table for patient gender
`BloodType`	Lookup table for blood types (e.g. A+, O-)
`Patient`	Patient records — personal details, contact info, blood type, registration date
`Doctor`	Doctor records — license number, department, years of experience
`Appointment`	Links a patient to a doctor at a scheduled date/time, with status tracking
`MedicalRecord`	Diagnosis, treatment, and prescription tied to a specific appointment
Design Notes
A few constraints worth calling out, since they reflect deliberate data-integrity decisions rather than just a flat table dump:
No double-booking: a `UNIQUE` constraint on `(PatientID, DoctorID, AppointmentDate)` in `Appointment` prevents a patient from being booked with the same doctor at the same time twice.
Contact info enforcement: a `CHECK` constraint on `Patient` requires at least one of `Email` or `PhoneNumber` to be present.
Referential integrity: `Doctor.DepartmentID`, `Appointment.PatientID/DoctorID`, and `MedicalRecord.PatientID/DoctorID/AppointmentID` are all enforced via foreign keys.
One record per appointment: `MedicalRecord.AppointmentID` is `UNIQUE`, modeling a 1-to-1 relationship between an appointment and its resulting medical record.
Data validation: `CHECK` constraints guard against invalid data — e.g. a patient's `DateOfBirth` can't be in the future, `DurationMinutes` for an appointment must fall between 10 and 480, and `Appointment.Status` is restricted to a fixed set of values (`Scheduled`, `Completed`, `Cancelled`, `No-Show`).
Repository Contents
`database_schema.sql` — table definitions, constraints, and relationships
`insert_data.sql` — sample data for populating the schema
`Screenshort_Table_Output/` — screenshots of table outputs
How to Run
Run `database_schema.sql` in SQL Server Management Studio (or Azure Data Studio) to create the tables.
Run `insert_data.sql` to populate them with sample data.
Query away.
Status
Schema and sample data are in place. Query/reporting work (e.g. appointment analysis, doctor workload, patient history lookups) is in progress.
