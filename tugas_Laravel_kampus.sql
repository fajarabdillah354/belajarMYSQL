create database laravelKampus;
use laravelKampus;
create table BOOK(
ID_BUKU varchar(10) not null,
NAMA_BUKU varchar(50) not null,
NAMA_PENGARANG varchar(50) not null,
KATEGORI varchar(20) not null,
QTY int,
IMAGE varchar(50)

)engine = InnoDB;

insert into BOOK(ID_BUKU,NAMA_BUKU,NAMA_PENGARANG,KATEGORI,QTY,IMAGE)
values("IDN212","BUNGA RAMPAI PEMIKIRAN ISLAM","ISMAIL YUSANTO","KEISLAMAN",4,"bunga_rampai.jpg"),
		("IDN411","KRITIK ISLAM TERHADAP MARXISME","ALI SANATI","KEISLAMAN",3,"kritik_marxisme.jpg"),
        ("IDN313","NIKMATNYA PACARAN SETELAH PERNIKAHAN","SALIM A FILAH","FIKSI",6,"pascapernikahan.jpg"),
        ("IDN299","MENYELAMI FRAMEWORK LARAVEL","RAHMAD AWALUDIN","SAINTEK",4,"laravel.jpg"),
        ("IDN313","NIKMATNYA PACARAN SETELAH PERNIKAHAN","SALIM A FILAH","FIKSI",6,"pascapernikahan.jpg"),
        ("IDN299","MENYELAMI FRAMEWORK LARAVEL","RAHMAD AWALUDIN","SAINTEK",4,"laravel.jpg");
select *from BOOK;

insert into BOOK(ID_BUKU,NAMA_BUKU,NAMA_PENGARANG,KATEGORI,QTY,IMAGE)
values("IDN556","RUMAH KACA","SUMANTO","FIKSI",11,"video01.mp4");

ALTER TABLE BOOK
ADD unique(ID_BUKU);

alter table book
modify image longblob;

alter table book
modify IMAGE varchar(100);

delete from book
where id_buku = "IDN556";
delete from book
where id_buku = "IDN354";



create table user(
id int not null auto_increment,
username varchar(50) not null,
password text not null,
extend text not null,
status  varchar(50) not null,
primary key(id)

)engine = InnoDB;

desc book;
drop table user;


desc user;
select *from user;
update user
set status = "admin"
where id = 1;