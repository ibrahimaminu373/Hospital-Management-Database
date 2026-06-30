CREATE TABLE Department (
  DepartmentID INT PRIMARY KEY IDENTITY(1,  1),
  DepartmentName VARCHAR(100) NOT NULL UNIQUE,
  FloorNumber TINYINT   NOT NULL CHECK(FloorNumber BETWEEN 1 and 20)
);

CREATE TABLE Gender (
    GenderID    TINYINT      PRIMARY KEY,
    GenderName  VARCHAR(10)  NOT NULL UNIQUE
);

CREATE TABLE BloodType (
    BloodTypeID   TINYINT     PRIMARY KEY,
    BloodTypeName VARCHAR(5)  NOT NULL UNIQUE  -- e.g. 'A+', 'O-'
);

CREATE TABLE Patient (
   PatientID INT PRIMARY KEY IDENTITY(1, 1),
   FirstName VARCHAR(50) NOT NULL,
   LastName VARCHAR(50) NOT NULL,
   DateOfBirth DATE NOT NULL
       CHECK (DateOfBirth <= CAST(GETDATE() AS Date)),
   GenderID TINYINT NOT NULL REFERENCES Gender(GenderID),
   BloodTypeID TINYINT REFERENCES BloodType(BloodTypeID),
   Email VARCHAR(150) UNIQUE,
   PhoneNumber CHAR(15),
   Address VARCHAR(255),
   EmergencyContact VARCHAR(100) NOT NULL,
   IsActive BIT NOT NULL DEFAULT 1,
   RegisteredAt DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
   CONSTRAINT CHK_Pat ient_Contact 
       CHECK (Email IS NOT NULL OR PhoneNumber IS NOT NULL)
);

CREATE TABLE Doctor (
    DoctorID         INT           PRIMARY KEY IDENTITY(1,1),
    FirstName        VARCHAR(50)   NOT NULL,
    LastName         VARCHAR(50)   NOT NULL,
    Email            VARCHAR(150)  NOT NULL UNIQUE,
    PhoneNumber      VARCHAR(15)   NOT NULL UNIQUE
                                   CHECK (PhoneNumber NOT LIKE '%[^0-9+\-() ]%'),
    LicenseNumber    VARCHAR(20)   NOT NULL UNIQUE,
    DepartmentID     INT           NOT NULL
                                   REFERENCES Department(DepartmentID),
    YearsExperience  TINYINT       NOT NULL DEFAULT 0
                                   CHECK (YearsExperience >= 0),
    IsActive         BIT           NOT NULL DEFAULT 1,
    CreatedAt        DATETIME2     NOT NULL DEFAULT SYSDATETIME()
);


CREATE TABLE Appointment (
    AppointmentID   INT         PRIMARY KEY IDENTITY(1,1),
    PatientID       INT         NOT NULL
                                REFERENCES Patient(PatientID),
    DoctorID        INT         NOT NULL
                                REFERENCES Doctor(DoctorID),
    AppointmentDate DATETIME2   NOT NULL,
    DurationMinutes SMALLINT    NOT NULL DEFAULT 30
                                CHECK (DurationMinutes BETWEEN 10 AND 480),
    Status          VARCHAR(20) NOT NULL DEFAULT 'Scheduled'
                                CHECK (Status IN ('Scheduled','Completed',
                                                  'Cancelled','No-Show')),
    Notes           VARCHAR(500),
    CreatedAt       DATETIME2   NOT NULL DEFAULT SYSDATETIME(),

    -- a patient can't have two appointments with the same doctor at the same time
    CONSTRAINT UQ_Appointment_PatientDoctorTime
        UNIQUE (PatientID, DoctorID, AppointmentDate)
);

CREATE TABLE MedicalRecord (
    RecordID        INT           PRIMARY KEY IDENTITY(1,1),
    PatientID       INT           NOT NULL
                                  REFERENCES Patient(PatientID),
    DoctorID        INT           NOT NULL
                                  REFERENCES Doctor(DoctorID),
    AppointmentID   INT           UNIQUE          -- 1-to-1 with appointment
                                  REFERENCES Appointment(AppointmentID),
    Diagnosis       VARCHAR(500)  NOT NULL,
    Treatment       VARCHAR(500),
    Prescription    VARCHAR(500),
    RecordDate      DATETIME2     NOT NULL DEFAULT SYSDATETIME(),
    FollowUpDate    DATE
);

