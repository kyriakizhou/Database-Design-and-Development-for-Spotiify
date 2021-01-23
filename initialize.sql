\connect postgres

drop database if exists spotify;
create database spotify;

\connect spotify;

\i create.sql;

\i populate.sql;

\i show_all.sql;