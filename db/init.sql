CREATE DATABASE theater_prod;
CREATE DATABASE theater_dev;
CREATE DATABASE theater_test;
GRANT ALL PRIVILEGES ON DATABASE theater_prod TO rails;
GRANT ALL PRIVILEGES ON DATABASE theater_dev TO rails;
GRANT ALL PRIVILEGES ON DATABASE theater_test TO rails;