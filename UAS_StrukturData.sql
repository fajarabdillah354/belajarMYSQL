create database fajar111;
use fajar111;

create table fajarUAS(
idvideo varchar(10) not null,
judul text not null,
creator text not null,
description longtext not null,
rating float not null,
viewer int(50) not null,
alamatvideo varchar(50)

)engine = InnoDB;

create table user(
id int not null auto_increment,
username varchar(50) not null,
password text not null,
extend text not null,
status  varchar(50) not null,
primary key(id)

)engine = InnoDB;

alter table fajaruas
modify rating float default 0;
alter table fajaruas
modify viewer int default 0;
update user
set status = "admin"
where id = 1;

update user
set status = "admin"
where id = 4;

select *from fajaruas;
select *from user;
show tables;
desc user;
select *from user;
desc fajaruas;
select *from fajaruas;