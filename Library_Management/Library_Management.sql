CREATE DATABASE LIBRARY ;
USE LIBRARY ;

CREATE TABLE Branch (Branch_No INT PRIMARY KEY, Manager_Id INT, Branch_Address VARCHAR(100) , Contact_No BIGINT ) ;
INSERT INTO BRANCH (BRANCH_NO, MANAGER_ID, BRANCH_ADDRESS, CONTACT_NO ) VALUES
(1, 1001, '123 Main Street, Cityville, State', '1234567890'),
(2, 2001, '456 Elm Avenue, Townsville, State', '9876543210'),
(3, 3001, '789 Oak Lane, Villagetown, State' , '5555555555'),
(4, 4001, '10 Maple Drive, Boroughville, State', '9998887777'),
(5, 5001, '567 Pine Road, Hamletville, State', '1112223333'),
(6, 6001, '890 Cedar Court, Suburbia, State', '4444444444'),
(7, 7001, '234 Spruce Avenue, Townsquare, State', '7777777777'),
(8, 8001, '901 Willow Lane, Cityburg, State', '6666666666'),
(9, 9001, '345 Birch Street, Villageland, State', '2223334444'),
(10, 10001, '678 Magnolia Road, Suburbville, State', '8889990000');

CREATE TABLE Employee (Emp_Id INT PRIMARY KEY, Emp_Name VARCHAR(50), Position VARCHAR(30), Salary DECIMAL (10,2)) ;
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, POSITION, SALARY ) VALUES
(1001, 'John Doe', 'Librarian', 50000.00),
(2001, 'Jane Smith', 'Assistant Librarian', 30000.00),
(3001, 'Mike Johnson', 'Cataloger', 32000.00),
(4001, 'Sarah Williams', 'Reference Librarian', 42000.00),
(5001, 'David Brown', 'Acquisitions Librarian', 38000.00),
(6001, 'Emily Davis', 'Youth Services Librarian', 35000.00),
(7001, 'Alex Wilson', 'Circulation Supervisor', 36000.00),
(8001, 'Jessica Lee', 'Technology Coordinator', 55000.00),
(9001, 'Ryan Clark', 'Archivist', 51000.00),
(10001, 'Melissa Turner', 'Library Assistant', 29000.00);

CREATE TABLE Customer (Customer_Id INT PRIMARY KEY, Customer_Name VARCHAR(50), Customer_Address VARCHAR(100), Reg_date DATE ) ;
INSERT INTO CUSTOMER (CUSTOMER_ID, CUSTOMER_NAME, CUSTOMER_ADDRESS, REG_DATE ) VALUES
(1001, 'Isabella Adams', '123 Main Street, Cityville', '2020-01-01'),
(1002, 'Alexander Taylor', '456 Elm Avenue, Townsville', '2022-12-15'),
(1003, 'Charlotte Parker', '789 Oak Lane, Villagetown', '2023-02-28'),
(1004, 'James Clark', '10 Maple Drive, Boroughville', '2023-03-10'),
(1005, 'Harper Mitchell', '567 Pine Road, Hamletville', '2023-04-02'),
(1006, 'Daniel Turner', '890 Cedar Court, Suburbia', '2020-05-20'),
(1007, 'Amelia Collins', '234 Spruce Avenue, Townsquare', '2023-06-05'),
(1008, 'Samuel Carter', '901 Willow Lane, Cityburg', '2020-01-18'),
(1009, 'Abigail Reed', '345 Birch Street, Villageland', '2021-02-08'),
(1010, 'Matthew Murphy', '678 Magnolia Road, Suburbville', '2023-03-27');

CREATE TABLE Books(ISBN BIGINT PRIMARY KEY, Book_Title VARCHAR(50), 
Category VARCHAR(30), Rental_Price DECIMAL(5,2) , Status VARCHAR(20), Publisher VARCHAR(30)) ;
INSERT INTO BOOKS (ISBN, BOOK_TITLE, CATEGORY, RENTAL_PRICE, STATUS, PUBLISHER) VALUES
('9780316769488', 'The Catcher in the Rye', 'Fiction', 9.99, 'Yes', 'Little, Brown and Company'),
('9780061120084', 'To Kill a Mockingbird', 'Classics', 8.99, 'Yes', 'HarperCollins'),
('9780451524935', '1984', 'Fiction', 10.99, 'No', 'Penguin Books'),
('9780141439518', 'Pride and Prejudice', 'Drama', 7.99, 'No', 'Penguin Classics'),
('9780743273565', 'The Great Gatsby', 'Fiction', 9.99, 'Yes', 'Scribner'),
('9780156030471', 'To the Lighthouse', 'History', 8.99, 'No', 'Harvest Books'),
('9781503280786', 'Moby-Dick', 'Fiction', 10.99, 'Yes', 'CreateSpace Publishers'),
('9780618640157', 'The Lord of the Rings', 'Drama', 12.99, 'No', 'Houghton Mifflin Harcourt'),
('9780590353427', "Harry Potter and the Sorcerer's Stone", 'Fiction', 11.99, 'No', 'Scholastic'),
('9780060850524', 'Brave New World', 'Classics', 9.99, 'Yes', 'Harper Perennial') ;

