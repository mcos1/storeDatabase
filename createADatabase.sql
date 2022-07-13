--CREATE TABLE Customers (
--	CustomerID INT PRIMARY KEY,
--	FirstName NVARCHAR(255),
--	LastName NVARCHAR(255),
--	Address NVARCHAR(255),
--	City NVARCHAR(255),
--	State NVARCHAR(255),
--	ZipCode NVARCHAR(255)
--)

--CREATE TABLE Products (
--	ProductID INT PRIMARY KEY,
--	Name NVARCHAR(255),
--	Color NVARCHAR(255),
--	Cost Decimal(18, 2),
--	Price Decimal (18, 2),
--)

--CREATE TABLE Orders (
--	OrderID INT PRIMARY KEY,
--	CustomerID INT,
--	OrderDate DATETIME,
--	ShippedDate DATETIME
--)


--CREATE TABLE OrderDeets (
--	CustomerID INT,
--	OrderID INT,
--	ProductID INT,
--	Quantity INT
--);

--INSERT INTO Customers (FirstName, LastName, Address, City, State, ZipCode)
--VALUES ('Michael', 'Costigan', '2608 River Rd', 'Wall', 'NJ', 08736),
--	('John', 'Smith', '404 Chester Ave', 'Brielle', 'NJ', 08730),
--	('Susan', 'Doe', '600 Borrie Ave', 'Manasquan', 'NJ', 08736),
--	('Mary', 'Peters', '1000 Arnold Ave', 'Point Pleasant', 'NJ', 08742),
--	('Ken', 'Rogers', '7th ave', 'Miami', 'FL', 15720)

--SELECT *
--FROM Customers;

--INSERT INTO Products (Name, Color, Cost, Price)
--VALUES ('Computer', 'Black', 349.99, 499.99),
--	('Pillow', 'White', 19.99, 49.99),
--	('Grandfather Clock', 'Brown', 399.99, 599.99),
--	('Jewerly Box', 'Black', 39.99, 59.99),
--	('Calendar', 'Blue', 4.99, 29.99),
--	('Canoe', 'Green', 749.99, 1199.99),
--	('Wallet', 'Black', 19.99, 34.99),
--	('Playing Cards', 'White', 3.99, 9.99);

--INSERT INTO Orders (CustomerID, OrderDate, ShippedDate)
--VALUES (1, '2020-01-10', '2020-01-11'),
--	(1, '2020-01-10', '2020-01-11'),
--	(1, '2020-01-10', '2020-01-13'),
--	(2, '2020-01-15', '2020-01-20'),
--	(3, '2020-01-17', '2020-01-17'),
--	(3, '2020-01-17', '2020-01-18'),
--	(4, '2020-02-02', '2020-02-03'),
--	(4, '2020-02-04', '2020-02-07'),
--	(5, '2020-02-10', '2020-02-10'),
--	(5, '2020-02-15', '2020-02-17'),
--	(5, '2020-03-10', '2020-03-21');




--INSERT INTO OrderDeets (CustomerID, OrderID, ProductID, Quantity)
--VALUES (1, 1, 2, 3),
--	(1, 2, 1, 1),
--	(1, 3, 7, 2),
--	(2, 4, 6, 1),
--	(3, 5, 2, 2),
--	(3, 6, 8, 5),
--	(4, 7, 3, 1),
--	(4, 8, 4, 1),
--	(5, 9, 5, 3),
--	(5, 10, 1, 1),
--	(5, 11, 6, 1);



--SELECT CustomerID, OrderDate, Quantity
--FROM Orders
--LEFT JOIN OrderDetails
--	ON Orders.OrderID = OrderDetails.OrderID;


--SELECT 
--	Concat(FirstName, ' ', LastName) AS Customer,
--	COUNT(OrderID) AS ordersPerCustomer
--FROM Customers
--LEFT JOIN Orders
--	ON Customers.CustomerID = Orders.CustomerID
--GROUP BY Concat(FirstName, ' ', LastName);



--SELECT
--	Customers.FirstName AS name,
--	COUNT(OrderDeets.Quantity) AS productsOrdered,
--	SUM(Price - Cost) AS REvenue
--FROM OrderDeets
--	LEFT JOIN Customers
--		ON OrderDeets.CustomerID = Customers.CustomerID
--	LEFT JOIN Products
--		ON OrderDeets.ProductID = Products.ProductID
--GROUP BY Customers.FirstName;

SELECT
	Customers.FirstName AS name,
	SUM((Price - Cost)/Cost) * 100 AS NetProfitMargin
FROM OrderDeets
	LEFT JOIN Customers
		ON OrderDeets.CustomerID = Customers.CustomerID
	LEFT JOIN Products
		ON OrderDeets.ProductID = Products.ProductID
GROUP BY Customers.FirstName;