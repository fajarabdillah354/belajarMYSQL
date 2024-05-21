create database mobil;
use mobil;
create table dataMobil(
kode_mobil int not null auto_increment,
nama_mobil varchar(50) not null,
transmisi varchar(20) not null,
kapasitas int not null,
primary key(kode_mobil)
)engine = InnoDB;



drop database mobil;

create database mobil;
use mobil;
create table dataMobil(
id_mobil int not null auto_increment,
kode_mobil varchar(5) not null,
nama_mobil varchar(50) not null,
transmisi varchar(20) not null,
kapasitas int not null,
primary key(id_mobil)
)engine = InnoDB;

desc datamobil;

select *from datamobil;
