-- 1. Crear el usuario (el esquema de tu ecommerce)
CREATE USER ecommerce_olist IDENTIFIED BY "ecommerce_olist";

-- 2. Asignar cuota de almacenamiento (Ilimitada para pruebas)
ALTER USER ecommerce_olist QUOTA UNLIMITED ON USERS;

-- 3. Darle permisos básicos para trabajar
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE SEQUENCE, CREATE PROCEDURE TO ecommerce_olist;