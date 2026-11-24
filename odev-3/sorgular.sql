-- Q1: Fiyatı 50 TL'den yüksek ürünleri pahalıdan ucuza sırala.
-- Ne işe yarar: Kafenin 50 TL üzerindeki ürünlerini en pahalıdan en ucuza görmemizi sağlar.
SELECT name, price
FROM product
WHERE price > 50
ORDER BY price DESC;

-- Q2: 'YBS' bölümündeki müşterilerin adlarını alfabetik sırala.
-- Ne işe yarar: YBS bölümündeki müşterileri isme göre alfabetik listelememizi sağlar.
SELECT full_name
FROM customer
WHERE department = 'YBS'
ORDER BY full_name ASC;

-- Q3: Her siparişin numarasını, tarihini ve müşterinin adını listele.
-- Ne işe yarar: Sipariş numarası ve tarihiyle hangi müşteriye ait olduğunu eşleştirerek gösterir.
SELECT o.order_id, o.order_date, c.full_name
FROM orders o
INNER JOIN customer c ON c.customer_id = o.customer_id;

-- Q4: Her sipariş kaleminin ürün adını ve adedini listele.
-- Ne işe yarar: Sipariş satırlarında hangi üründen kaç tane alındığını gösterir.
SELECT p.name, oi.quantity
FROM order_item oi
INNER JOIN product p ON p.product_id = oi.product_id;

-- Q5: Her müşterinin kaç sipariş verdiğini müşteri adıyla listele.
-- Ne işe yarar: Müşterilerin toplam sipariş sayısını görerek sipariş yoğunluğunu analiz etmemizi sağlar.
SELECT c.full_name, COUNT(o.order_id) AS siparis_sayisi
FROM customer c
LEFT JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.full_name;

-- Q6: Her ürün kategorisinin ortalama fiyatını bul.
-- Ne işe yarar: Ürün kategorilerinin ortalama fiyatını karşılaştırmamızı sağlar.
SELECT category, AVG(price) AS ortalama_fiyat
FROM product
GROUP BY category;
