-- University Club Management System
-- File: queries/query_portfolio.sql
-- Purpose: Query portfolio for common club management reports.

-- Query 1: List all students.
SELECT student_id, first_name, last_name, email, major, phone
FROM student
ORDER BY last_name, first_name;

-- Query 2: List clubs and their meeting details.
SELECT club_id, club_name, meeting_day, meeting_location
FROM club
ORDER BY club_name;

-- Query 3: Show students and the clubs they joined.
SELECT s.student_id, s.first_name, s.last_name,
       c.club_name, m.join_date, m.membership_role, m.status
FROM student s
JOIN membership m ON s.student_id = m.student_id
JOIN club c ON m.club_id = c.club_id
ORDER BY c.club_name, s.last_name;

-- Query 4: Count members in each club.
SELECT c.club_id, c.club_name, COUNT(m.membership_id) AS member_count
FROM club c
LEFT JOIN membership m ON c.club_id = m.club_id
GROUP BY c.club_id, c.club_name
ORDER BY member_count DESC, c.club_name;

-- Query 5: List events with their club names.
SELECT e.event_id, e.event_name, e.event_date, e.location,
       c.club_name
FROM event e
JOIN club c ON e.club_id = c.club_id
ORDER BY e.event_date;

-- Query 6: Show attendance details for events.
SELECT e.event_name, e.event_date,
       s.first_name, s.last_name,
       a.attendance_date, a.attendance_status
FROM attendance a
JOIN student s ON a.student_id = s.student_id
JOIN event e ON a.event_id = e.event_id
ORDER BY e.event_date, s.last_name;

-- Query 7: Count attendance records for each event.
SELECT e.event_id, e.event_name,
       COUNT(a.attendance_id) AS attendance_count
FROM event e
LEFT JOIN attendance a ON e.event_id = a.event_id
GROUP BY e.event_id, e.event_name
ORDER BY attendance_count DESC;

-- Query 8: Find active club memberships.
SELECT s.first_name, s.last_name, c.club_name,
       m.join_date, m.membership_role
FROM membership m
JOIN student s ON m.student_id = s.student_id
JOIN club c ON m.club_id = c.club_id
WHERE LOWER(m.status) = 'active'
ORDER BY c.club_name, s.last_name;
