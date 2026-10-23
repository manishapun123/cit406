-- University Club Management System
-- File: migrations/001_initial_schema.sql
-- Purpose: Initial database schema migration.
-- Run once on a new PostgreSQL database.

CREATE TABLE student (
    student_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    major VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE club (
    club_id INTEGER PRIMARY KEY,
    club_name VARCHAR(100) NOT NULL,
    description TEXT,
    meeting_day VARCHAR(20),
    meeting_location VARCHAR(100)
);

CREATE TABLE membership (
    membership_id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    club_id INTEGER NOT NULL,
    join_date DATE NOT NULL,
    membership_role VARCHAR(50),
    status VARCHAR(30),
    CONSTRAINT fk_membership_student
        FOREIGN KEY (student_id)
        REFERENCES student(student_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_membership_club
        FOREIGN KEY (club_id)
        REFERENCES club(club_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE event (
    event_id INTEGER PRIMARY KEY,
    club_id INTEGER NOT NULL,
    event_name VARCHAR(100) NOT NULL,
    event_date DATE NOT NULL,
    location VARCHAR(100),
    CONSTRAINT fk_event_club
        FOREIGN KEY (club_id)
        REFERENCES club(club_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE attendance (
    attendance_id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    event_id INTEGER NOT NULL,
    attendance_date DATE NOT NULL,
    attendance_status VARCHAR(30),
    CONSTRAINT fk_attendance_student
        FOREIGN KEY (student_id)
        REFERENCES student(student_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_attendance_event
        FOREIGN KEY (event_id)
        REFERENCES event(event_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);
