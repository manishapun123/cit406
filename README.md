# CIT 406 – University Club Management System

## Project Overview

The University Club Management System is a relational database project designed to manage university students, clubs, memberships, events, and attendance.

This project was developed for CIT 406 Database Design using PostgreSQL, Supabase, and pgAdmin.

## Database Tables

The database contains five main tables:

- **STUDENT:** Stores student information, including name, email, major, and phone number.
- **CLUB:** Stores club names, descriptions, meeting days, and meeting locations.
- **MEMBERSHIP:** Connects students to clubs and records join dates, roles, and membership status.
- **EVENT:** Stores club events, dates, and locations.
- **ATTENDANCE:** Records student attendance at events.

Primary keys identify each record, and foreign keys connect related tables. The database uses constraints to help maintain data integrity.

## Entity Relationship Diagram (ERD)

The ERD illustrates the five database entities and their relationships.

The editable ERD file is located at:

`docs/University_Club_Management_ERD.drawio`

The data dictionary is available at:

data_dictionary.md

## Repository Structure

- `schema.sql` – Creates the database tables.
- `seed.sql` – Contains sample data.
- `migrations/001_initial_schema.sql` – Initial database schema migration.
- `queries/query_portfolio.sql` – SQL queries for retrieving and analyzing data.
- `logic/views_functions_triggers.sql` – Views, functions, and membership audit trigger.
- `indexes/indexes.sql` – Indexes to support query performance.
- `security/security_policies.sql` – Database roles, grants, and row-level security configuration.
- data_dictionary.md – Table and column descriptions.
- `docs/University_Club_Management_ERD.drawio` – Editable ERD diagram.
- `screenshots/` – Project screenshots, when available.

## Requirements

- PostgreSQL
- Supabase or pgAdmin
- A database account with sufficient permissions to create tables, functions, triggers, indexes, and roles

## Setup Instructions

1. Create a new PostgreSQL database or Supabase project.
2. Run `schema.sql` to create the five database tables. Alternatively, use `migrations/001_initial_schema.sql` for a fresh database. Do not run both because they create the same tables.
3. Run `seed.sql` to insert the sample data.
4. Run `logic/views_functions_triggers.sql` to create the views, audit table, function, and trigger.
5. Run `indexes/indexes.sql` to create the indexes.
6. Run `security/security_policies.sql` using an account with the necessary permissions.
7. Run `queries/query_portfolio.sql` to test the database queries.

Run these scripts in a fresh database and review their contents before execution. The security script creates database roles that may need to be granted to appropriate login users separately.

## Project Goals

- Organize university club information in a relational database.
- Maintain relationships between students, clubs, memberships, events, and attendance.
- Retrieve information using SQL queries.
- Improve query performance with indexes.
- Demonstrate database views, functions, triggers, and access controls.

## Author

CIT 406 Database Design Project
