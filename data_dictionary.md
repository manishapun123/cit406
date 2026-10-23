# Data Dictionary – University Club Management System

## 1. STUDENT

Stores information about university students.

- `student_id` — Primary key; uniquely identifies each student.
- `first_name` — Student's first name; required.
- `last_name` — Student's last name; required.
- `email` — Student's email address; required and unique.
- `major` — Student's academic major.
- `phone` — Student's phone number.

## 2. CLUB

Stores information about university clubs.

- `club_id` — Primary key; uniquely identifies each club.
- `club_name` — Name of the club; required.
- `description` — Description of the club.
- `meeting_day` — Regular meeting day.
- `meeting_location` — Location of club meetings.

## 3. MEMBERSHIP

Connects students with the clubs they join.

- `membership_id` — Primary key; uniquely identifies each membership.
- `student_id` — Foreign key referencing `STUDENT.student_id`; required.
- `club_id` — Foreign key referencing `CLUB.club_id`; required.
- `join_date` — Date the student joined; required.
- `membership_role` — Student's role in the club.
- `status` — Membership status.

## 4. EVENT

Stores events organized by clubs.

- `event_id` — Primary key; uniquely identifies each event.
- `club_id` — Foreign key referencing `CLUB.club_id`; required.
- `event_name` — Name of the event; required.
- `event_date` — Date of the event; required.
- `location` — Location of the event.

## 5. ATTENDANCE

Records student attendance at events.

- `attendance_id` — Primary key; uniquely identifies each attendance record.
- `student_id` — Foreign key referencing `STUDENT.student_id`; required.
- `event_id` — Foreign key referencing `EVENT.event_id`; required.
- `attendance_date` — Date attendance was recorded; required.
- `attendance_status` — Attendance status.

## Relationships

- One student can have multiple membership records.
- One club can have multiple membership records.
- One club can organize multiple events.
- One student can have multiple attendance records.
- One event can have multiple attendance records.

The `MEMBERSHIP` table resolves the many-to-many relationship between students and clubs. The `ATTENDANCE` table connects students and events.

## Database Constraints

- Primary keys uniquely identify records.
- Foreign keys maintain relationships between tables.
- Student email addresses must be unique.
- Required columns use `NOT NULL` constraints.
- Foreign keys use `ON UPDATE CASCADE` and `ON DELETE CASCADE`.
