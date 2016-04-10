SELECT FirstName, LastName, CauseOfDeath,PlanetName
FROM tblPerson
JOIN tblPlanet ON tblPerson.PersonID = tblPlanet.PersonID
WHERE DateOfDeath IS NOT NULL

--Lista alla som har omkommit.
SELECT *
FROM tblPerson
WHERE DateOfDeath IS NOT NULL




--1.Listan ska visa fullständiga namnet, avd.namn, från vilken planet, kön, ras oh och rang.
SELECT FirstName, LastName, Department,PlanetName, Gender, Race, [Rank]
FROM tblPerson
JOIN tblPlanet ON tblPerson.PersonID = tblPlanet.PersonID

--2.Utav dem som har omkommit, visa namn, dödsorsak och datumet.
SELECT FirstName, LastName, CauseOfDeath, DateOfDeath
FROM tblPerson
WHERE DateOfDeath IS NOT NULL

--3.Alla döda utav kaptens grad som tjänar över 50000.

SELECT FirstName, LastName
FROM tblPerson
JOIN tblSalary ON tblPerson.PersonID = tblSalary.PersonID
WHERE Salary > 50000
AND DateOfDeath IS NOT NULL
AND [Rank] = 'Captain'

--4.Alla döda från en viss planet.
SELECT FirstName, LastName, PlanetName
FROM tblPerson
JOIN tblPlanet ON tblPerson.PersonID = tblPlanet.PersonID
WHERE DateOfDeath IS NOT NULL
AND PlanetName = 'Tellus'

--5.Alla döda med namn och mellan en viss datums till en annan datum.
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

--2.Visa max lönen på den som har omkommit.
SELECT FirstName, LastName, Salary
FROM tblPerson
JOIN tblSalary ON tblSalary.PersonID = tblPerson.PersonID
WHERE DateOfDeath IS NOT NULL
ORDER BY Salary DESC

--3.Gruppera alla baserat på dödsorsak.
SELECT FirstName, LastName, CauseOfDeath
FROM tblPerson
WHERE DateOfDeath IS NOT NULL
ORDER BY CauseOfDeath

--4.Vad är genomsnittslönen på besättningen, levande och döda.

SELECT AVG(Salary)
FROM tblPerson
JOIN tblSalary ON tblPerson.PersonID = tblSalary.PersonID
WHERE DateOfDeath IS NOT NULL

SELECT AVG(Salary)
FROM tblPerson
JOIN tblSalary ON tblPerson.PersonID = tblSalary.PersonID
WHERE DateOfDeath IS NULL
