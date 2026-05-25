/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'datawarehouse' after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
    within the database: 'bronze', 'silver', and 'gold'.

WARNING:
    Running this script will drop the entire 'datawarehouse' database if it exists.
    All data in the database will be permanently deleted. Proceed with caution
    and ensure you have proper backups before running this script.
*/

-- ============================================================
-- STEP 1: Connect to the default 'postgres' database first
-- (you cannot drop a database you are currently connected to)
-- ============================================================
\c postgres

-- Terminate any active connections to 'datawarehouse'
-- (equivalent to SQL Server's SINGLE_USER WITH ROLLBACK IMMEDIATE)
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'datawarehouse'
  AND pid <> pg_backend_pid();

-- Drop the database if it exists
DROP DATABASE IF EXISTS datawarehouse;

-- Create the 'datawarehouse' database
CREATE DATABASE datawarehouse;

-- ============================================================
-- STEP 2: Switch connection to the new database
-- ============================================================
\c datawarehouse

-- Create Schemas
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