CREATE TABLE IssueStatus (Issue_Id INT PRIMARY KEY, Issued_Customer INT, FOREIGN KEY (Issued_Customer) REFERENCES Customer(Customer_Id), 
Issued_Book_Name VARCHAR(50), Issue_Date DATE, ISBN_Book BIGINT, FOREIGN KEY (ISBN_Book) REFERENCES Books(ISBN) ) ;
INSERT INTO ISSUESTATUS (ISSUE_ID, ISSUED_CUSTOMER, ISSUED_BOOK_NAME, ISSUE_DATE, ISBN_BOOK) VALUES
(8001, 1004 , 'The Catcher in the Rye', '2023-05-11', '9780316769488'),
(8002, 1002 , 'To Kill a Mockingbird', '2023-05-10', '9780061120084'),
(8003, 1007 , '1984', '2023-06-09', '9780451524935'),
(8004, 1004 , 'Pride and Prejudice', '2023-03-08', '9780141439518'),
(8005, 1005 , 'The Great Gatsby', '2023-06-07', '9780743273565'),
(8006, 1006 , 'To the Lighthouse', '2023-01-06', '9780156030471'),
(8007, 1007 , 'Moby-Dick', '2023-06-05', '9781503280786'),
(8008, 1002 , 'The Lord of the Rings', '2023-06-04', '9780618640157'),
(8009, 1009 , "Harry Potter and the Sorcerer's Stone", '2023-04-03', '9780590353427'),
(8010, 1010 , 'Brave New World', '2023-02-02', '9780060850524') ;

CREATE TABLE Return_Status ( Return_Id INT PRIMARY KEY, Return_Customer INT, Return_Book_Name VARCHAR(50), Return_Date DATE, 
ISBN_Book BIGINT, FOREIGN KEY (ISBN_Book) REFERENCES Books(ISBN) ) ;
INSERT INTO RETURN_STATUS (RETURN_ID, RETURN_CUSTOMER, RETURN_BOOK_NAME, RETURN_DATE, ISBN_Book) VALUES
(2001, 1001 , 'The Catcher in the Rye', '2023-07-11', '9780316769488'),
(2002, 1002 , 'To Kill a Mockingbird', '2023-08-10', '9780061120084'),
(2003, 1003 , '1984', '2023-07-09', '9780451524935'),
(2004, 1004 , 'Pride and Prejudice', '2023-10-08', '9780141439518'),
(2005, 1005 , 'The Great Gatsby', '2023-09-07', '9780743273565'),
(2006, 1006 , 'To the Lighthouse', '2023-07-06', '9780156030471'),
(2007, 1007 , 'Moby-Dick', '2023-07-05', '9781503280786'),
(2008, 1008 , 'The Lord of the Rings', '2023-09-04', '9780618640157'),
(2009, 1009 , "Harry Potter and the Sorcerer's Stone", '2023-08-03', '9780590353427'),
(2010, 1010 , 'Brave New World', '2023-08-02', '9780060850524');


/* 1. Retrieve the book title, category, and rental price of all available books. */

SELECT BOOK_TITLE, CATEGORY, RENTAL_PRICE FROM BOOKS WHERE STATUS = 'Yes' ;

/* 2. List the employee names and their respective salaries in descending order of salary. */

SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY DESC ;

/* 3. Retrieve the book titles and the corresponding customers who have issued those books. */

SELECT ISSUESTATUS.ISSUED_BOOK_NAME , CUSTOMER.CUSTOMER_NAME FROM ISSUESTATUS INNER JOIN CUSTOMER 
ON  ISSUESTATUS.ISSUED_CUSTOMER = CUSTOMER.CUSTOMER_ID ;

/* 4. Display the total count of books in each category. */

SELECT CATEGORY, COUNT(CATEGORY) FROM BOOKS GROUP BY CATEGORY ;

/* 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. */

SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE SALARY > 50000.00 ;

/* 6.  List the customer names who registered before 2022-01-01 and have not issued any books yet. */

SELECT CUSTOMER_NAME FROM CUSTOMER WHERE REG_DATE < '2022-01-01'
AND CUSTOMER_ID NOT IN (SELECT ISSUED_CUSTOMER FROM ISSUESTATUS) ;

/* 7.  Display the branch numbers and the total count of employees in each branch. */

SELECT T1.BRANCH_NO, COUNT(BRANCH_NO) AS TOTAL_EMPLOYEES FROM BRANCH T1 JOIN EMPLOYEE T2 ON
T1.MANAGER_ID = T2.EMP_ID GROUP BY BRANCH_NO ;

/* 8.  Display the names of customers who have issued books in the month of June 2023.*/

SELECT CUSTOMER_NAME FROM CUSTOMER WHERE CUSTOMER_ID IN 
(SELECT ISSUED_CUSTOMER FROM ISSUESTATUS WHERE ISSUE_DATE LIKE '2023-06-%') ;

/* 9.  Retrieve book_title from book table containing history. */

SELECT BOOK_TITLE FROM BOOKS WHERE CATEGORY = 'History' ;

/* 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees. */

SELECT T1.BRANCH_NO, COUNT(BRANCH_NO) AS TOTAL_EMPLOYEES FROM BRANCH T1 JOIN EMPLOYEE T2 ON
T1.MANAGER_ID = T2.EMP_ID GROUP BY BRANCH_NO HAVING COUNT(BRANCH_NO) > 5 ;
