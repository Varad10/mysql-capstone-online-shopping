-- ==========================================
-- 1. DDL: DATABASE & TABLE CREATION
-- Concepts: CREATE DATABASE, CREATE TABLE, Primary/Foreign Keys, Data Types
-- ==========================================

CREATE DATABASE IF NOT EXISTS OnlineShoppingDB;
USE OnlineShoppingDB;

-- Table 1: Customers
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    City VARCHAR(50),
    RegistrationDate DATE
);

-- Table 2: Categories
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL,
    Description TEXT
);

-- DDL Concept: ALTER TABLE
ALTER TABLE Categories ADD COLUMN IsActive BOOLEAN DEFAULT TRUE;

-- Table 3: Products
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryID INT,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Table 4: Orders
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2),
    OrderStatus VARCHAR(20) DEFAULT 'Processing',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Table 5: OrderDetails
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Table 6: Payments
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(30),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- ==========================================
-- 2. DML: INSERTING REALISTIC DATA (Minimum 20 Records)
-- Concepts: INSERT
-- ==========================================

-- Inserting 20 Customers
INSERT INTO Customers (FirstName, LastName, Email, Phone, City, RegistrationDate) VALUES
('Rohan', 'Sharma', 'rohan.sharma@example.com', '9876543210', 'Pune', '2025-01-15'),
('Priya', 'Desai', 'priya.desai@example.com', '9876543211', 'Mumbai', '2025-02-10'),
('Amit', 'Patil', 'amit.patil@example.com', '9876543212', 'Pune', '2025-02-22'),
('Neha', 'Joshi', 'neha.joshi@example.com', '9876543213', 'Delhi', '2025-03-05'),
('Vikram', 'Singh', 'vikram.singh@example.com', '9876543214', 'Bangalore', '2025-03-12'),
('Anjali', 'Mehta', 'anjali.mehta@example.com', '9876543215', 'Pune', '2025-04-01'),
('Rahul', 'Verma', 'rahul.verma@example.com', '9876543216', 'Hyderabad', '2025-04-18'),
('Sneha', 'Kulkarni', 'sneha.kulkarni@example.com', '9876543217', 'Mumbai', '2025-05-20'),
('Karan', 'Malhotra', 'karan.malhotra@example.com', '9876543218', 'Delhi', '2025-06-11'),
('Pooja', 'Rao', 'pooja.rao@example.com', '9876543219', 'Chennai', '2025-06-25'),
('Siddharth', 'Nair', 'sid.nair@example.com', '9876543220', 'Bangalore', '2025-07-09'),
('Kavita', 'Iyer', 'kavita.iyer@example.com', '9876543221', 'Pune', '2025-07-30'),
('Manish', 'Tiwari', 'manish.tiwari@example.com', '9876543222', 'Kolkata', '2025-08-14'),
('Divya', 'Bhat', 'divya.bhat@example.com', '9876543223', 'Mumbai', '2025-09-02'),
('Aditya', 'Chavan', 'aditya.chavan@example.com', '9876543224', 'Pune', '2025-09-15'),
('Shruti', 'Pandey', 'shruti.pandey@example.com', '9876543225', 'Delhi', '2025-10-08'),
('Raj', 'Kapoor', 'raj.kapoor@example.com', '9876543226', 'Mumbai', '2025-10-22'),
('Meera', 'Reddy', 'meera.reddy@example.com', '9876543227', 'Hyderabad', '2025-11-05'),
('Tarun', 'Bose', 'tarun.bose@example.com', '9876543228', 'Kolkata', '2025-11-20'),
('Aarti', 'Yadav', 'aarti.yadav@example.com', '9876543229', 'Pune', '2025-12-10');

-- Inserting 20 Categories
INSERT INTO Categories (CategoryName, Description) VALUES
('Smartphones', 'Mobile devices and accessories'),
('Laptops', 'Computers and laptops'),
('Men Clothing', 'Shirts, T-shirts, Trousers for men'),
('Women Clothing', 'Dresses, Tops, Ethnic wear'),
('Footwear', 'Shoes, Sandals, Sneakers'),
('Home Decor', 'Furniture, Lighting, Showpieces'),
('Kitchen Appliances', 'Microwaves, Blenders, Mixers'),
('Books', 'Fiction, Non-fiction, Educational'),
('Toys', 'Kids toys and games'),
('Beauty & Makeup', 'Skincare, Cosmetics, Perfumes'),
('Fitness', 'Gym equipment, Yoga mats'),
('Groceries', 'Daily essential food items'),
('Stationery', 'Pens, Notebooks, Office supplies'),
('Automotive', 'Car accessories, Bike parts'),
('Pet Supplies', 'Pet food, Toys, Grooming'),
('Watches', 'Analog, Digital, Smartwatches'),
('Jewelry', 'Necklaces, Rings, Earrings'),
('Sports', 'Cricket bats, Footballs, Badminton'),
('Bags & Luggage', 'Backpacks, Suitcases, Handbags'),
('Test Category', 'This category will be deleted');

