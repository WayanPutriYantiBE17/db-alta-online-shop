CREATE DATABASE db_Latihan1;
USE db_latihan1;

-- membuat tabel users
CREATE TABLE users(
id int primary key auto_increment,
nama varchar(100) not null,
email varchar(100) not null unique
);

-- membuat tabel products
CREATE TABLE products(
id int primary key auto_increment,
user_id int,
product_name varchar(200) not null,
stock int,
price decimal,
jenis varchar(50),
constraint fk_user_product foreign key(user_id) references users(id)
);

-- membuat tabel transactions
CREATE TABLE transactions(
id int primary key auto_increment,
user_id int,
create_at datetime,
total_price decimal,
constraint fk_user_transaction foreign key(user_id) references users(id)
);

-- membuat tabel transaction_detail
CREATE TABLE transaction_detail(
id int primary key auto_increment,
transaction_id int,
product_id int,
quantity int,
total_price decimal,
constraint fk_transaction_transaction_detail foreign key(transaction_id) references transactions(id),
constraint fk_product_transaction_detail foreign key(product_id) references products(id)
);



