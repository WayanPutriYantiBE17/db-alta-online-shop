use alta_online_shop;

-- 1. gabungkan data transaksi dari user id 1 dan user id 2
select * from transactions where user_id = 1
union
select * from transactions where user_id = 2;

-- 2. tampilkan jumlah harga transaksi user id 1
select t.user_id,sum(td.price) from transaction_details td
inner join transactions t on t.id = td.transaction_id
where t.user_id = 1;

-- 3. tampilkan total transaksi dengan product type 2
select p.product_type_id, t.total_transaction from transactions t
inner join transaction_details td on td.transaction_id = t.id
inner join products p on p.id = td.product_id
where product_type_id = 2;

-- 4. Tampilkan semua field table product dan field name product type yang saling berhubungan
select p.*,pt.categories from products p
inner join product_types pt on pt.id = p.product_type_id;

-- 5. Tampilkan semua field table transaction, field name table product dan field name table user
select u.name,p.name as nama_barang,t.* from users u inner join transactions t on u.id = t.user_id
inner join transaction_details td on t.id = td.transaction_id
inner join products p on p.id = td.product_id;

-- 8. tampilkan data products yang tidak pernah ada di tabel transaction_details dengan sub-query
select * from products where id not in (select distinct product_id from transaction_details);