-- Inserting 20 Products
INSERT INTO Products (CategoryID, ProductName, Price, StockQuantity) VALUES
(1, 'Samsung Galaxy S23', 75000.00, 50),
(1, 'iPhone 15', 82000.00, 30),
(2, 'Dell XPS 13', 120000.00, 15),
(2, 'MacBook Air M2', 105000.00, 20),
(3, 'Cotton Polo T-Shirt', 800.00, 100),
(3, 'Denim Jeans Men', 1500.00, 80),
(4, 'Floral Summer Dress', 1200.00, 60),
(5, 'Nike Running Shoes', 4500.00, 40),
(6, 'Wooden Coffee Table', 3500.00, 10),
(7, 'Philips Mixer Grinder', 2800.00, 25),
(8, 'Atomic Habits Book', 400.00, 150),
(9, 'Lego Building Blocks', 1800.00, 35),
(10, 'Lakme Sunscreen', 350.00, 200),
(11, 'Yoga Mat 6mm', 600.00, 120),
(12, 'Organic Green Tea', 250.00, 300),
(16, 'Titan Analog Watch', 2200.00, 45),
(17, 'Silver Pendant', 1800.00, 50),
(18, 'MRF Cricket Bat', 3000.00, 20),
(19, 'American Tourister Suitcase', 4500.00, 30),
(5, 'Puma Sneakers', 3200.00, 60);

-- Inserting 20 Orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, OrderStatus) VALUES
(1, '2026-07-01', 75000.00, 'Delivered'),
(2, '2026-07-02', 2000.00, 'Delivered'),
(3, '2026-07-03', 105000.00, 'Delivered'),
(4, '2026-07-05', 1200.00, 'Shipped'),
(5, '2026-07-06', 4500.00, 'Processing'),
(6, '2026-07-07', 3500.00, 'Delivered'),
(7, '2026-07-08', 3200.00, 'Shipped'),
(8, '2026-07-10', 400.00, 'Delivered'),
(9, '2026-07-11', 1800.00, 'Processing'),
(10, '2026-07-12', 350.00, 'Delivered'),
(11, '2026-07-14', 600.00, 'Shipped'),
(12, '2026-07-15', 750.00, 'Delivered'),
(13, '2026-07-16', 2200.00, 'Delivered'),
(14, '2026-07-18', 1800.00, 'Processing'),
(15, '2026-07-19', 3000.00, 'Shipped'),
(16, '2026-07-20', 4500.00, 'Delivered'),
(17, '2026-07-21', 82000.00, 'Delivered'),
(18, '2026-07-22', 120000.00, 'Processing'),
(19, '2026-07-24', 800.00, 'Delivered'),
(20, '2026-07-25', 1500.00, 'Shipped');

-- Inserting 20 OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 75000.00),
(2, 5, 1, 800.00),
(2, 7, 1, 1200.00),
(3, 4, 1, 105000.00),
(4, 7, 1, 1200.00),
(5, 8, 1, 4500.00),
(6, 9, 1, 3500.00),
(7, 20, 1, 3200.00),
(8, 11, 1, 400.00),
(9, 12, 1, 1800.00),
(10, 13, 1, 350.00),
(11, 14, 1, 600.00),
(12, 15, 3, 250.00),
(13, 16, 1, 2200.00),
(14, 17, 1, 1800.00),
(15, 18, 1, 3000.00),
(16, 19, 1, 4500.00),
(17, 2, 1, 82000.00),
(18, 3, 1, 120000.00),
(19, 5, 1, 800.00),
(20, 6, 1, 1500.00);

