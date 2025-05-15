# database-week-8-assignment
# Clinic Booking System

## Project Description

This project implements a **Clinic Booking System** database using MySQL. It models a real-world clinic environment with tables for departments, doctors, patients, appointments, treatments, prescriptions, and billing. The design follows relational database principles with proper normalization, constraints, and relationships to ensure data integrity and efficient management.

**Key Features:**
- Departments and doctors linked by department IDs.
- Patients and doctors linked via appointments.
- Treatments and prescriptions associated with appointments.
- Billing information tracked for each appointment.
- Supports common clinical operations like scheduling, treatment recording, and billing.

---

## Database Schema and Relationships

- **Departments** — Clinic departments like Cardiology, Pediatrics.
- **Doctors** — Linked to departments, storing contact info.
- **Patients** — Stores patient demographics and contacts.
- **Appointments** — Links patients and doctors with date/time and status.
- **Treatments** — Records clinical procedures done during appointments.
- **Prescriptions** — Medication details linked to treatments.
- **Billing** — Tracks payments and billing status for appointments.

![ERD Diagram]("C:\Users\Fluxtech Solutions\Documents\clinic ERP diagram.png")  
*(Replace the above URL with your ERD image link)*

---

## How to Run / Setup

1. **Prerequisites:**
   - MySQL Server installed and running
   - MySQL Workbench or any SQL client for executing SQL scripts

2. **Setup Instructions:**

   - Clone this repository:
     ```bash
     git clone https://github.com/yourusername/clinic-booking-system.git
     cd clinic-booking-system
     ```

   - Import the SQL file to your MySQL server:
     - Using MySQL Workbench: Open `clinic_booking_system.sql` and run all queries.
     - Or command line:
       ```bash
       mysql -u your_username -p your_database < clinic_booking_system.sql
       ```

3. **Verify Data:**

   After importing, you can run queries such as:
   ```sql
   SELECT * FROM Patients;
   SELECT * FROM Doctors;
   SELECT * FROM Appointments WHERE Status = 'Scheduled';
