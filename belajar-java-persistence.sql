create database fajar_jpa;
use fajar_jpa;

show tables;
desc transactions;
desc customers;
select *from customers;

create table customers(
id varchar(255) not null primary key,
name varchar(255) not null

)engine = InnoDB;


alter table customers
add column primary_email varchar(255) not null;

create table categories(
id int not null auto_increment primary key,
name varchar(100) not null, 
description varchar(100)
)engine = InnoDB;

select *from categories;


alter table customers
add column age tinyint;

alter table customers
add column married boolean;

ALTER TABLE customers
add column type varchar(50);

ALTER TABLE categories
ADD COLUMN created_at TIMESTAMP;

ALTER TABLE categories
ADD COLUMN updated_at TIMESTAMP;

CREATE TABLE images(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
description TEXT,
image BLOB
)engine = InnoDB;
ALTER TABLE images
 MODIFY COLUMN image LONGBLOB;

select *from images;
DESC images;

CREATE TABLE MEMBERS(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
email VARCHAR(100) NOT NULL,
title VARCHAR(100), 
first_name VARCHAR(100),
middle_name VARCHAR(100),
last_name VARCHAR(100)
)engine = InnoDB;

select *from members;

CREATE TABLE departments(
company_id VARCHAR(100) NOT NULL,
department_id VARCHAR(100) NOT NULL, 
name Varchar(100) NOT NULL,
PRIMARY KEY(company_id, department_id)
)engine = InnoDB;
DESC departments;
select *from departments;

CREATE TABLE hobbies(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
member_id INT NOT NULL,
name VARCHAR(100) NOT NULL,
FOREIGN KEY fk_members_hobbies(member_id)
REFERENCES members(id)
)engine = InnoDB;
select *from hobbies;

CREATE TABLE skills(
id 	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
member_id INT NOT NULL,
name VARCHAR(100) NOT NULL, 
value INT NOT NULL,
FOREIGN KEY fk_members_skill (member_id)
REFERENCES members(id),
CONSTRAINT skills_unique UNIQUE(member_id, name)
)engine = InnoDB;
select *from skills;

-- RELATONAL OneToOne dengan Id credentials ke id users (ini dengan ID yang behaviornya sama 

CREATE TABLE credentials(
id VARCHAR(100) NOT NULL PRIMARY KEY,
email VARCHAR(100) NOT NULL,
password VARCHAR(100) NOT NULL
)engine = InnoDB;
select *from credentials;

CREATE TABLE users(
id VARCHAR(100) NOT NULL PRIMARY KEY,
name VARCHAR(100) NOT NULL
)engine = InnoDB;
select *from users;

-- RELATIONAL OneToOne dengan id(primary key) users ke field dengan tipe data yang sama

CREATE TABLE wallet(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
users_id VARCHAR(100) NOT NULL,
balance BIGINT NOT NULL, 
FOREIGN KEY fk_users_wallet (users_id) REFERENCES users(id)
)engine = InnoDB;
select *from wallet;

-- RELATIONAL OneToMany brands ke banyak product

CREATE TABLE brands(
id VARCHAR(100)NOT NULL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
description VARCHAR(100) NOT NULL 
)engine = InnoDB;
ALTER TABLE brands
ADD COLUMN created_at TIMESTAMP;
ALTER TABLE brands
ADD COLUMN updated_at TIMESTAMP;
ALTER TABLE brands
ADD COLUMN version BIGINT;
select *from brands;


CREATE TABLE products(
id VARCHAR(100) NOT NULL PRIMARY KEY,
brand_id VARCHAR(100) NOT NULL,
name VARCHAR(100) NOT NULL,
price BIGINT NOT NULL,
description VARCHAR(300),
FOREIGN KEY fk_brand_product (brand_id) REFERENCES brands(id)
)engine = InnoDB;
select *from products;

-- RELATIONAL MANY TO MANY users dan products (users -> users_like_products <- products)
CREATE TABLE users_like_products(
user_id VARCHAR(100) NOT NULL,
product_id VARCHAR(100) NOT NULL,
FOREIGN KEY fk_users_to_users_like_products (user_id) REFERENCES users(id),
FOREIGN KEY fk_product_to_users_like_products (product_id) REFERENCES products(id),
PRIMARY KEY (user_id, product_id)
)engine = InnoDB;
select *from users_like_products;	

-- JPA INHERITANCES
-- SINGLE TABLE INHERITANCE (total_manager and total_employee must be null)
CREATE TABLE employees(
id VARCHAR(100) NOT NULL PRIMARY KEY,
type VARCHAR(50) NOT NULL, 
name VARCHAR(100) NOT NULL, 
total_manager INT,
total_employee INT
)engine = InnoDB;
select *from employees; 
-- END SINGLE TABLE INHERITANCE


-- INHERITANCE joined table with primary key ID
CREATE TABLE payments(
id VARCHAR(100) NOT NULL PRIMARY KEY,
amount BIGINT NOT NULL
)engine= InnoDB;
SELECT *FROM payments;

CREATE TABLE payments_gopay(
id VARCHAR(100) NOT NULL PRIMARY KEY,
gopay_id VARCHAR(100) NOT NULL,
FOREIGN KEY fk_payments_gopay (id) REFERENCES payments(id)
)engine = InnoDB;
select *from payments_gopay;

CREATE TABLE payments_credit_card(
id VARCHAR(100) NOT NULL PRIMARY KEY,
masked_card VARCHAR(100) NOT NULL,
bank VARCHAR(20) NOT NULL,
FOREIGN KEY fk_payments_credit_card_payments (id) REFERENCES payments(id)
)engine = InnoDB;
select *from payments_credit_card;

-- END joined inheritance table 

CREATE TABLE transactions(
id VARCHAR(100) NOT NULL PRIMARY KEY,
balance BIGINT NOT NULL,
created_at TIMESTAMP NOT NULL
)engine = InnoDB;
select *from transactions;


CREATE TABLE transactions_credit(
id VARCHAR(100) NOT NULL PRIMARY KEY,
balance BIGINT NOT NULL,
created_at TIMESTAMP NOT NULL,
create_amount BIGINT NOT NULL
)engine = InnoDB;
ALTER TABLE transactions_credit
RENAME COLUMN create_amount TO credit_amount;
select *from transactions_credit;


CREATE TABLE transactions_debit(
id VARCHAR(100) NOT NULL PRIMARY KEY,
balance BIGINT NOT NULL,
created_at TIMESTAMP NOT NULL,
debit_amount BIGINT NOT NULL
)engine = InnoDB;
SELECT *FROM transactions_debit;

