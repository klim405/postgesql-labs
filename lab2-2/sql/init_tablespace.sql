CREATE TABLESPACE qnz7 LOCATION '/var/db/postgres2/qnz7';

UPDATE pg_database SET datistemplate = false WHERE datname = 'template1';
CREATE DATABASE temp1 TEMPLATE template1 TABLESPACE qnz7;
DROP DATABASE template1;
CREATE DATABASE template1 TEMPLATE temp1 TABLESPACE qnz7;
DROP DATABASE temp1;
CREATE DATABASE sickgreenhair TEMPLATE template0 TABLESPACE qnz7;
CREATE USER user0 WITH PASSWORD 'password';
GRANT ALL ON DATABASE sickgreenhair TO user0;
