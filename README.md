# CS306 – Pilates Studio Database Automation
## Triggers and Stored Procedures (Phase II)

MySQL-based database automation project for a Pilates Studio Management System (PSMS) developed for CS306 – Database Systems.

This phase focuses on enforcing business rules directly inside the database using:

- Triggers for automatic constraint enforcement
- Stored procedures for reusable workflow encapsulation

---

## Project Overview

The Pilates Studio Management System (PSMS) manages:

- Customer reservations
- Session capacity
- Instructor status
- Customer payments
- Package expiration dates

To ensure data consistency and integrity, the system enforces critical business rules at the database level using MySQL triggers and stored procedures.

---

## Implemented Features

### Triggers

1. Prevent Overbooking  
   Ensures session capacity is never exceeded.  
   Blocks insertion if confirmed reservations reach maximum capacity.

2. Automatic Payment Status Assignment  
   Sets payment status automatically based on inserted amount.  
   - "paid" if amount > 0  
   - "pending" otherwise  

3. Automatic Package Expiration  
   Automatically sets expiration date to:  
   purchase_date + 30 days  

---

### Stored Procedures

1. make_reservation(customer_id, session_id)  
   - Checks session capacity  
   - Inserts reservation safely  
   - Returns the created reservation ID  

2. activate_instructor(instructor_id, new_status)  
   - Updates instructor active status  
   - Returns confirmation message  

3. calculate_total_payments(customer_id)  
   - Computes total confirmed payments for a customer  
   - Returns aggregated result  

---

## Project Structure
## Project Structure

```
CS306_GROUP_34_HW2/
│
├── CS306_GROUP_34_HW2_REPORT.pdf
│
└── scripts/
    ├── stored_procedures/
    │   ├── stored_procedure_1.sql
    │   ├── stored_procedure_2.sql
    │   └── stored_procedure_3.sql
    │
    └── triggers/
        ├── trigger_1/
        ├── trigger_2/
        └── trigger_3/
```

Each trigger folder includes:
- SQL definition
- Before execution screenshots
- After execution screenshots

---

## How to Run

1. Create and select the schema:

```sql
CREATE DATABASE IF NOT EXISTS pilates_management_studio;
USE pilates_management_studio;
