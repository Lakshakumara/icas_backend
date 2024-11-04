-- V1__Insert_initial_roles.sql

INSERT INTO roles (role)
SELECT 'user' WHERE NOT EXISTS (SELECT 1 FROM roles WHERE role = 'user');
INSERT INTO roles (role)
SELECT 'admin' WHERE NOT EXISTS (SELECT 1 FROM roles WHERE role = 'admin');
INSERT INTO roles (role)
SELECT 'GADHead' WHERE NOT EXISTS (SELECT 1 FROM roles WHERE role = 'GADHead');
INSERT INTO roles (role)
SELECT 'DepHead' WHERE NOT EXISTS (SELECT 1 FROM roles WHERE role = 'DepHead');
INSERT INTO roles (role)
SELECT 'mo' WHERE NOT EXISTS (SELECT 1 FROM roles WHERE role = 'mo');
INSERT INTO roles (role)
SELECT 'mec' WHERE NOT EXISTS (SELECT 1 FROM roles WHERE role = 'mec');
INSERT INTO roles (role)
SELECT 'superAdmin' WHERE NOT EXISTS (SELECT 1 FROM roles WHERE role = 'superAdmin');
