
# 📚 Online Bookstore Analysis

**SQL-based data analysis project to evaluate sales performance, customer purchase behavior, and inventory trends in an online bookstore.**

## 🚀 Business Problem
An online bookstore needs better visibility into its sales, customer activity, and stock movement.
The goal of this project is to use SQL to answer practical business questions around:

* top-performing genres and books
* repeat and high-value customers
* revenue generation
* inventory availability after fulfilling orders

## 🎯 Objective
This project was built to:
* analyze bookstore transactions using PostgreSQL
* combine book, customer, and order data through relational queries
* identify sales and customer trends
* evaluate stock levels after order fulfillment

## 📁 Dataset Overview

The project uses **3 CSV files** linked through common keys: 
* **Books.csv** — 500 records, 7 columns
  * `Book_ID`, `Title`, `Author`, `Genre`, `Published_Year`, `Price`, `Stock`
* **Customers.csv** — 500 records, 6 columns
  * `Customer_ID`, `Name`, `Email`, `Phone`, `City`, `Country`
* **Orders.csv** — 500 records, 6 columns
  * `Order_ID`, `Customer_ID`, `Book_ID`, `Order_Date`, `Quantity`, `Total_Amount`

## 🛠️ Tools & Technologies
* **PostgreSQL**
* **SQL**
* **CSV datasets**

## ⚙️ Methodology

### 1. Database Creation
Created three tables in PostgreSQL:
* `Books`
* `Customers`
* `Orders`

### 2. Relationship Setup
Used relational keys:
* `Book_ID`
* `Customer_ID`

The `Orders` table references both `Books` and `Customers`, enabling joins across transactions, products, and buyers.

### 3. SQL Analysis
The SQL script answers both **basic** and **advanced** business questions, including: 
* genre-based book filtering
* publication year analysis
* country-based customer filtering
* revenue calculation
* most expensive and lowest-stock books
* books sold by genre
* average fantasy book price
* repeat customers
* most frequently ordered book
* quantity sold by author
* top-spending customer
* remaining stock after sales

## 📈 Key Insights
Based on the actual dataset and SQL logic:

* **Total revenue** generated from all orders is **$75,628.66**
* The dataset contains **500 orders** and **2,697 total books sold**
* By quantity sold, **Mystery** is the top genre with **504 units sold**
* By revenue, **Romance** is the top genre, generating **$13,086.98**
* **139 customers** placed at least 2 orders
* The top-spending customer in the dataset spent **$1,398.90**
* Some books show **negative remaining stock** after fulfillment, which signals overselling or stock inconsistency in the source data
* The SQL file includes a stock-remaining calculation, which is a strong business-oriented inventory check

## 💡 Business Recommendations
* Prioritize **high-revenue genres** like Romance and Mystery in promotions
* Build retention campaigns for **repeat customers**
* Review books with **negative remaining stock** to prevent inventory issues
* Highlight frequently ordered books in merchandising and recommendation strategies
* Use customer-spend analysis to identify **high-value buyers** for targeted offers

## 💻 Sample SQL Topics Covered
* filtering with `WHERE`
* sorting with `ORDER BY`
* aggregation with `SUM`, `AVG`, `COUNT`
* deduplication with `DISTINCT`
* joins across multiple tables
* grouping with `GROUP BY`
* customer/order analysis using `HAVING`
* stock calculation with `LEFT JOIN` and `COALESCE`

## ▶️ How to Use This Project
**1. Clone the repository**

```bash
git clone https://github.com/your-username/online-bookstore-analysis.git
cd online-bookstore-analysis
```
**2. Import the CSV files**
* `Books.csv`
* `Customers.csv`
* `Orders.csv`

**3. Create the tables in PostgreSQL**
* Run the table creation statements from the SQL file

**4. Run the SQL queries**
* Open `Online bookstore project1.sql`
* Execute the queries step by step

**5. Analyze the results**

* Review outputs for sales, customer, and inventory insights

## 📌 Project Highlights

* Real relational SQL project using 3 linked datasets
* Covers both basic and advanced SQL analysis
* Includes customer, product, sales, and inventory perspectives
* Demonstrates practical use of joins, aggregations, and business queries

## 🔗 Conclusion
This project shows how SQL can be used to convert bookstore transaction data into actionable business insights. It helps evaluate sales patterns, identify valuable customers, and monitor inventory performance using a structured relational approach.

 turn this into a **fully GitHub-ready README with markdown formatting, emojis, and section spacing exactly ready to paste**.
