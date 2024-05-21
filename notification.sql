CREATE DATABASE notification;
use notification;

CREATE TABLE user(
id varchar(100) not null,
nama varchar(100) not null,
primary key(id)
)engine = InnoDB;

SHOW TABLES;
INSERT INTO user(id, nama)
VALUES('21031', 'Fajar Abdillah Ahmad'),
		('21032', 'Ipeh Marepeh'),
        ('21033', 'Fahmi Fadilah Ahmad');
SELECT *FROM user;
UPDATE user
SET id = "Fajar"
WHERE nama = "Fajar Abdillah Ahmad";

-- MEMBUAT TABEL NOTIF
CREATE TABLE notif(
id INT NOT NULL AUTO_INCREMENT,
tittle  VARCHAR(255) NOT NULL,
detail TEXT NOT NULL,
create_at TIMESTAMP NOT NULL,
user_id VARCHAR(100),
PRIMARY KEY(id)
)engine = InnoDB;

ALTER TABLE notif
ADD CONSTRAINT fk_notif_user
FOREIGN KEY(user_id) REFERENCES user(id);

SHOW TABLES;
DESC notif;
INSERT INTO notif(tittle, detail, create_at, user_id)
VALUES("Pesanan", "Laptop Gaming", CURRENT_TIMESTAMP(), "21031"),
		("Promo", "Happy New Year", CURRENT_TIMESTAMP(), null),
        ("Pembayaran", "Pembayaran Listrik", CURRENT_TIMESTAMP(), "21033");
INSERT INTO notif(tittle, detail, create_at, user_id)
VALUES("Pesanan", "Produk Cosmetic", CURRENT_TIMESTAMP(), 21032);
INSERT INTO notif(tittle, detail, create_at, user_id)
VALUES("Promo", "WEEKEND", CURRENT_TIMESTAMP(), null);
SELECT *FROM notif;
SELECT *FROM notif WHERE user_id = "21031" OR user_id IS NULL ORDER BY create_at DESC;
SELECT *FROM notif WHERE (user_id = "21033" OR user_id IS NULL) ORDER BY create_at DESC;

-- MEMBUAT TABEL CATEGORY
CREATE TABLE category(
id VARCHAR(100) NOT NULL,
nama VARCHAR(100) NOT NULL,
PRIMARY KEY(id)
)engine = InnoDB;
ALTER TABLE notif
ADD COLUMN category_id VARCHAR(100);

ALTER TABLE notif
ADD CONSTRAINT fk_notif_category
FOREIGN KEY(category_id) REFERENCES category(id);
DESC notif;
INSERT INTO category(id, nama)
VALUES("INFO", "Info"),
		("PROMO", "Promo");
UPDATE notif 
SET category_id = "INFO"
WHERE id = 6;
UPDATE notif 
SET category_id = "PROMO"
WHERE id = 7;
UPDATE notif 
SET category_id = "INFO"
WHERE id = 8;
UPDATE notif 
SET category_id = "INFO"
WHERE id = 9;
UPDATE notif 
SET category_id = "PROMO"
WHERE id = 10;
-- n dan c digunakan untuk nama alias untuk notif dan category 
SELECT *FROM notif n 
JOIN category c on(n.category_id = c.id)
WHERE (n.user_id = "21031" OR n.user_id IS NULL) AND c.id ="INFO" ORDER BY n.create_at DESC;
SELECT *FROM notif;


-- MEMBUAT TABEL NOTIFICATION_IS_READ
CREATE TABLE notification_read(
id INT NOT NULL AUTO_INCREMENT,
is_read BOOLEAN NOT NULL,
notification_id INT NOT NULL,
user_id VARCHAR(100) NOT NULL,
PRIMARY KEY(id)
)engine = InnoDB;
SHOW TABLES;
ALTER TABLE notification_read
ADD CONSTRAINT fk_notificationread_notif
FOREIGN KEY(notification_id) REFERENCES notif(id);
ALTER TABLE notification_read
ADD CONSTRAINT fk_notificationread_user
FOREIGN KEY(user_id) REFERENCES user(id);

INSERT INTO notification_read(is_read, notification_id, user_id)
VALUES(true, 7, "21031");
INSERT INTO notification_read(is_read, notification_id, user_id)
VALUES(true, 8, "21033");
INSERT INTO notification_read(is_read, notification_id, user_id)
VALUES(false, 6, "21031");

SELECT *FROM notif n 
JOIN category c ON(n.category_id = c.id)
LEFT JOIN notification_read nr ON(nr.notification_id = n.id)
WHERE (n.user_id = "21031" OR n.user_id IS NULL)
AND (nr.user_id = "21031" OR nr.user_id IS NULL)
ORDER BY n.create_at DESC;

-- COUNT
SELECT COUNT(*)
FROM notif n 
JOIN category c ON(n.category_id = c.id)
LEFT JOIN notification_read nr ON(nr.notification_id = n.id)
WHERE (n.user_id = "21031" OR n.user_id IS NULL)
AND (nr.user_id IS NULL)
ORDER BY n.create_at DESC;	

SELECT *FROM notif;

INSERT INTO notification_read(is_read, notification_id, user_id)
VALUES(true, 6, "21031");

INSERT INTO notification_read(is_read, notification_id, user_id)
VALUES(true, 9, "21032");

INSERT INTO notification_read(is_read, notification_id, user_id)
VALUES(true, 10, "21032");
