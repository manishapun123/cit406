-- University Club Management System
-- File: security/security_policies.sql
-- Purpose: Define database roles, permissions, and row-level security.
-- Run as a PostgreSQL administrator or database owner.

-- Create application roles if they do not already exist.
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_roles WHERE rolname = 'club_readonly'
    ) THEN
        CREATE ROLE club_readonly NOLOGIN;
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM pg_roles WHERE rolname = 'club_staff'
    ) THEN
        CREATE ROLE club_staff NOLOGIN;
    END IF;
END
$$;

-- Allow the roles to connect to the database and use public schema.
-- Replace club_database with your actual database name before running.
-- GRANT CONNECT ON DATABASE club_database TO club_readonly, club_staff;

GRANT USAGE ON SCHEMA public TO club_readonly, club_staff;

-- Read-only access to the main tables and reporting views.
GRANT SELECT ON
    student, club, membership, event, attendance,
    active_club_members, event_attendance_summary
TO club_readonly;

-- Staff can read and maintain the main project tables.
GRANT SELECT, INSERT, UPDATE, DELETE ON
    student, club, membership, event, attendance
TO club_staff;

-- Allow staff to read audit history, but not modify it directly.
GRANT SELECT ON membership_audit TO club_staff;

-- Enable row-level security on membership.
ALTER TABLE membership ENABLE ROW LEVEL SECURITY;

-- Example policy: staff role can access membership rows.
DROP POLICY IF EXISTS membership_staff_access ON membership;

CREATE POLICY membership_staff_access
ON membership
FOR ALL
TO club_staff
USING (true)
WITH CHECK (true);

-- Note:
-- These are database roles, not login accounts.
-- A database administrator must grant these roles to actual login users.
-- Row-level security policies should be tailored if students must see
-- only their own records rather than all membership rows.
