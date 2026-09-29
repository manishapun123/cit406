-- University Club Management System
-- seed.sql

INSERT INTO STUDENT
(student_id, first_name, last_name, email, major, phone)
VALUES
(1, 'John', 'Smith', 'john.smith@example.com', 'Information Technology', '305-555-1001'),
(2, 'Maria', 'Garcia', 'maria.garcia@example.com', 'Computer Science', '305-555-1002'),
(3, 'David', 'Lee', 'david.lee@example.com', 'Cybersecurity', '305-555-1003'),
(4, 'Sarah', 'Johnson', 'sarah.johnson@example.com', 'Information Technology', '305-555-1004');

INSERT INTO CLUB
(club_id, club_name, description, meeting_day, meeting_location)
VALUES
(1, 'Technology Club', 'Technology and programming activities', 'Monday', 'Room 101'),
(2, 'Cybersecurity Club', 'Cybersecurity learning and activities', 'Wednesday', 'Room 202'),
(3, 'Programming Club', 'Programming and software development activities', 'Friday', 'Room 303');

INSERT INTO MEMBERSHIP
(membership_id, student_id, club_id, join_date, membership_role, status)
VALUES
(1, 1, 1, '2026-09-01', 'Member', 'Active'),
(2, 2, 1, '2026-09-02', 'President', 'Active'),
(3, 3, 2, '2026-09-03', 'Member', 'Active'),
(4, 4, 3, '2026-09-04', 'Member', 'Active');

INSERT INTO EVENT
(event_id, club_id, event_name, event_date, location)
VALUES
(1, 1, 'Technology Workshop', '2026-09-15', 'Room 101'),
(2, 2, 'Cybersecurity Seminar', '2026-09-20', 'Room 202'),
(3, 3, 'Programming Workshop', '2026-09-25', 'Room 303');

INSERT INTO ATTENDANCE
(attendance_id, student_id, event_id, attendance_date, attendance_status)
VALUES
(1, 1, 1, '2026-09-15', 'Present'),
(2, 2, 1, '2026-09-15', 'Present'),
(3, 3, 2, '2026-09-20', 'Present'),
(4, 4, 3, '2026-09-25', 'Present');