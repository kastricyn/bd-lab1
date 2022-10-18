-- -- Скопировать и исполнить полученные строки для удаления всех таблиц схемы
-- select 'drop table if exists "' || tablename || '" cascade;' 
--   from pg_tables
--  where schemaname = 's311734';

-- -- или если есть права
-- DROP SCHEMA IF EXISTS s311734 CASCADE;
-- CREATE SCHEMA s311734;

set schema 's311734';
drop table if exists "direction" cascade;
drop table if exists "people" cascade;
drop table if exists "research" cascade;
drop table if exists "city" cascade;
drop table if exists "input-output" cascade;
drop table if exists "location" cascade;
drop table if exists "passport" cascade;
drop table if exists "location-type" cascade;
drop table if exists "build" cascade;