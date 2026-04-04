----CREATING TABLE BOOKS
DROP TABLE IF EXISTS BOOKS;

CREATE TABLE BOOKS
(
Book_ID	SERIAL PRIMARY KEY,
Title	VARCHAR(100),
Author	VARCHAR(100),
Genre	VARCHAR(100),
Published_Year	INT,
Price	NUMERIC(10,2),
Stock INT
);
 
SELECT * FROM BOOKS;


----CREATING TABLE CUSTOMERS
DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

---CREATING ORDERS TABLE
DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES CUSTOMERS(CUSTOMER_ID),
	BOOK_ID INT REFERENCES BOOKS(BOOK_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;


----1]Retreive all books in the "Fiction" genre:
SELECT * FROM BOOKS
WHERE GENRE='Fiction';

----2] Find books published after the year 1950:
SELECT * FROM BOOKS
WHERE PUBLISHED_YEAR >1950;

----3] List all customers from Canada
SELECT * FROM CUSTOMERS
WHERE COUNTRY='Canada';

----4] Show orders placed in November 2023:
SELECT * FROM ORDERS
WHERE ORDER_DATE BETWEEN '2023-09-01' AND '2023-09-30'

----5]Retreive the total stock of books available:
SELECT SUM(STOCK) AS TOTAL_STOCK FROM BOOKS

----6]Find the details of most expensive book
SELECT * FROM BOOKS
ORDER BY PRICE DESC LIMIT 1;

----7] Show all the customers who ordered more than 1 quantity of book:
select * from orders
where quantity>1;

----8] Retreive all orders where the total amount exceeds $20:
SELECT * FROM ORDERS WHERE TOTAL_AMOUNT >20;

----9) List all genres available in the Books table:
SELECT DISTINCT GENRE FROM BOOKS;

----10) Find the book with the lowest stock:
SELECT * FROM BOOKS
ORDER BY STOCK LIMIT 1;

----11) Calculate the total revenue generated from all orders:
SELECT SUM(TOTAL_AMOUNT) AS REVENUE FROM ORDERS;

---ADVANCED QUESTIONSS
-- 1) Retrieve the total number of books sold for each genre:
SELECT B.GENRE, SUM(O.QUANTITY) AS TOTAL_BOOKS_SOLD
FROM ORDERS O
JOIN BOOKS B ON
O.BOOK_ID=B.BOOK_ID
GROUP BY B.GENRE;

-- 2) Find the average price of books in the "Fantasy" genre:
SELECT AVG(PRICE) AS AVG_PRICE
FROM BOOKS
WHERE GENRE='Fantasy';

--3) List customers who have placed at least 2 orders:
SELECT  O.CUSTOMER_ID,C.NAME, COUNT(O.ORDER_ID) AS ORDER_COUNT
FROM ORDERS O 
JOIN CUSTOMERS C
ON O.CUSTOMER_ID= C.CUSTOMER_ID
GROUP BY O.CUSTOMER_ID,C.NAME
HAVING COUNT(ORDER_ID) >=2;


-- 4) Find the most frequently ordered book:
SELECT O.BOOK_ID, B.TITLE, COUNT(O.ORDER_ID) AS ORDER_COUNT
FROM ORDERS O 
JOIN BOOKS B
ON O.BOOK_ID=B.BOOK_ID
GROUP BY O.BOOK_ID,B.TITLE
ORDER BY ORDER_COUNT DESC LIMIT 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
SELECT * FROM BOOKS
WHERE GENRE='Fantasy'
ORDER BY PRICE DESC LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author:
SELECT  B.AUTHOR, SUM(O.QUANTITY) AS Total_quantity 
FROM ORDERS O
JOIN BOOKS B
ON O.BOOK_ID=B.BOOK_ID
GROUP BY B.AUTHOR;

-- 7) List the cities where customers who spent over $30 are located:
SELECT DISTINCT C.CITY ,TOTAL_AMOUNT
FROM ORDERS O
JOIN CUSTOMERS C
ON O.CUSTOMER_ID= C.CUSTOMER_ID
WHERE O.TOTAL_AMOUNT>30;

-- 8) Find the customer who spent the most on orders:
SELECT c.Customer_ID, c.Name, SUM(o.Total_Amount) AS Total_Spent
FROM Orders o
JOIN Customers c ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID, c.Name
ORDER BY Total_Spent DESC LIMIT 1;

--9) Calculate the stock remaining after fulfilling all orders:
SELECT b.Book_ID, b.Title, b.Stock - COALESCE(SUM(o.Quantity), 0) AS Remaining_Stock
FROM Books b
LEFT JOIN Orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID; 

SELECT b.Book_ID, b.Title, b.Stock, COALESCE(SUM(o.Quantity), 0) AS order_quantity, 
		b.Stock - COALESCE(SUM(o.Quantity), 0) AS Remaining_stock
FROM Books b
LEFT JOIN Orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID;
