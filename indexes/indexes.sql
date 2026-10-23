-- University Club Management System
-- File: indexes/indexes.sql
-- Purpose: Improve performance for common joins and lookups.
-- PostgreSQL automatically indexes primary keys and UNIQUE constraints.

-- Support joins from membership to student and club.
CREATE INDEX IF NOT EXISTS idx_membership_student_id
    ON membership(student_id);

CREATE INDEX IF NOT EXISTS idx_membership_club_id
    ON membership(club_id);

-- Support event listings by club and date.
CREATE INDEX IF NOT EXISTS idx_event_club_id
    ON event(club_id);

CREATE INDEX IF NOT EXISTS idx_event_event_date
    ON event(event_date);

-- Support attendance lookups by student and event.
CREATE INDEX IF NOT EXISTS idx_attendance_student_id
    ON attendance(student_id);

CREATE INDEX IF NOT EXISTS idx_attendance_event_id
    ON attendance(event_id);

-- Support filtering memberships by status.
CREATE INDEX IF NOT EXISTS idx_membership_status
    ON membership(status);
