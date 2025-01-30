-- INSERT INTO 

--1. Stw�rz podstawowy produkt
--Utw�rz nowy produkt w tabeli 'Products' nazwie 'Notebook' z cen� 5.99 i ilo�ci� na stanie 100.

INSERT INTO Products (ProductName,Price,StockQuantity) 
VALUES ('Notebook',5.99,100)

--2. Utw�rz produkt ze wszystkimi polami
--Dodaj produkt o nazwie 'Keyboard', kategorii 'Electronics', cenie 29.99, ilo�ci na stanie 50, dostawcy 'TechSupplier', z dat� '2023-11-01'  oraz z opisem 'This is a keyboard

INSERT INTO Products (ProductName, Category, Price, StockQuantity, Supplier, DateAdded, Description) 
VALUES('Keyboard', 'Electronics', 29.99, 50, 'TechSupplier', '2023-11-01', 'This is a keyboard')

--3. Dodaj wiele produkt�w jednocze�nie
--Wstaw trzy r�ne produkty za pomoc� jednego zapytania, ka�dy z innymi warto�ciami p�l wymaganych.

INSERT INTO Products (ProductName, Category, Price, StockQuantity, Supplier, DateAdded, Description) 
VALUES ('Bowl','Kitchen',13.99, 210,'KitchenSupplier', '2023-01-09', 'Red bowls'), 
('Plate','Kitchen',10.99, 110,'KitchenSupplier', '2023-10-01', 'White plates'), 
('Fork','Kitchen',3.99, 910,'KitchenSupplier', '2023-10-01', 'Black forks');


--UPDATE

--1. Zaktualizuj adres email Johna Doe
--Zmie� jego email na 'john.doe@newemail.com'.

UPDATE Employees
SET Email = 'john.doe@newemail.com' 
WHERE LastName = 'Doe'

--2. Dostosuj wynagrodzenia Jane Smith 
--Zwi�ksz wynagrodzenie Jane Smith o 10%

UPDATE Employees
SET Salary = Salary*1.1
WHERE LastName = 'Smith'

--3. Zmiana Dzia�u Emily Johnson
-- Przenie� Emily Johnson z dzia�u IT do dzia�u Marketingu

UPDATE Employees
SET Department = 'Marketing'
WHERE LastName = 'Johnson'

--4. Warunkowa podwy�ka wynagrodzenia
--Zwi�ksz wynagrodzenia o 7% dla wszystkich pracownik�w, kt�rzy zostali zatrudnieni przed rokiem 2020.

UPDATE Employees
SET Salary = Salary*1.07
WHERE HireDate < '2020-01-01'

--5. Warunkowe zmiany w ca�ym dziale
--Zwi�ksz wynagrodzenia o 8% i zaktualizuj statusu na 'Salary Reviewed' dla pracownik�w dzia�u IT zarabiaj�cych mniej ni� 70000 dolar�w.

UPDATE Employees
SET Salary = Salary*1.08, Status = 'Salary Reviewed'
WHERE Department = 'IT' AND Salary < 70000  

--DELETE

--1. Usu� ksi��k� z BookID r�wnym 5 z tabeli Books.

DELETE FROM Books
WHERE BookID=5

--2. Usu� wszystkie ksi��ki z tabeli Books, kt�re s� niedost�pne 

DELETE FROM Books
WHERE InStock = 0

--3. Usu� wszystkie ksi��ki z tabeli Books kt�re zosta�y wydane przed rokiem 2000 i kt�rych cena przekracza 20 dolar�w.

DELETE FROM Books
WHERE PublishedYear < 2000 AND Price > 20

--4. Usu� wszystkie ksi��ki z tabeli Books, kt�rych cena jest ni�sza ni� �rednia cena wszystkich ksi��ek w gatunku 'Fiction'.

DELETE FROM Books
WHERE Price < (
SELECT AVG(Price)
from Books
WHERE Genre = 'Fiction'
)

--5. Usu� ksi��ki w tym samym gatunku co "Zabi� drozda"

DELETE FROM Books
WHERE Genre = (
SELECT Genre
FROM Books
WHERE Title = 'To Kill a Mockingbird'
)

--6. Usu� ksi��ki autor�w, kt�rzy maj� wi�cej ni� trzy ksi��ki w bazie danych

DELETE FROM Books
WHERE Author IN (
SELECT Author
FROM Books
GROUP by Author
HAVING COUNT(*) > 3
)
