--Lista alla som har omkommit. 1.Listan ska visa fullst�ndiga namnet, avd.namn, fr�n vilken planet, k�n, ras oh och rang.

--SELECT FirstName,LastName,DepartmentName, PlanetName,Race, GenderName, DepartmentName, RankName
--FROM tblPerson
--JOIN tblPlanet ON tblPerson.PlanetID = tblPlanet.PlanetID
--JOIN tblGender ON tblPerson.GenderID = tblGender.GenderID
--JOIN tblDepartment ON tblPerson.DepartmentID = tblDepartment.DepartmentID
--JOIN tblRank ON tblPerson.RankID = tblRank.RankID
--WHERE DateofDeath IS NOT NULL

USE[SpaceStation]
GO
ALTER PROCEDURE spTest
AS
SELECT FirstName,LastName,DepartmentName, PlanetName,Race, GenderName, DepartmentName, RankName
FROM tblPerson 
JOIN tblPlanet ON tblPerson.PlanetID = tblPlanet.PlanetID
JOIN tblGender ON tblPerson.GenderID = tblGender.GenderID
JOIN  tblDepartment ON tblPerson.DepartmentID = tblDepartment.DepartmentID
JOIN tblRank ON tblPerson.RankID = tblRank.RankID
WHERE DateofDeath IS NOT NULL
GO

EXEC spTest 




--Utav dem som har omkommit, visa namn, d�dsorsak och datumet.

--SELECT FirstName,LastName,DateofDeath,CauseOfDeathName
--FROM tblPerson
--JOIN CauseOfDeath ON tblPerson.CauseOfDeathID = CauseOfDeath.CauseOfDeathID
--WHERE DateofDeath IS NOT NULL

USE[SpaceStation]
GO
ALTER PROCEDURE spTest2
AS
SELECT FirstName,LastName,DateofDeath,CauseOfDeathName
FROM tblPerson
JOIN CauseOfDeath ON tblPerson.CauseOfDeathID = CauseOfDeath.CauseOfDeathID
WHERE DateofDeath IS NOT NULL
GO

EXEC spTest2




--Alla d�da utav kaptens grad som tj�nar �ver 50000.

--SELECT FirstName,LastName, RankName
--FROM tblPerson
--JOIN tblRank ON tblPerson.RankID = tblRank.RankID
--WHERE DateofDeath IS NOT NULL AND RankName = 'Captain' AND RankSalary > 50000

USE[SpaceStation]
GO
ALTER PROCEDURE spTest3
AS
SELECT FirstName,LastName, RankName
FROM tblPerson
JOIN tblRank ON tblPerson.RankID = tblRank.RankID
WHERE RankName = 'Captain' AND RankSalary > 50000
GO

EXEC spTest3

--Alla d�da fr�n en viss planet.

--SELECT FirstName,LastName, PlanetName
--FROM tblPerson
--JOIN tblRank ON tblPerson.RankID = tblRank.RankID
--JOIN tblPlanet ON tblPerson.PlanetID = tblPlanet.PlanetID
--WHERE DateofDeath IS NOT NULL AND PlanetName = 'Tellus'

ALTER PROCEDURE spTest4
AS
SELECT FirstName,LastName, PlanetName
FROM tblPerson
JOIN tblRank ON tblPerson.RankID = tblRank.RankID
JOIN tblPlanet ON tblPerson.PlanetID = tblPlanet.PlanetID
WHERE PlanetName = 'Tellus'
GO

EXEC spTest4

--Alla d�da med namn och mellan en viss datums till en annan datum.

--SELECT FirstName,LastName, PlanetName
--FROM tblPerson
--JOIN tblRank ON tblPerson.RankID = tblRank.RankID
--JOIN tblPlanet ON tblPerson.PlanetID = tblPlanet.PlanetID
--WHERE DateofDeath BETWEEN '1980-01-01' AND '2077-01-01' 

CREATE PROCEDURE spTest5
AS
SELECT FirstName,LastName, PlanetName
FROM tblPerson
JOIN tblRank ON tblPerson.RankID = tblRank.RankID
JOIN tblPlanet ON tblPerson.PlanetID = tblPlanet.PlanetID
WHERE DateofDeath BETWEEN '1980-01-01' AND '2077-01-01' 
GO

EXEC spTest5


--Visa antal av olika rang.

--SELECT RankName, COUNT(*) AS 'NBR of persons in each rank'
--FROM tblPerson JOIN tblRank ON tblPerson.RankID = tblRank.RankID
-- GROUP BY RankName

CREATE PROCEDURE spTest6
AS
SELECT RankName, COUNT(*) AS 'NBR of persons in each rank'
FROM tblPerson JOIN tblRank ON tblPerson.RankID = tblRank.RankID
 GROUP BY RankName
 GO

 EXEC spTest6



 --Visa max l�nen p� den som har omkommit.

--SELECT FirstName,LastName,RankSalary
--FROM tblPerson
--JOIN tblRank ON tblPerson.RankID = tblRank.RankID
--WHERE DateofDeath IS NOT NULL

CREATE PROCEDURE spTest7
AS
SELECT FirstName,LastName,RankSalary
FROM tblPerson
JOIN tblRank ON tblPerson.RankID = tblRank.RankID
WHERE DateofDeath IS NOT NULL
GO

EXEC spTest7

--Gruppera alla baserat p� d�dsorsak.

--SELECT FirstName, LastName, CauseOfDeathName
--FROM tblPerson
--JOIN CauseOfDeath ON tblPerson.CauseOfDeathID = CauseOfDeath.CauseOfDeathID
--WHERE DateOfDeath IS NOT NULL
--ORDER BY CauseOfDeathName

CREATE PROCEDURE spTest8
AS
SELECT FirstName, LastName, CauseOfDeathName
FROM tblPerson
JOIN CauseOfDeath ON tblPerson.CauseOfDeathID = CauseOfDeath.CauseOfDeathID
WHERE DateOfDeath IS NOT NULL
ORDER BY CauseOfDeathName
GO

EXEC spTest8


--Vad �r genomsnittsl�nen p� bes�ttningen, levande och d�da.

--SELECT AVG(RankSalary)
--FROM tblPerson
--JOIN tblRank ON tblPerson.RankID = tblRank.RankID
--WHERE DateOfDeath IS NOT NULL

--SELECT AVG(RankSalary)
--FROM tblPerson
--JOIN tblRank ON tblPerson.RankID = tblRank.RankID
--WHERE DateOfDeath IS NULL

CREATE PROCEDURE spTest9
AS
SELECT AVG(RankSalary)
FROM tblPerson
JOIN tblRank ON tblPerson.RankID = tblRank.RankID
WHERE DateOfDeath IS NOT NULL

SELECT AVG(RankSalary)
FROM tblPerson
JOIN tblRank ON tblPerson.RankID = tblRank.RankID
WHERE DateOfDeath IS NULL
GO

EXEC spTest9





