-- Nama = Wayan Putri Yanti
-- Kelas = BE-17

-- 1. Insert
-- a. insert 3 product type
INSERT INTO product_types(categories)
values ("pakaian"),("makanan"),("minuman");
select*from product_types;

-- b. insert 2 product dengan product type id = 1
INSERT INTO products(name, price, product_type_id)
values ("baju koko", 50000,1),("gamis",78000,1);

-- c. insert 3 product dengan product type id = 2
INSERT INTO products(name, price,product_type_id)
values ("wafer coklat", 4000,2),("sukro",2000,2),("kacang dua kelinci", 2000,2);

-- d. insert 3 product dengan product type id = 3
INSERT INTO products(name, price, product_type_id)
values ("Yakult", 2500,3),("marimas",1000,3),("jus jeruk",5000,3);

select*from products;

-- e. insert product description pada setiap product
INSERT INTO product_descriptions(product_id, description,created_at,update_at)
values (1, "Deskripsi produk: Baju koko merek Qori terbuat dari bahan katun super latif yang dapat menyerap keringat.
Anda bisa bergerak bebas dan tetap merasa sejuk selama memakainya. Size yang tersedia S, M, L, XL, XXL, XXXL.","2023-04-15 17:13:00","2023-04-15 17:13:00"),
(2, "Bahan Wolfis (tebal nyaman dipakai), fit to XL, LD 100-110 cm, Pj 138 cm.","2023-04-15 17:13:00","2023-04-15 17:13:00"),
(3,"Wafer renyah yang terbuat dari bahan pilihan.","2023-04-15 17:13:00","2023-04-15 17:13:00"),
(4,"Diolah dari kacang pilihan yang dibalut dengan campuran tepung dan rempah asli khas Indonesia.","2023-04-15 17:13:00","2023-04-15 17:13:00"),
(5,"Harga 1 bungkus, Netto 200 gram","2023-04-15 17:13:00","2023-04-15 17:13:00"),
(6,"minuman susu fermentasi yang mengandung lebih dari 6,5 miliar bakteri L. casei Shirota strain ditiap botolnya","2023-04-15 17:13:00","2023-04-15 17:13:00"),
(7,"tersedia rasa mangga, melon, sirsak, dan nanas","2023-04-15 17:13:00","2023-04-15 17:13:00"),
(8,"terbuat dari perasan jeruk asli","2023-04-15 17:13:00","2023-04-15 17:13:00");
select*from product_descriptions; 

-- f. insert 3 payment methods
INSERT INTO payment_methods(name)
values ("COD"),("payleter"),("BNI");
select*from payment_methods;

-- g. insert 5 user pada tabel user
INSERT INTO users(name, gender, status)
values ("Santi","F","active"),
("Morgan","M","active"),
("Caca","F","inactive"),
("Jeremi","M","active"),
("Yolanda","F","inactive");
select*from users;

-- h. insert 3 transaksi di masing-masing user (min 3 user). (Soal berlanjut ke soal 1.j)
INSERT INTO transactions(user_id, total_qty, total_transaction, payment_method_id)
values (1,3,60000,1),(1,6,48000,2),(1,4,34000,1),
(2,5,80000,1),(2,1,10000,3),(2,6,90000,1),
(3,2,75000,3),(3,4,60000,3),(3,7,78000,2),
(4,5,20000,2),(4,3,90000,1),(4,5,80000,1),
(5,1,45000,1),(5,7,50000,1),(5,8,68000,3);
select*from transactions;

-- i. insert 3 product di masing-masing transaksi
INSERT INTO transaction_details(transaction_id,product_id,price,qty)
values (1,3,4000,3),(1,6,2500,16),(1,4,2000,4),
(2,5,2000,5),(2,4,2000,15),(2,3,4000,2),
(3,3,4000,4),(3,5,2000,5),(3,4,2000,7),
(4,1,50000,1),(4,3,4000,6),(4,4,2000,3),
(5,7,1000,1),(5,8,5000,1),(5,5,2000,2),
(6,2,78000,1),(6,3,4000,1),(6,5,2000,4),
(7,1,50000,1),(7,7,1000,20),(7,8,5000,1),
(8,1,50000,1),(8,6,2500,2),(8,6,2500,5),
(9,8,5000,8),(9,3,4000,6),(9,6,2500,2),
(10,5,2000,5),(10,7,1000,8),(10,2,78000,3),
(11,6,2500,6),(11,4,2000,7),(11,1,50000,1),
(12,2,78000,2),(12,3,4000,4),(12,7,1000,19),
(13,4,2000,7),(13,7,1000,3),(13,8,5000,1),
(14,4,2000,3),(14,2,78000,8),(14,5,2000,1),
(15,8,5000,1),(15,5,2000,1),(15,7,1000,1);
select*from transaction_details;

-- 1.j alamat pengguna
INSERT INTO address(user_id,address)
values (1,"Jakarta Selatan"),(2,"Jambi"),(3,"Sulawesi Selatan"),
(4,"Jakarta Selatan"),(5,"Bandung");
select*from address;

INSERT INTO payment_method_descriptions(payment_method_id, description)
values (1,"bayar ditempat"),(2,"bayar nanti"),(3,"lewat BNI");
select*from payment_method_descriptions;

INSERT INTO user_payment_method_detail(user_id,payment_method_id,detail)
values (1,2,"Lunas"),(4,3,"Lunas"),(2,1,"kabur"),(3,2,"belum bayar");
select*from user_payment_method_detail;

-- 2. Select
-- a. tampilkan nama user/ pelanggan dengan gender laki-laki/M
select name from users where gender="M";

-- b. tampilkan product dengan id = 3
select * from products where id=3;

-- c. tampilkan data pelanggan yang created_at dalam range 7 hari kebelakang dan mempunyai nama mengandung kata "a"
select*from users where created_at between now()-interval 7 day and now() and name like "%a%";

-- d. Hitung jumlah user/ pelanggan dengan status gender perempuan
select count(case when gender="F" then 1 end) as perempuan from users;

-- e.tampilkan data pelanggan sesuai urutan nama abjad
select*from users order by name asc;

-- f. tampilkan 5 data transaksi dengan product id=3
select td.product_id,p.name as nama_produk,u.name as nama_pelanggan,t.total_qty, t.total_transaction,pm.name as metode_pembayaran,t.created_at,t.update_at from transactions t 
inner join transaction_details td on t.id = td.transaction_id
inner join users u on u.id = t.user_id
inner join payment_methods pm on t.payment_method_id = pm.id
inner join products p on p.id=td.product_id
where product_id =3 limit 5;

-- 3. Update
-- a. Ubah data product id 1 dengan nama 'product dummy'
UPDATE products set
name = "product dummy"
where id = 1;

 -- b. update qty=3 pada transaction detail dengan product id 1
 UPDATE transaction_details set
 qty = 3
 where product_id = 1;
 
 -- 4. Delete
 -- a. delete data pada tabel product dengan id 
DELETE FROM products
WHERE id = 1;

-- b. Delete pada tabel product dengan product-type id 1
DELETE FROM products
where product_type_id = 1;