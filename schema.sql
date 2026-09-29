-- University Club Management System
-- schema.sql

CREATE TABLE STUDENT (
    student_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    major VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE CLUB (
    club_id INTEGER PRIMARY KEY,
    club_name VARCHAR(100) NOT NULL,
    description TEXT,
    meeting_day VARCHAR(20),
    meeting_location VARCHAR(100)
);

CREATE TABLE MEMBERSHIP (
    membership_id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    club_id INTEGER NOT NULL,
    join_date DATE NOT NULL,
    membership_role VARCHAR(50),
    status VARCHAR(30),

    CONSTRAINT fk_membership_student
        FOREIGN KEY (student_id)
        REFERENCES STUDENT(student_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_membership_club
        FOREIGN KEY (club_id)
        REFERENCES CLUB(club_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE EVENT (
    event_id INTEGER PRIMARY KEY,
    club_id INTEGER NOT NULL,
    event_name VARCHAR(100) NOT NULL,
    event_date DATE NOT NULL,
    location VARCHAR(100),

    CONSTRAINT fk_event_club
        FOREIGN KEY (club_id)
        REFERENCES CLUB(club_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE ATTENDANCE (
    attendance_id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    event_id INTEGER NOT NULL,
    attendance_date DATE NOT NULL,
    attendance_status VARCHAR(30),

    CONSTRAINT fk_attendance_student
        FOREIGN KEY (student_id)
        REFERENCES STUDENT(student_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_attendance_event
        FOREIGN KEY (event_id)
        REFERENCES EVENT(event_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);