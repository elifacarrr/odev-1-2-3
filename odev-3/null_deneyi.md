# NULL Deneyi

## Deney 1
Sorgu: `SELECT COUNT(*), COUNT(phone) FROM customer;`

- Tahminim: `COUNT(*)` müşteri tablosundaki tüm satırları sayar ama `COUNT(phone)` telefonu `NULL` (boş) olan satırları saymayacağı için daha küçük bir sonuç verir.
- Sonuç: `COUNT(*)` tüm kayıtları sayar, `COUNT(phone)` ise sadece telefon numarası dolu olan kayıtların sayısını döndürür.
- Yorum: Tahminim `NULL` davranışıyla örtüşüyor. `NULL` bir değer değil, değer yokluğu olduğu için sütun bazlı `COUNT(phone)` boş satırları atlar, oysa `COUNT(*)` satır saydığı için herkesi sayar.

## Deney 2
Sorgu: `SELECT AVG(age), SUM(age) / COUNT(*) FROM customer;`

- Tahminim: `AVG(age)` yaşı `NULL` olan satırları hesaba katmadan ortalama alırken, `SUM(age) / COUNT(*)` yaş toplamını tüm satır sayısına böleceği için iki değer farklı çıkar.
- Sonuç: `AVG(age)` yalnızca yaşı dolu olanların ortalamasını verirken, `SUM(age) / COUNT(*)` toplam yaşı tablodaki tüm satır sayısına böler.
- Yorum: `AVG` ve `SUM` fonksiyonları `NULL` değerleri yok sayar ama `COUNT(*)` boş yaşlı satırları da paydaya eklediği için `SUM(age) / COUNT(*)` sonucu daha düşük çıkar.
