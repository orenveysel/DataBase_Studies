-- built-in function : Hazır gelen fonksiyonlar

select ASCII('A') -- ASCII kodunu verir
SELECT char(65) -- Verilen kodun ASCII karşılığını verir

-- Değişken tanımlama Declare keyword'u ile yapılır ve değişkenin tipi belirtilir
-- değişkenler mutlaka @ işareti ile başlamak zorundadır
declare @email varchar(50) -- Tipi varchar olan ve max uzunluğu 50 karakter olan bir değişken

-- değişkenlere değer ataması 2 şekilde olur
-- 1. yol select kullanmak
SELECT @email='ayse@gmail.com'
-- 2. yol Set komutunu kullanmak
set @email='fatma@gmail.com'
-- @ işareti kaçıncı sıradadır
SELECT CHARINDEX('@',@email)
select left(@email, 3), -- soldan 3 adet verir
right(@email,3), -- sağdan 3 adet verir
LEN(@email), -- uzunluğunu verir
LOWER(@email), -- küçük harfe cevirir
UPPER(@email), --büyük harfe çevirir
LTRIM(@email), -- soldan itibaren boşlukları attı
RTRIM(@email), -- sağdan itibaren boşlukları attı
LEN(TRIM(@email)), -- tüm boşlukları atar ve uzunluğuna bakar
len(LTRIM(RTRIM(@email))) -- tüm boşlukları atar ve uzunluğuna bakar
select upper(FirstName), UPPER(LastName), UPPER(BirthDate), UPPER(YEAR(BirthDate)) 
from Employees

-- Replace
select REPLACE('Birbirbirilerine','bir','iki')
--substring verilen ifade  içerisinde başlangıç indexinden bitişe kadar olan değeri verir
select SUBSTRING('Birbirbirilerine',1,3)
-- Birbirbirilerine 5. karakterden sonuna kadar olan kısmı çekip alalım
select SUBSTRING('Birbirbirilerine',5,len('Birbirbirilerine')-4)

-- select substring(Notes,10,len(Notes)-10) from Employees
--Reverse
select REVERSE('ali veli') -- Tersten yazdırma işlemi

-- Space(x) verilen x kadar boşluk atar
select 'ali' + SPACE(3) + 'veli'

--replicate:Tekrarlama
select REPLICATE('ali',3)

select SOUNDEX('Juice'), SOUNDEX('Banana')
select SOUNDEX('ali'), SOUNDEX('su')
select DIFFERENCE('Juice','Jucy')

SELECT Notes from Employees 