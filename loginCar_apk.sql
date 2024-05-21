create database loginCar;
use logincar;
create table loginform(
id_login int not null auto_increment,
firstname varchar(10) not null,
lastname varchar(10) not null,
username varchar(50) not null,
password varchar(30) not null,
primary key(id_login)

)engine=InnoDB;

insert into loginform(firstname, lastname, username, password)
values("fajar", "ahmad", "fajar abdillah ahmad", "fajar123456"),
		("ujeh", "uyye", "ujeh selalu uyye", "ujeuyye123");
select *from loginform;

select count(1) from loginform where username = "fajar abdillah ahmad" and password = "fajar123456";
select count(2) from loginform where username = "ujeh selalu uyye" and password = "ujeuyye123";

create table dataPeminjam(
id_peminjam int not null auto_increment,
nama_peminjam varchar(50) not null,
no_telp char(12) not null,
alamat varchar(100) not null,
email varchar(50) not null,
kode_mobil char(5) not null,
metode_bayar varchar(20) not null, 
primary key(id_peminjam)

)engine = InnoDB;

select *from datapeminjam;

create table dataMobil(
id_mobil int not null auto_increment,
kode_mobil varchar(5) not null,
nama_mobil varchar(30) not null,
transmisi varchar(20) not null,
kapasitas int not null,
primary key(id_mobil)

)engine = InnoDB;

select *from datamobil;
show tables;
desc datamobil;
desc datapeminjam;
SELECT nama_mobil
FROM datamobil
CROSS JOIN datapeminjam;
alter table datamobil
add foreign key(id_mobil)references datapeminjam(id_peminjam);
SELECT * FROM datamobil
cross join datapeminjam on(id_peminjam = id_mobil);




create table sumbux(
nilaix int not null,
primary key(nilaix)
)engine=InnoDB;
insert into sumbux(nilaix)
value(1),(2),(3);
insert into sumbuy(nilaiy)
value(1),(2),(3);
create table sumbuy(
nilaiy int not null,
foreign key(nilaiy)references sumbux(nilaix)
)engine=InnoDB;
select * from sumbuy
cross join sumbux on(nilaiy = nilaix);


