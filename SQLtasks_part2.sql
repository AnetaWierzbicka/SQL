-- INSERT INTO 

--1. Stwórz podstawowy produkt
--Utwórz nowy produkt w tabeli 'Products' nazwie 'Notebook' z cen¹ 5.99 i iloœci¹ na stanie 100.

INSERT INTO Products (ProductName,Price,StockQuantity) 
VALUES ('Notebook',5.99,100)

--2. Utwórz produkt ze wszystkimi polami
--Dodaj produkt o nazwie 'Keyboard', kategorii 'Electronics', cenie 29.99, iloœci na stanie 50, dostawcy 'TechSupplier', z dat¹ '2023-11-01'  oraz z opisem 'This is a keyboard

INSERT INTO Products (ProductName, Category, Price, StockQuantity, Supplier, DateAdded, Description) 
VALUES('Keyboard', 'Electronics', 29.99, 50, 'TechSupplier', '2023-11-01', 'This is a keyboard')

--3. Dodaj wiele produktów jednoczeœnie
--Wstaw trzy ró¿ne produkty za pomoc¹ jednego zapytania, ka¿dy z innymi wartoœciami pól wymaganych.

INSERT INTO Products (ProductName, Category, Price, StockQuantity, Supplier, DateAdded, Description) 
VALUES ('Bowl','Kitchen',13.99, 210,'KitchenSupplier', '2023-01-09', 'Red bowls'), 
('Plate','Kitchen',10.99, 110,'KitchenSupplier', '2023-10-01', 'White plates'), 
('Fork','Kitchen',3.99, 910,'KitchenSupplier', '2023-10-01', 'Black forks');


--UPDATE

--1. Zaktualizuj adres email Johna Doe
--Zmieñ jego email na 'john.doe@newemail.com'.

UPDATE Employees
SET Email = 'john.doe@newemail.com' 
WHERE LastName = 'Doe'

--2. Dostosuj wynagrodzenia Jane Smith 
--Zwiêksz wynagrodzenie Jane Smith o 10%

UPDATE Employees
SET Salary = Salary*1.1
WHERE LastName = 'Smith'

--3. Zmiana Dzia³u Emily Johnson
-- Przenieœ Emily Johnson z dzia³u IT do dzia³u Marketingu

UPDATE Employees
SET Department = 'Marketing'
WHERE LastName = 'Johnson'

--4. Warunkowa podwy¿ka wynagrodzenia
--Zwiêksz wynagrodzenia o 7% dla wszystkich pracowników, którzy zostali zatrudnieni przed rokiem 2020.

UPDATE Employees
SET Salary = Salary*1.07
WHERE HireDate < '2020-01-01'

--5. Warunkowe zmiany w ca³ym dziale
--Zwiêksz wynagrodzenia o 8% i zaktualizuj statusu na 'Salary Reviewed' dla pracowników dzia³u IT zarabiaj¹cych mniej ni¿ 70000 dolarów.

UPDATE Employees
SET Salary = Salary*1.08, Status = 'Salary Reviewed'
WHERE Department = 'IT' AND Salary < 70000  

--DELETE

--1. Usuñ ksi¹¿kê z BookID równym 5 z tabeli Books.

DELETE FROM Books
WHERE BookID=5

--2. Usuñ wszystkie ksi¹¿ki z tabeli Books, które s¹ niedostêpne 

DELETE FROM Books
WHERE InStock = 0

--3. Usuñ wszystkie ksi¹¿ki z tabeli Books które zosta³y wydane przed rokiem 2000 i których cena przekracza 20 dolarów.

DELETE FROM Books
WHERE PublishedYear < 2000 AND Price > 20

--4. Usuñ wszystkie ksi¹¿ki z tabeli Books, których cena jest ni¿sza ni¿ œrednia cena wszystkich ksi¹¿ek w gatunku 'Fiction'.

DELETE FROM Books
WHERE Price < (
SELECT AVG(Price)
from Books
WHERE Genre = 'Fiction'
)

--5. Usuñ ksi¹¿ki w tym samym gatunku co "Zabiæ drozda"

DELETE FROM Books
WHERE Genre = (
SELECT Genre
FROM Books
WHERE Title = 'To Kill a Mockingbird'
)

--6. Usuñ ksi¹¿ki autorów, którzy maj¹ wiêcej ni¿ trzy ksi¹¿ki w bazie danych

DELETE FROM Books
WHERE Author IN (
SELECT Author
FROM Books
GROUP by Author
HAVING COUNT(*) > 3
)
