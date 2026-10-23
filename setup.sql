
-- University Club Management System
-- File: setup.sql
-- Purpose: Create and populate the database project.
-- Run this script in a new, empty PostgreSQL database.

-- Step 1: Create the five project tables.
\i schema.sql

-- Step 2: Insert sample data.
\i seed.sql

-- Step 3: Create views, audit table, function, and trigger.
\i logic/views_functions_triggers.sql

-- Step 4: Create indexes.
\i indexes/indexes.sql

-- Step 5: Configure roles, permissions, and row-level security.
\i security/security_policies.sql

-- Step 6: Run the query portfolio separately when needed.
-- See queries/query_portfolio.sql