-- Inserting 20 Payments
INSERT INTO Payments (OrderID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES
(1, '2026-07-01', 75000.00, 'Credit Card', 'Completed'),
(2, '2026-07-02', 2000.00, 'UPI', 'Completed'),
(3, '2026-07-03', 105000.00, 'Debit Card', 'Completed'),
(4, '2026-07-05', 1200.00, 'UPI', 'Completed'),
(5, '2026-07-06', 4500.00, 'Net Banking', 'Pending'),
(6, '2026-07-07', 3500.00, 'Credit Card', 'Completed'),
(7, '2026-07-08', 3200.00, 'UPI', 'Completed'),
(8, '2026-07-10', 400.00, 'Cash on Delivery', 'Completed'),
(9, '2026-07-11', 1800.00, 'UPI', 'Pending'),
(10, '2026-07-12', 350.00, 'Debit Card', 'Completed'),
(11, '2026-07-14', 600.00, 'Credit Card', 'Completed'),
(12, '2026-07-15', 750.00, 'UPI', 'Completed'),
(13, '2026-07-16', 2200.00, 'Net Banking', 'Completed'),
(14, '2026-07-18', 1800.00, 'UPI', 'Pending'),
(15, '2026-07-19', 3000.00, 'Credit Card', 'Completed'),
(16, '2026-07-20', 4500.00, 'Debit Card', 'Completed'),
(17, '2026-07-21', 82000.00, 'Net Banking', 'Completed'),
(18, '2026-07-22', 120000.00, 'Credit Card', 'Pending'),
(19, '2026-07-24', 800.00, 'UPI', 'Completed'),
(20, '2026-07-25', 1500.00, 'Cash on Delivery', 'Completed');

-- ==========================================
-- 3. DML: UPDATE & DELETE
-- Concepts: UPDATE, DELETE
-- ==========================================

-- Updating stock quantity after a warehouse restock
UPDATE Products SET StockQuantity = StockQuantity + 20 WHERE CategoryID = 1;

-- Deleting the dummy category we created earlier
DELETE FROM Categories WHERE CategoryName = 'Test Category';


-- ==========================================
-- 4. BUSINESS REPORTS (10 Queries)
-- Concepts: SELECT, WHERE, ORDER BY, GROUP BY, HAVING, JOINS, Aggregate Functions, Subqueries, Views
-- ==========================================

-- Report 1: Top 5 customers by revenue
-- Concepts: INNER JOIN, GROUP BY, SUM, ORDER BY, LIMIT
SELECT o.FirstName, o.LastName, SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderStatus != 'Cancelled'
GROUP BY c.CustomerID
ORDER BY TotalSpent DESC
LIMIT 5;

-- Report 2: Highest revenue generating product
-- Concepts: Subquery, MAX, INNER JOIN, GROUP BY
SELECT p.ProductName, SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM Products p
INNER JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID
ORDER BY TotalRevenue DESC
LIMIT 1;

-- Report 3: Monthly Sales Trend (Total Sales per Month in 2026)
-- Concepts: Date Functions, SUM, GROUP BY, ORDER BY
SELECT MONTHNAME(OrderDate) AS Month, SUM(TotalAmount) AS MonthlyRevenue
FROM Orders
WHERE YEAR(OrderDate) = 2026
GROUP BY MONTH(OrderDate), MONTHNAME(OrderDate)
ORDER BY MONTH(OrderDate);

-- Report 4: Most ordered product by quantity
-- Concepts: INNER JOIN, SUM, GROUP BY, ORDER BY
SELECT p.ProductName, SUM(od.Quantity) AS TotalUnitsSold
FROM Products p
INNER JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID
ORDER BY TotalUnitsSold DESC
LIMIT 5;

-- Report 5: Average Order Value
-- Concepts: Aggregate Function (AVG)
SELECT ROUND(AVG(TotalAmount), 2) AS AverageOrderValue
FROM Orders;

-- Report 6: Category-wise sales exceeding ₹5000
-- Concepts: INNER JOIN, GROUP BY, HAVING, SUM
SELECT c.CategoryName, SUM(od.Quantity * od.UnitPrice) AS CategoryRevenue
FROM Categories c
INNER JOIN Products p ON c.CategoryID = p.CategoryID
INNER JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY c.CategoryName
HAVING CategoryRevenue > 5000
ORDER BY CategoryRevenue DESC;

-- Report 7: Customer purchase history showing all customers, even those with zero purchases
-- Concepts: LEFT JOIN, IFNULL/COALESCE, GROUP BY
SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS TotalOrders, IFNULL(SUM(o.TotalAmount), 0) AS TotalSpent
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalOrders DESC;

-- Report 8: Products that have never been ordered (Inventory Check)
-- Concepts: RIGHT JOIN (or LEFT JOIN with IS NULL)
SELECT p.ProductName, p.StockQuantity
FROM OrderDetails od
RIGHT JOIN Products p ON od.ProductID = p.ProductID
WHERE od.OrderDetailID IS NULL;

-- Report 9: Pending payments report with customer details
-- Concepts: INNER JOIN, WHERE
SELECT c.FirstName, c.LastName, c.Phone, o.OrderID, p.Amount, p.PaymentMethod
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
INNER JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.PaymentStatus = 'Pending';

-- Report 10: Overall Summary Dashboard (Combined KPIs)
-- Concepts: CREATE VIEW, Multiple Aggregate Functions (COUNT, SUM, MIN, MAX)
CREATE VIEW StoreDashboard AS
SELECT 
    (SELECT COUNT(*) FROM Customers) AS TotalCustomers,
    (SELECT COUNT(*) FROM Orders) AS TotalOrders,
    (SELECT SUM(TotalAmount) FROM Orders WHERE OrderStatus = 'Delivered') AS TotalRevenue,
    (SELECT MIN(TotalAmount) FROM Orders) AS MinimumOrderValue,
    (SELECT MAX(TotalAmount) FROM Orders) AS MaximumOrderValue;

-- To view the dashboard results, simply run:
SELECT * FROM StoreDashboard;
