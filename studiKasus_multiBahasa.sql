CREATE DATABASE studikasus_multibahasa;
USE studikasus_multibahasa;

CREATE TABLE categories(
id VARCHAR(100),
position INT,
PRIMARY KEY(id)
)engine = InnoDB;
ALTER TABLE categories
MODIFY position INT NOT NULL;
DESC categories;

INSERT INTO categories(id, position)
VALUES("Laptop", 1),
	("Gadget", 2),
    ("Fashion", 3);
SELECT *FROM categories ORDER BY position;

CREATE TABLE categories_tranlate(
categories_id VARCHAR(100) NOT NULL,
language VARCHAR(100) NOT NULL,
name VARCHAR(100) NOT NULL,
description TEXT,
PRIMARY KEY(categories_id, language)
)engine = InnoDB;
DESC categories_tranlate;

ALTER TABLE categories_tranlate
ADD CONSTRAINT fk_categoriestranlate_categories
FOREIGN KEY(categories_id) REFERENCES categories(id);

INSERT INTO categories_tranlate(categories_id, language, name, description)
VALUES("Laptop", "in_ID", "Laptop", "ELEKTRONIK");
INSERT INTO categories_tranlate(categories_id, language, name, description)
VALUES("Laptop", "en_US", "Laptops", "ELECTRONIC");
INSERT INTO categories_tranlate(categories_id, language, name, description)
VALUES("Gadget", "in_ID", "Gawai", "GAWAI");
INSERT INTO categories_tranlate(categories_id, language, name, description)
VALUES("Gadget", "en_US", "Gadgets", "GADGETS DESCRIPTION");

SELECT *FROM categories c
-- JIKA USER DARI INDONESI MAKA BAHASANYA MEMAKAI BAHASA INDONESIA
JOIN categories_tranlate ct ON (c.id = ct.categories_id)
WHERE ct.language = "in_ID" ORDER BY position;

-- JIKA USER DARI LUAR INDONESIA BAHASANYA MEMAKAI BAHASA INGGRIS
SELECT *FROM categories c
JOIN categories_tranlate ct ON (c.id = ct.categories_id)
WHERE ct.language = "en_US" ORDER BY position; 


 








