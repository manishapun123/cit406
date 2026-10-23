# University Club Management System
## Data Dictionary

This document describes all five tables in the PostgreSQL database.

## 1. STUDENT

**Purpose:** Stores information about students who participate in university clubs.

- `student_id` — INTEGER, primary key. Uniquely identifies each student. Required.
- `first_name` — VARCHAR(50), student's first name. Required.
- `last_name` — VARCHAR(50), student's last name. Required.
- `email` — VARCHAR(100), student's email address. Required and unique.
- `major` — VARCHAR(100), student's academic major. Optional.
- `phone` — VARCHAR(20), student's contact phone number. Optional.

## 2. CLUB

**Purpose:** Stores information about university clubs.

- `club_id` — INTEGER, primary key. Uniquely identifies each club. Required.
- `club_name` — VARCHAR(100), name of the club. Required.
- `description` — TEXT, description of the club. Optional.
- `meeting_day` — VARCHAR(20), regular meeting day. Optional.
- `meeting_location` — VARCHAR(100), regular meeting location. Optional.

## 3. MEMBERSHIP

**Purpose:** Connects students with clubs and records their membership details.

- `membership_id` — INTEGER, primary key. Uniquely identifies each membership. Required.
- `student_id` — INTEGER, foreign key referencing `STUDENT.student_id`. Required. Updates and deletions cascade from the referenced student.
- `club_id` — INTEGER, foreign key referencing `CLUB.club_id`. Required. Updates and deletions cascade from the referenced club.
- `join_date` — DATE, date the student joined the club. Required.
- `membership_role` — VARCHAR(50), role held by the student in the club. Optional.
- `status` — VARCHAR(30), membership status, such as active or inactive. Optional.

## 4. EVENT

**Purpose:** Stores events organized by clubs.

- `event_id` — INTEGER, primary key. Uniquely identifies each event. Required.
- `club_id` — INTEGER, foreign key referencing `CLUB.club_id`. Required. Updates and deletions cascade from the referenced club.
- `event_name` — VARCHAR(100), name of the event. Required.
- `event_date` — DATE, date the event takes place. Required.
- `location` — VARCHAR(100), location of the event. Optional.

## 5. ATTENDANCE

**Purpose:** Records student attendance at club events.

- `attendance_id` — INTEGER, primary key. Uniquely identifies each attendance record. Required.
- `student_id` — INTEGER, foreign key referencing `STUDENT.student_id`. Required. Updates and deletions cascade from the referenced student.
- `event_id` — INTEGER, foreign key referencing `EVENT.event_id`. Required. Updates and deletions cascade from the referenced event.
- `attendance_date` — DATE, date attendance was recorded. Required.
- `attendance_status` — VARCHAR(30), attendance status, such as present or absent. Optional.

## Relationships

- One student can have many membership records.
- One club can have many membership records.
- Students and clubs have a many-to-many relationship resolved by MEMBERSHIP.
- One club can organize many events.
- One student can have many attendance records.
- One event can have many attendance records.
- ATTENDANCE connects students and events.

## Additional Database Objects

- `active_club_members` — View of active memberships with student and club details.
- `event_attendance_summary` — View summarizing attendance by event.
- `membership_audit` — Records membership inserts, updates, and deletes.
- `membership_audit_trigger` — Trigger that writes membership changes to the audit table.
- `audit_membership_changes()` — Trigger function used by the audit trigger.

## Indexes and Security

Indexes support membership joins, event searches, attendance lookups, and membership-status filtering. Database roles `club_readonly` and `club_staff` define example read-only and staff permissions. Row-level security is enabled on MEMBERSHIP.

Refer to `schema.sql`, `indexes/indexes.sql`, `logic/views_functions_triggers.sql`, and `security/security_policies.sql` for implementation details.
