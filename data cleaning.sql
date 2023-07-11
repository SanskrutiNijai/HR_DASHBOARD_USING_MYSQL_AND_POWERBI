create database hrproject;
use hrproject;
select * from hr;
select birthdate from hr;
set sql_safe_updates = 0;
update hr
set birthdate = case
  when birthdate like '%/%' then date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
  when birthdate like '%-%' then date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
  else null
end;  
alter table hr
change column birthdate birth_date text;
alter table hr
change column ï»¿id emp_id varchar(20);
describe hr;

update hr
set hire_date = case
  when hire_date like '%/%' then date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
  when hire_date like '%-%' then date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
  else null
end; 
select * from hr;

alter table hr add column age int;
update hr
set age = timestampdiff(YEAR, birth_date,CURDATE());
select birth_date,age from hr;

select min(age) as Youngest, max(age) as Oldest from hr;
select count(*) from hr where age < 18;
