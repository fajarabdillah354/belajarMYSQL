drop database azkacake;
use belajar_java_database;

show tables;
create table stock(
id int auto_increment,
id_stock int default 1,
nama_stock varchar(25) not null,
quantity int default 1,
primary key (id)
)engine = InnoDB;



create table product(
id int auto_increment,
id_product int,
nama_product varchar(25) not null,
category varchar(25) not null,
harga int,
keterangan_product varchar(50),
primary key(id),
constraint product_stock_fk
foreign key(id_product) references stock(id)
on update cascade on delete cascade
)engine = InnoDB;

drop table stock;
drop table product;
select *from stock;
select *from product;

select product.id_product, stock.nama_stock, product.nama_product, stock.quantity, product.category, product.harga, product.keterangan_product from product
join stock on(product.id_product = stock.id);

