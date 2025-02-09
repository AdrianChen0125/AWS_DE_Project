-- Create the database
CREATE DATABASE retail;

-- Create groups for role-based access control
CREATE GROUP transformer;
CREATE GROUP reader;

-- Create service users and assign them to groups
CREATE USER dbt_cloud
    PASSWORD 'Aks105001!' 
    IN GROUP transformer;

CREATE USER glue
    PASSWORD 'Aks105002!' 
    IN GROUP transformer;

CREATE USER quick_sight 
    PASSWORD 'Aks105003!'  -- Fixed missing '!' for consistency
    IN GROUP reader;

-- Grant permissions to the transformer group
GRANT CREATE, TEMPORARY ON DATABASE retail TO GROUP transformer; 

-- Create schemas with appropriate ownership
CREATE SCHEMA raw_data AUTHORIZATION admin;
CREATE SCHEMA staging AUTHORIZATION admin;
CREATE SCHEMA marts AUTHORIZATION admin;

-- Grant Glue Access to All Schemas
GRANT USAGE ON SCHEMA raw_data, staging, marts TO GROUP transformer;
GRANT SELECT ON ALL TABLES IN SCHEMA raw_data, staging, marts TO GROUP transformer;

-- Grant access to reader group for select permissions on marts schema (BI tools)
GRANT USAGE ON SCHEMA marts TO GROUP reader;
GRANT SELECT ON ALL TABLES IN SCHEMA marts TO GROUP reader;

-- Ensure future tables in marts schema are accessible to readers
ALTER DEFAULT PRIVILEGES IN SCHEMA marts;
GRANT SELECT ON TABLES TO GROUP reader;