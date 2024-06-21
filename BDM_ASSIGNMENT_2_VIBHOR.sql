-- BDM ASSIGNMENT 2

CREATE DATABASE IF NOT EXISTS BDM_assignment_2_vib;

USE DBM_assignment_vib_2;
-- CUSTOMER TABLE
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '234-567-8901'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '345-678-9012'),
(4, 'Bob', 'Brown', 'bob.brown@example.com', '456-789-0123'),
(5, 'Charlie', 'Davis', 'charlie.davis@example.com', '567-890-1234');


-- ORDERS TABLE

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(101, 1, '2023-01-15'),
(102, 2, '2023-01-20'),
(103, 1, '2023-02-10'),
(104, 3, '2023-02-15'),
(105, 4, '2023-03-01');


-- BOOKS TABLE

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(50),
    Price DECIMAL(5, 2),
    Stock INT
);

INSERT INTO Books (BookID, Title, Author, Price, Stock) VALUES
(201, 'The Great Gatsby', 'F. Scott Fitzgerald', 10.99, 100),
(202, 'To Kill a Mockingbird', 'Harper Lee', 7.99, 200),
(203, '1984', 'George Orwell', 8.99, 150),
(204, 'Pride and Prejudice', 'Jane Austen', 6.99, 120),
(205, 'The Catcher in the Rye', 'J.D. Salinger', 9.99, 130);


-- ORDERSDETAILS TABLE

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    BookID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO OrderDetails (OrderDetailID, OrderID, BookID, Quantity) VALUES
(301, 101, 201, 2),
(302, 101, 202, 1),
(303, 102, 203, 3),
(304, 103, 204, 1),
(305, 103, 205, 1),
(306, 104, 201, 2),
(307, 105, 202, 2);


-- 1) Retrieve a list of all orders along with the customer’s name who placed the order.'

SELECT Orders.OrderID , Customers.FirstName , Customers.LastName
FROM Orders
INNER JOIN Customers ON  Customers.CustomerID = Orders.CustomerID;


-- 2) Retrieve a list of all books ordered along with the order date and customer name.'

SELECT Books.Title, Orders.OrderDate,Customers.FirstName,Customers.LastName
FROM OrderDetails
INNER JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
INNER JOIN Books ON OrderDetails.BookID = Books.BookID;

-- 3)  Retrieve the list of books along with their prices, and display the price with a currency symbol ('$').'
 
SELECT BookID , Title , concat(Price,'$') AS book_price
FROM Books;

-- 4) Retrieve the customer names in uppercase.'

SELECT upper(Customers.FirstName) AS First_Name FROM customers;

-- 5) Retrieve the total quantity of books ordered by each customer.'


SELECT * FROM Customers;

SELECT Customer.CustomerID, Customer.FirstName, Customer.LastName, SUM(OrderDetails.Quantity) AS total_quantity
FROM Customers Customer
INNER JOIN Orders Orders ON Customer.CustomerID = Orders.CustomerID
INNER JOIN OrderDetails OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Customer.CustomerID, Customer.FirstName, Customer.LastName;

-- 6) Retrieve the total sales amount for each book.'

SELECT * FROM OrderDetails;

SELECT Books.BookID, Books.Title, SUM(OrderDetails.Quantity * Books.Price) AS TotalSales
FROM Books Books
INNER JOIN OrderDetails ON Books.BookID = OrderDetails.BookID
GROUP BY Books.BookID, Books.Title;


-- 7) Retrieve a list of all customers and the total number of orders they have placed. Include customers who have not placed any orders.'

SELECT Customer.CustomerID , Customer.FirstName , Customer.LastName, COUNT(Orders.OrderID) AS TotalOrders
FROM Customers Customer
LEFT JOIN Orders ON Customer.CustomerID = Orders.CustomerID
GROUP BY Customer.CustomerID, Customer.FirstName, Customer.LastName; 


-- 8) Retrieve the list of all books along with the total quantity ordered. Include books that have not been ordered.'

SELECT Books.BookID, Books.Title, SUM(OrderDetails.Quantity) AS total_quantity_orderedx
FROM Books Books
LEFT JOIN OrderDetails ON Books.BookID = OrderDetails.BookID
GROUP BY Books.BookID, Books.Title;

