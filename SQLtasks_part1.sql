
--1. Poka¿ wszystkie filmy--

SELECT *
FROM Filmy

--2. Poka¿ wszystkich aktorów

SELECT ImieNazwisko
FROM Aktorzy

--3. Poka¿ imiona i nazwiska uczestników wydarzeñ 

SELECT Imiê, Nazwisko
FROM Osoby

--4. Poka¿ tytu³y filmów traj¹cych co najmniej dwie godziny

SELECT Tytul
FROM Filmy
WHERE CzasTrwania_min >= 120

--5. Ilu jest aktorów urodzonych w kwietniu?

SELECT COUNT(*) AS Ilosc
FROM Aktorzy
WHERE MONTH(DataUrodzenia) = 04

--6. Poka¿ tytu³y 3 najnowszych filmów 

SELECT TOP 3 Tytul
FROM Filmy
ORDER BY RokProdukcji DESC

--7. Poka¿ filmy, których tytu³y zaczynaj¹ siê na literê 'S'

SELECT Tytul
FROM Filmy
WHERE Tytul like 's%'

--8. Poka¿ filmy wyprodukowane po roku 2000 trwaj¹ce mniej ni¿ 2 godziny'

SELECT Tytul
FROM Filmy
WHERE RokProdukcji > 2000 AND CzasTrwania_min < 120

--9. W jakich filmach gra³ Tom Hanks?

SELECT f.Tytul
FROM Filmy f
INNER JOIN Film_Aktor fa ON f.IdFilmy = fa.IdFilmu
INNER JOIN Aktorzy a ON a.IdAktorzy = fa.IdAktora
WHERE a.ImieNazwisko = 'Tom Hanks'

--10.Którzy aktorzy grali w przynajmniej dwóch filmach?

SELECT a.ImieNazwisko, COUNT(*) AS Liczba_filmow
FROM Aktorzy a
INNER JOIN Film_Aktor fa ON fa.IdAktora = a.IdAktorzy
INNER JOIN Filmy f ON f.IdFilmy = a.IdAktorzy
GROUP BY a.ImieNazwisko
HAVING COUNT(*) >=2

-- 11. W filmach z jakiego gatunku gra³ Morgan Freeman?

SELECT DISTINCT g.Nazwa
FROM Gatunek g
INNER JOIN Film_Gatunek fg ON fg.IdGatunku = g.IdGatunek
INNER JOIN Film_Aktor fa ON fa.IdFilmu = fg.IdFilmu
INNER JOIN Aktorzy a ON a.IdAktorzy = fa.IdAktora
WHERE a.ImieNazwisko = 'Morgan Freeman'

--12. Kto jest najm³odszym aktorem graj¹cym w Fajerwerkach pró¿noœci?

SELECT TOP 1 a.ImieNazwisko, a.DataUrodzenia
FROM Aktorzy a
INNER JOIN Film_Aktor fa ON fa.IdAktora = a.IdAktorzy
INNER JOIN Filmy f ON f.IdFilmy = fa.IdFilmu
WHERE f.Tytul = 'Fajerwerki pró¿noœci' 
ORDER BY a.DataUrodzenia DESC 

--13. ZnajdŸ aktorów, którzy zagrali w wiêcej ni¿ jednym filmie

SELECT a.ImieNazwisko
FROM Aktorzy a
INNER JOIN Film_Aktor fa ON fa.IdAktora = a.IdAktorzy
GROUP BY a.ImieNazwisko 
HAVING COUNT(*) > 1

-- 14. Ile trwa³ najkrótszy a ile najd³u¿szy film

SELECT MAX(CzasTrwania_min) AS najdluzszy_film, Min(CzasTrwania_min) AS najkrotszy_film
FROM Filmy

-- 15. Ile filmów by³o wyprodukowanych w ka¿dym roku

SELECT RokProdukcji, COUNT(*) as liczba_filmow
FROM Filmy
GROUP BY RokProdukcji