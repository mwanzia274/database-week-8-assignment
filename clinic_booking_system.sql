-- =============================
-- Clinic Booking System Database
-- Final Project
-- =============================

-- Create and select the database
CREATE DATABASE IF NOT EXISTS clinicdb;
USE clinicdb;

-- Drop tables if they exist to reset database (useful during development)
DROP TABLE IF EXISTS Billing;
DROP TABLE IF EXISTS Prescriptions;
DROP TABLE IF EXISTS Treatments;
DROP TABLE IF EXISTS Appointments;
DROP TABLE IF EXISTS Patients;
DROP TABLE IF EXISTS Doctors;
DROP TABLE IF EXISTS Departments;

-- =============================
-- Table: Departments
-- Stores department details (e.g., Cardiology, Pediatrics)
-- =============================
CREATE DATABASE IF NOT EXISTS clinicdb;
USE clinicdb;

CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    Location VARCHAR(100) NOT NULL
);

-- =============================
-- Table: Doctors
-- Stores doctors' personal and department information
-- =============================
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(20),
    DepartmentID INT NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =============================
-- Table: Patients
-- Stores patient details
-- =============================
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender ENUM('M', 'F', 'Other') NOT NULL,
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100)
);

-- =============================
-- Table: Appointments
-- Links patients with doctors and appointment details
-- =============================
CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    Status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =============================
-- Table: Treatments
-- Records treatments provided during appointments
-- =============================
CREATE TABLE Treatments (
    TreatmentID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT NOT NULL,
    TreatmentDescription TEXT NOT NULL,
    TreatmentDate DATE NOT NULL,
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =============================
-- Table: Prescriptions
-- Records medications prescribed during treatments
-- =============================
CREATE TABLE Prescriptions (
    PrescriptionID INT AUTO_INCREMENT PRIMARY KEY,
    TreatmentID INT NOT NULL,
    MedicationName VARCHAR(100) NOT NULL,
    Dosage VARCHAR(50),
    Duration VARCHAR(50),
    FOREIGN KEY (TreatmentID) REFERENCES Treatments(TreatmentID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =============================
-- Table: Billing
-- Records billing information for appointments
-- =============================
CREATE TABLE Billing (
    BillingID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    BillingDate DATE NOT NULL,
    PaymentStatus ENUM('Pending', 'Paid') DEFAULT 'Pending',
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =============================
-- Sample Data Insertion
-- =============================

-- Insert Departments
INSERT INTO Departments (DepartmentName, Location) VALUES
('Cardiology', 'Block A'),
('Pediatrics', 'Block B'),
('Neurology', 'Block C'),
('General Medicine', 'Block D');

-- Insert Doctors
INSERT INTO Doctors (FirstName, LastName, Email, PhoneNumber, DepartmentID) VALUES
('John', 'Smith', 'john.smith@clinic.com', '555-1001', 1),
('Mary', 'Johnson', 'mary.johnson@clinic.com', '555-1002', 2),
('David', 'Lee', 'david.lee@clinic.com', '555-1003', 3),
('Emma', 'Davis', 'emma.davis@clinic.com', '555-1004', 4);

-- Insert Patients
INSERT INTO Patients (FirstName, LastName, DateOfBirth, Gender, PhoneNumber, Email) VALUES
('Alice', 'Brown', '1990-02-15', 'F', '555-2001', 'alice.brown@example.com'),
('Bob', 'Wilson', '1985-06-30', 'M', '555-2002', 'bob.wilson@example.com'),
('Charlie', 'Garcia', '2000-09-20', 'M', '555-2003', 'charlie.garcia@example.com'),
('Diana', 'Martinez', '1975-12-05', 'F', '555-2004', 'diana.martinez@example.com');

-- Insert Appointments
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime, Status) VALUES
(1, 1, '2025-06-01', '09:00:00', 'Scheduled'),
(2, 2, '2025-06-01', '10:30:00', 'Completed'),
(3, 3, '2025-06-02', '11:00:00', 'Cancelled'),
(4, 4, '2025-06-03', '14:00:00', 'Scheduled');

-- Insert Treatments
INSERT INTO Treatments (AppointmentID, TreatmentDescription, TreatmentDate) VALUES
(1, 'Routine heart check-up', '2025-06-01'),
(2, 'Vaccination and general pediatric exam', '2025-06-01'),
(4, 'Physical examination and blood tests', '2025-06-03');

-- Insert Prescriptions (corrected TreatmentID 4 -> 3)
INSERT INTO Prescriptions (TreatmentID, MedicationName, Dosage, Duration) VALUES
(1, 'Aspirin', '100 mg daily', '30 days'),
(2, 'Flu Vaccine', '1 dose', 'N/A'),
(3, 'Vitamin D', '2000 IU daily', '60 days');

-- Insert Billing
INSERT INTO Billing (AppointmentID, Amount, BillingDate, PaymentStatus) VALUES
(1, 150.00, '2025-06-02', 'Paid'),
(2, 100.00, '2025-06-02', 'Paid'),
(4, 200.00, '2025-06-04', 'Pending');

-- =============================
-- End of Script
-- =============================
