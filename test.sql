-- Question 1: Afficher les noms et prénoms des employés
SELECT FirstName, LastName FROM Employees;

-- Question 2: Afficher les commandes passées en janvier 1997
SELECT * FROM Orders WHERE OrderDate BETWEEN '1997-01-01' AND '1997-01-31';

-- Question 3: Ajouter le transporteur « UPS France »
INSERT INTO Shippers (ShipperName, Phone) VALUES ('UPS France', NULL);

-- Question 4: Supprimer l'employé Robert KING (employeeID=7)
DELETE FROM Employees WHERE EmployeeID = 7;

-- Question 5: Compter les commandes traitées par Robert KING en 1996
SELECT COUNT(*) AS NombreDeCommandes FROM Orders WHERE EmployeeID = 7 AND YEAR(OrderDate) = 1996;

-- Question 6: Compter le nombre de commandes traitées par chaque employé
SELECT EmployeeID, COUNT(*) AS NombreDeCommandes FROM Orders GROUP BY EmployeeID;

-- Question 7: Afficher le prix minimal, maximal et moyen des produits
SELECT MIN(Price) AS PrixMin, MAX(Price) AS PrixMax, AVG(Price) AS PrixMoyen FROM Products;

-- Question 8: Afficher les noms des produits par ordre alphabétique
SELECT ProductName FROM Products ORDER BY ProductName ASC;

-- Question 9: Afficher les noms des transporteurs ayant livré au moins une commande en 1996
SELECT DISTINCT Shippers.ShipperName FROM Shippers 
INNER JOIN Orders ON Shippers.ShipperID = Orders.ShipperID 
WHERE YEAR(OrderDate) = 1996;

-- Exemple supplémentaire: Ajouter un nouveau client dans la table Customers
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country) 
VALUES ('Chabchoub', 'Yousra Chabchoub', '21 rue Assas', 'Paris', '75006', 'France');

-- Exemple supplémentaire: Modifier la ville pour un client spécifique
UPDATE Customers SET City = 'Issy' WHERE CustomerName = 'Chabchoub';

-- Exemple supplémentaire: Supprimer un client de la table Customers
DELETE FROM Customers WHERE CustomerName = 'Chabchoub';

-- Exemple supplémentaire: Réduction de 50% sur les prix des produits de catégorie 1
UPDATE Products SET Price = Price * 0.5 WHERE CategoryID = 1;

-- Exemple supplémentaire: Afficher le nombre de pays distincts des clients
SELECT COUNT(DISTINCT Country) AS NombreDePays FROM Customers;

-- Exemple supplémentaire: Afficher pour chaque pays le nombre de clients associés
SELECT Country, COUNT(CustomerID) AS NombreDeClients FROM Customers GROUP BY Country;

-- Exemple supplémentaire: Afficher les commandes traitées par des employés
SELECT Employees.FirstName, Employees.LastName, Orders.OrderDate 
FROM Employees 
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID;

-- Exemple supplémentaire: Afficher les produits et leurs catégories
SELECT Products.ProductName, Categories.CategoryName 
FROM Products 
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;