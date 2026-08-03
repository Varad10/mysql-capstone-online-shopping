# 🛒 MySQL Capstone Project: Online Shopping System

## 📌 Project Objective
This repository contains a fully functional relational database designed for an **Online Shopping System**. The project demonstrates a practical understanding of MySQL, encompassing database design, data manipulation, and the creation of real-world business intelligence reports. 

This was developed as the Capstone Project for SevenMentor Pvt. Ltd. SQL Training.

## 🗄️ Database Schema
The database (`OnlineShoppingDB`) consists of 6 normalized tables connected via Primary and Foreign Keys:
* **Customers:** Stores user profiles and contact information.
* **Categories:** Product classifications.
* **Products:** Inventory details linked to categories.
* **Orders:** Customer purchase records.
* **OrderDetails:** Line items for each order, linking products and orders.
* **Payments:** Transaction details and statuses.

## 🚀 Key SQL Concepts Demonstrated
* **DDL (Data Definition Language):** `CREATE`, `ALTER`, Constraints (Primary/Foreign Keys, `ON DELETE CASCADE / SET NULL`).
* **DML (Data Manipulation Language):** `INSERT`, `UPDATE`, `DELETE` with realistic dataset generation (20+ records per table).
* **Joins:** `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN` for multi-table data extraction.
* **Grouping & Aggregation:** `GROUP BY`, `HAVING`, `SUM()`, `AVG()`, `COUNT()`, `MAX()`, `MIN()`.
* **Advanced Queries:** Subqueries, nested logic, and `CREATE VIEW` for a unified KPI dashboard.

## 📊 Business Reports Included
The `OnlineShoppingDB.sql` script includes 10 complex queries solving real business questions, such as:
1. Top 5 customers by revenue
2. Highest revenue-generating product
3. Monthly sales trends
4. Category-wise sales exceeding specified thresholds
5. Comprehensive Store Summary Dashboard (View)

## 🛠️ How to Run
1. Open **MySQL Workbench** (or your preferred SQL editor).
2. Open the `OnlineShoppingDB.sql` file.
3. Execute the entire script to instantly create the database, build the tables, populate the mock data, and run the 10 business reports.

## 📁 Repository Contents
* `OnlineShoppingDB.sql`: The complete database script.
* `ER_Diagram.png`: Visual entity-relationship model.
* `Online_Shopping_System_Report.pdf`: Documented output of all business queries.
