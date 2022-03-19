
								#	BIBLIOTEKA ZADANIA




#1) Lista książek, które nie zostały nigdy wypożyczone:

SELECT id, nazwa FROM Ksiazki
	WHERE NOT EXISTS
	(SELECT * FROM Wypozyczenia 
	WHERE Ksiazki.id=Wypozyczenia.ksiazka_id);
		


#2) Lista ksiązek, które zostały wypozyczone konkretnego dnia:

 SELECT Ksiazki.id, Ksiazki.nazwa, Wypozyczenia.data_wypozyczenia
     FROM Ksiazki
     LEFT OUTER JOIN Wypozyczenia
     ON Ksiazki.id = Wypozyczenia.ksiazka_id
     WHERE Wypozyczenia.data_wypozyczenia = '2022-02-03';
	
	


#3) Zestawienie czytelników, którzy posiadają aktualnie wypożyczoną książkę i nie dokonali jej zwrócenia:



 SELECT DISTINCT Czytelnicy.id, Czytelnicy.imie, Czytelnicy.nazwisko FROM Czytelnicy
     INNER JOIN Wypozyczenia ON Czytelnicy.id = Wypozyczenia.czytelnik_id
     WHERE data_zwrotu IS NULL;


#4) Kategorie wraz z ilością książek przypisanych do danej kategorii:

SELECT Kategorie.nazwa, Kategorie.id, COUNT(Ksiazki.kategoria_id) AS liczba_ksiazek
FROM Ksiazki 
LEFT OUTER JOIN Kategorie ON Kategorie.id = Ksiazki.kategoria_id
GROUP BY kategoria_id;

#\/\/\//\/\/\\/\/\/\/\/\/\/\/\/\/\/\/\/\/\\/\/\/\/\/\/\/\/\/\//\/\
#wersja szybsza, bardziej esencjonalna
SELECT kategoria_id, COUNT(kategoria_id)
    FROM Ksiazki
    GROUP BY kategoria_id;
	

#5) Pierwszych pięciu czytelników, którzy posiadają największą ilość wypożyczeń:

SELECT DISTINCT Czytelnicy.imie, Czytelnicy.nazwisko, COUNT(Wypozyczenia.czytelnik_id) AS ilosc_wypozyczen
	FROM Wypozyczenia
	LEFT OUTER JOIN Czytelnicy ON Czytelnicy.id = Wypozyczenia.czytelnik_id
	GROUP BY czytelnik_id
	ORDER BY ilosc_wypozyczen DESC
	LIMIT 5;



#	6) Czytelnicy wraz z sumą nałożonych na nich kar. Ci o najwyższej sumie kar mają być wyświetlani jako pierwsi.
	
	
SELECT Wypozyczenia.czytelnik_id, SUM(Kary.kwota) AS Suma_kar
	FROM Kary
	LEFT OUTER JOIN Wypozyczenia
	ON Wypozyczenia.id = Kary.wypozyczenie_id
	WHERE 
	GROUP BY Wypozyczenia.czytelnik_id
	ORDER BY Suma_kar DESC; 
	



#7). Z jakiego typu kar posiadamy największe wpływy, wyświetl nazwę kary wraz z sumą kwot.


SELECT Typy_kar.nazwa, SUM(Kary.kwota) AS Suma_naleznosci
	FROM Kary 
	LEFT OUTER JOIN Typy_kar ON Kary.typ_kary_id = Typy_kar.id
	GROUP BY nazwa
	ORDER BY Suma_naleznosci DESC;
	



#8). Czytelnicy w jakim wieku posiadają największą ilość wypożyczeń? Zwróć wiek wraz z ilością wypożyczeń.

SELECT  TIMESTAMPDIFF (YEAR, Czytelnicy.data_urodzenia, CURDATE()) As Wiek, COUNT(Wypozyczenia.id)
	FROM Czytelnicy
	LEFT OUTER JOIN Wypozyczenia ON Czytelnicy.id = Wypozyczenia.czytelnik_id
	GROUP BY Wiek
	ORDER BY COUNT(Wypozyczenia.id) DESC;



#9). Która płeć wypożycza większą ilość książek oraz jakie ma to odniesienie do 
	#  wysokości naliczonych kar. Zwróć płeć, ilość wypożyczeń oraz sumę naliczonych kar.
	

SELECT Czytelnicy.plec, COUNT(Wypozyczenia.id) AS ilosc_wypozyczen, SUM(Kary.kwota) AS Suma_naleznosci
		FROM ((Czytelnicy
		LEFT OUTER JOIN Wypozyczenia ON Czytelnicy.id = Wypozyczenia.czytelnik_id)
		LEFT OUTER JOIN Kary ON Wypozyczenia.id = Kary.wypozyczenie_id)
		GROUP BY Czytelnicy.plec;
		
		#Stosując INNER JOIN uzyskamy liczbę wypozyczeń objętych karą
		


#10). Wyświetl książki, którym zostało mniej niż tydzień do planowej daty ich zwrotu.

SELECT Ksiazki.id, Ksiazki.nazwa, TIMESTAMPDIFF(DAY, Wypozyczenia.data_wypozyczenia, CURDATE()) AS liczba_dni_wypozyczenia
	FROM Ksiazki
	LEFT OUTER JOIN Wypozyczenia 
	ON Ksiazki.id = Wypozyczenia.ksiazka_id
	WHERE TIMESTAMPDIFF(DAY, Wypozyczenia.data_wypozyczenia, CURDATE()) <7;
	

#11). Wyświetl książki, które nie zostały zwrócone w terminie oraz
#	nie zostały dla nich jeszcze naliczone kary z tytułu owego przekroczenia.
	
	SELECT Ksiazki.nazwa AS Tytul_ksiazki, Wypozyczenia.id AS id_wypozyczenia
		FROM ((Ksiazki
		LEFT OUTER JOIN Wypozyczenia
		ON Ksiazki.id = Wypozyczenia.ksiazka_id)
		LEFT OUTER JOIN Kary 
		ON  Wypozyczenia.id = Kary.wypozyczenie_id)
		WHERE TIMESTAMPDIFF(DAY, Wypozyczenia.data_wypozyczenia, CURDATE()) >14
		AND Kary.kwota IS NULL;
		
		