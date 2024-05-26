CREATE TABLESPACE qnz7 LOCATION '/var/db/postgres2/qnz7';

CREATE DATABASE sickgreenhair TEMPLATE template0 TABLESPACE qnz7;
CREATE USER user0 WITH PASSWORD 'password';
GRANT ALL ON DATABASE sickgreenhair TO user0;
