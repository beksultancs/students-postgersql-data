create table laptops
(
    id     serial,
    brand  varchar,
    name   varchar,
    memory int,
    primary key (id)
);

drop table laptops;

create sequence laptops_id_generator
    start 10
    increment 2
    minvalue 10
    owned by laptops.id;


insert into laptops (id, brand, name, memory)
values (nextval('laptops_id_generator'), 'HP', 'Probook', 256),
       (nextval('laptops_id_generator'), 'Acer', 'Swift', 512);

select *
from laptops;

-- * = all

select *
from students
where age = 30;

select *
from students
where university = 'Universität Erfurt';

select university, count(*)
from students
group by university
order by count(*) desc;

select id         as student_id,
       first_name as name,
       last_name  as surname
from students
where university = 'Capital University of Medical Sciences';

select *
from students
where age <> 30
order by age;

-- <> = !=
select *
from students
where email like '%@google%';

select *
from students
where first_name ilike 'kA%';

select *
from students
where first_name ilike 'E%'
  and first_name ilike '%e';

select *
from students
where university not in ('University of Tennessee - Chattanooga',
                         'Merlimau Polytechnic',
                         'Colorado State University-Pueblo',
                         'Sabzevar Teacher Training University',
                         'University of San Jose Recoletos');

select *
from students
where age between 30 and 40;

select *
from students
where age >= 30
  and age <= 40;

select *
from students
where length(first_name) between 3 and 5;

select *
from students
where email is not null;

insert into students (id, first_name, last_name, email, university, age)
values (23456, 'Lucho', 'Betje', null, 'University of Tennessee - Chattanooga', 23);
insert into students (id, first_name, last_name, email, university, age)
values (3456, 'Shaylah', 'Savins', null, 'Merlimau Polytechnic', 44);

select round(avg(age))
from students;

select *
from students
where age > (select round(avg(age)) from students);

select *
from students
where age = (select max(age) from students);

select
       first_name,
       age - (select round(avg(age)) from students) as differenceWithAVGAge
from students;

select *
from students
where age = 50;

select *
from students
order by first_name desc;

-- asc = default
-- desc

select *
from students
order by age desc;

select *
from students
where age < 30
order by age;




