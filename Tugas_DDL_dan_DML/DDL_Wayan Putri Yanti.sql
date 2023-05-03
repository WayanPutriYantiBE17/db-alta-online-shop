-- Nama = Wayan Putri Yanti
-- Kelas = BE-17

-- 1. create database alta_online_shopp
create database alta_online_shopp;
use alta_online_shopp;

-- 2. Dari schema Olshop yang telah kamu kerjakan, implementasikanlah menjadi tabel pada MySQL.
-- 		a. Create table user
CREATE TABLE users(
id int primary key auto_increment,
name varchar(50) not null,
gender enum('M', 'F'),
status enum('active', 'inactive'),
created_at datetime default current_timestamp,
updated_ad datetime default current_timestamp,
deleted_ad datetime
);

-- 	b. create table product, product_type, product_description,payment_method. 
CREATE TABLE product_types(
id int primary key auto_increment,
categories varchar(50),
created_at datetime default current_timestamp,
update_at datetime default current_timestamp
);

CREATE TABLE products(
id int primary key auto_increment,
name varchar(50),
price decimal,
product_type_id int,
created_at datetime default current_timestamp,
update_at datetime default current_timestamp,
constraint fk_product_type_product foreign key(product_type_id) references product_types(id) on delete cascade
);

CREATE TABLE product_descriptions(
product_id int primary key,
description text,
created_at datetime,
update_at datetime,
constraint fk_product_product_descriptions foreign key(product_id) references products(id) on delete cascade
);

CREATE TABLE payment_methods(
id int primary key auto_increment,
name varchar(50),
created_at datetime default current_timestamp,
update_at datetime default current_timestamp
);

-- c. create table transaction, transaction detail
CREATE TABLE transactions(
id int primary key auto_increment,
user_id int,
total_qty int,
total_transaction decimal,
payment_method_id int,
created_at datetime default current_timestamp,
update_at datetime default current_timestamp,
constraint fk_user_transaction foreign key(user_id) references users(id) on delete cascade,
constraint fk_payment_method_transaction foreign key(payment_method_id) references payment_methods(id) on delete cascade
);

CREATE TABLE transaction_details(
id int primary key auto_increment,
transaction_id int,
product_id int,
price decimal,
qty int,
created_at datetime default current_timestamp,
update_at datetime default current_timestamp,
constraint fk_transaction_transaction_detail foreign key(transaction_id) references transactions(id) on delete cascade,
constraint fk_product_transaction_detail foreign key(product_id) references products(id) on delete cascade
);

-- 3. Create table kurir dengan field id, name, created_at, update_at
CREATE TABLE kurir(
field_id int primary key,
name varchar(50),
created_at datetime default current_timestamp,
update_at datetime default current_timestamp
);

-- 4. tambahkan ongkos_dasar column di tabel kurir
ALTER TABLE kurir
ADD COLUMN ongkos_dasar decimal;

-- 5. rename tabel kurir menjadi shipping.
ALTER TABLE kurir
RENAME TO shipping;

-- 6. Hapus/drop tabel shipping karena ternyata tidak dibutuhkan. 
DROP TABLE shipping;

-- 7. Silahkan menambahkan entity baru dengan relation 1 to 1, 1- to many, many to many, seperti:
--     a. 1-to-1: payment_method dengan description
CREATE TABLE payment_method_descriptions(
payment_method_id int primary key,
description varchar(255),
created_at datetime default current_timestamp,
update_at datetime default current_timestamp,
constraint fk_payment_method_payment_method_description foreign key(payment_method_id) references payment_methods(id) on delete cascade
);

--    b. 1-to-many:user dengan alamat
CREATE TABLE address(
id int primary key auto_increment,
user_id int,
address varchar(255),
constraint fk_user_address foreign key(user_id) references users(id) on delete cascade
);

--   c. many-to-many: user dengan payment_method menjadi user_payment_method_detail
CREATE TABLE user_payment_method_detail(
id int primary key auto_increment,
user_id int,
payment_method_id int,
detail varchar(255),
constraint fk_user_user_payment_method_detail foreign key(user_id) references users(id) on delete cascade,
constraint fk_payment_methods_user_payment_method_detail foreign key(payment_method_id) references payment_methods(id) on delete cascade
);

drop table user_payment_method_detail;