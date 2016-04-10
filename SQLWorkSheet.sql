SELECT FirstName, LastName, CauseOfDeath,PlanetName
FROM tblPerson
JOIN tblPlanet ON tblPerson.PersonID = tblPlanet.PersonID
WHERE DateOfDeath IS NOT NULL

--Lista alla som har omkommit.
SELECT *
FROM tblPerson
WHERE DateOfDeath IS NOT NULL




--1.Listan ska visa fullst�ndiga namnet, avd.namn, fr�n vilken planet, k�n, ras oh och rang.
SELECT FirstName, LastName, Department,PlanetName, Gender, Race, [Rank]
FROM tblPerson
JOIN tblPlanet ON tblPerson.PersonID = tblPlanet.PersonID

--2.Utav dem som har omkommit, visa namn, d�dsorsak och datumet.
SELECT FirstName, LastName, CauseOfDeath, DateOfDeath
FROM tblPerson
WHERE DateOfDeath IS NOT NULL

--3.Alla d�da utav kaptens grad som tj�nar �ver 50000.

SELECT FirstName, LastName
FROM tblPerson
JOIN tblSalary ON tblPerson.PersonID = tblSalary.PersonID
WHERE Salary > 50000
AND DateOfDeath IS NOT NULL
AND [Rank] = 'Captain'

--4.Alla d�da fr�n en viss planet.
SELECT FirstName, LastName, PlanetName
FROM tblPerson
JOIN tblPlanet ON tblPerson.PersonID = tblPlanet.PersonID
WHERE DateOfDeath IS NOT NULL
AND PlanetName = 'Tellus'

--5.Alla d�da med namn och mellan en viss datums till en annan datum.
SELECT FirstName, LastName
FROM tblPerson
WHERE DateOfDeath BETWEEN '2001-01-01' AND '2080-01-01'

--6.Visa antal av olika rang.
SELECT [Rank]
FROM tblPerson


SELECT COUNT(*)
FROM tblPerson
WHERE [Rank] = 'Captain'

SELECT *
FROM tblPerson
WHERE [Rank] = 'Captain'

--2.Visa max l�nen p� den som har omkommit.
SELECT FirstName, LastName, Salary
FROM tblPerson
JOIN tblSalary ON tblSalary.PersonID = tblPerson.PersonID
WHERE DateOfDeath IS NOT NULL
ORDER BY Salary DESC

--3.Gruppera alla baserat p� d�dsorsak.
SELECT FirstName, LastName, CauseOfDeath
FROM tblPerson
WHERE DateOfDeath IS NOT NULL
ORDER BY CauseOfDeath

--4.Vad �r genomsnittsl�nen p� bes�ttningen, levande och d�da.

SELECT AVG(Salary)
FROM tblPerson
JOIN tblSalary ON tblPerson.PersonID = tblSalary.PersonID
WHERE DateOfDeath IS NOT NULL

SELECT AVG(Salary)
FROM tblPerson
JOIN tblSalary ON tblPerson.PersonID = tblSalary.PersonID
WHERE DateOfDeath IS NULL
