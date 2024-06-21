#1.Write a SQL query to insert at least 5 records into a table named "Employees." The table should have the following columns:
CREATE TABLE Employees(
EmployeeID INT auto_increment PRIMARY KEY
,FirstName VARCHAR(50)
,LastName VARCHAR(50)
,Email VARCHAR(100)
,Department VARCHAR(50)
);
Select * From Employees;
INSERT INTO Employees(FirstName,LastName,Email,Department)
VALUES('Virat','Kohli','virat.kohli@example.com','HR')
	, ('Rohit','Sharma','rohit.sharma@gmail.com','Marketing')
	,('Hardik','Pandya','hardik.pandya@gmail.com','IT')
	,('Jasprit','bumrah','jasprit.bumrah@gmail.com','Finance')
	,('Kuldeep','Yadav','kuldeep.yadav@gmail.com','Accountant');
SELECT * From Employees;

#2. Update the email address of the employee with EmployeeID = 3 to "newemail@example.com".
UPDATE Employees
SET Email = 'newemail@example.com'
WHERE EmployeeID = 3;

#3. Delete the record of the employee with EmployeeID = 5 from the "Employees" table
DELETE FROM Employees
WHERE EmployeeID = 5;

#4. Write a SQL query to retrieve the details of all employees who belong to the "Marketing" department
SELECT * FROM Employees
WHERE DEPARTMENT = ‘Marketing’;

#5.Create a new table named "Orders" with the following columns: 
CREATE TABLE Orders(
	OrderID INT auto_increment PRIMARY KEY
	,EmployeeID INT
	,OrderDate DATE
	,TotalAmount DECIMAL(10,2)
	,FOREIGN KEY (EmployeeID) references Employees(EmployeeID)
	);
SELECT * FROM Orders;

#6. Insert at least 3 records into the "Orders" table, ensuring that each order is associated with an existing employee from the "Employees" table.
INSERT INTO Orders(OrderID,EmployeeID,TotalAmount)
VALUES (1,’2024-05-01’,120.00)
	,(2,’2024-05-02’,200.00)
	,(3,’2024-05-03’,150.00);



