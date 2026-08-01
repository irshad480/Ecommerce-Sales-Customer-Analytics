<p align="center">
  <img src="Images/banner.png" alt="E-Commerce Sales & Customer Analytics Dashboard Banner" width="100%">
</p>

<h1 align="center">📊 E-Commerce Sales & Customer Analytics Dashboard</h1>

<p align="center">
An End-to-End Business Intelligence Project using PostgreSQL, SQL, Power Query, DAX & Power BI
</p>

<p align="center">

![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-025E8C?style=for-the-badge)
![Power Query](https://img.shields.io/badge/Power%20Query-217346?style=for-the-badge)
![DAX](https://img.shields.io/badge/DAX-F2C811?style=for-the-badge)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github)

</p>

---

# 📌 Project Overview

This project presents an **end-to-end Business Intelligence solution** for analyzing e-commerce sales performance, customer behavior, product performance, logistics, and payment trends.

The dashboard was developed using **PostgreSQL**, **SQL**, **Power Query**, **DAX**, and **Power BI**, transforming raw transactional data into meaningful business insights through interactive visualizations and KPIs.

The project demonstrates the complete analytics workflow—from database querying and data transformation to data modeling, KPI development, and dashboard design.

---

## 🎯 Project Objectives

- Analyze overall sales performance.
- Track customer purchasing behavior.
- Identify top-performing product categories.
- Evaluate logistics and delivery performance.
- Understand payment trends.
- Support data-driven business decisions.

---

# 📸 Dashboard Preview

## 📈 Executive Overview

<p align="center">
  <img src="Images/executive-overview.png" width="100%">
</p>

---

## 👥 Customer Analytics

<p align="center">
  <img src="Images/customer-analytics.png" width="100%">
</p>

---

## 📦 Product & Operations Analytics

<p align="center">
  <img src="Images/product-operations.png" width="100%">
</p>
---

# 🏗️ Business Intelligence Architecture

The project follows a complete Business Intelligence workflow—from raw transactional data to interactive dashboards and business insights.

<p align="center">
  <img src="Images/architecture.png" alt="Business Intelligence Architecture" width="100%">
</p>
---

# 📊 Data Model

The Power BI report is built on a PostgreSQL-backed data model. The primary **Sales Analytics** table stores transactional sales data, while SQL views are used to optimize reporting for specific analytical scenarios.

The model supports KPI calculations, customer analytics, product performance analysis, and operational reporting using DAX measures and Power BI relationships.

<p align="center">
  <img src="Images/data-model.png" alt="Power BI Data Model" width="90%">
</p>
---

# 🗄 SQL Views

SQL views were created in PostgreSQL to simplify reporting, improve query performance, and prepare data for Power BI dashboards.

| SQL View | Description |
|----------|-------------|
| `Sales Analytics` | Primary analytical dataset used in Power BI |
| `vw_monthly_sales` | Monthly revenue and order trend summary |
---

# 📈 DAX Measures

The following DAX measures power the KPIs and interactive dashboard calculations.

| Measure | Description |
|---------|-------------|
| Total Revenue | Calculates total sales revenue |
| Total Orders | Counts all customer orders |
| Total Customers | Counts unique customers |
| Average Order Value | Average revenue per order |
| Average Review Score | Average customer rating |
| Average Delivery Days | Average delivery duration |
---

# 💡 Business Insights

The dashboard provides actionable insights across sales performance, customer behavior, and operational efficiency.

## 📈 Executive Overview

- Generated **20.42M** in total revenue from approximately **99K** orders.
- Served around **95K** unique customers.
- Achieved an average customer review score of **4.03 / 5**, indicating high customer satisfaction.
- Average delivery time was **12.43 days**.
- **Bed Bath Table**, **Health Beauty**, and **Computers Accessories** were among the highest revenue-generating product categories.
- Credit Card was the most frequently used payment method.

---

## 👥 Customer Analytics

- São Paulo (SP) generated the highest customer revenue among all states.
- Customer reviews were heavily concentrated at **5-star ratings**, reflecting positive customer experiences.
- Delivery times varied across different states, highlighting opportunities for logistics optimization.
- Revenue distribution was concentrated in a few major states.

---

## 📦 Product & Operations Analytics

- Computers recorded the highest average product price.
- Freight costs varied significantly across product categories.
- Monthly orders showed seasonal fluctuations throughout the reporting period.
- Credit Card accounted for the majority of total payment value, followed by Boleto.
---

# 🛠️ Tech Stack

This project leverages modern Business Intelligence tools and technologies to transform raw e-commerce data into interactive dashboards and actionable insights.

| Category | Technology | Purpose |
|----------|------------|---------|
| 🗄️ Database | PostgreSQL | Store and manage e-commerce transactional data |
| 💻 Query Language | SQL | Data extraction, joins, aggregations, and SQL views |
| 🔄 ETL | Power Query | Data cleaning, transformation, and preparation |
| 📊 Data Modeling | Star Schema | Build an optimized analytical data model |
| 📈 Business Logic | DAX | Create KPIs, calculated measures, and business metrics |
| 📉 Visualization | Power BI | Develop interactive dashboards and reports |
| 🌐 Version Control | Git & GitHub | Source code management and project portfolio |
---

# ▶️ Installation & Usage

## Prerequisites

Before opening the project, ensure you have the following installed:

- Power BI Desktop
- PostgreSQL (if using the live database connection)
- Git (optional, for cloning the repository)

## Steps to Run

1. Clone or download this repository.
2. Open `Ecommerce_Sales_Analytics.pbix` using **Power BI Desktop**.
3. If prompted, update the PostgreSQL database connection.
4. Refresh the dataset.
5. Explore the interactive dashboards using the available slicers and filters.

## Repository Contents

- **Dashboard/** – Power BI dashboard file (`.pbix`)
- **SQL/** – SQL scripts, views, and queries
- **Images/** – Dashboard screenshots, banner, architecture, and data model
- **README.md** – Project documentation
---

# 🎯 Skills Demonstrated

This project demonstrates practical Business Intelligence and Data Analytics skills, including:

- SQL Querying & Database Design
- PostgreSQL Database Management
- Data Cleaning & Validation
- Exploratory Data Analysis (EDA)
- Customer Segmentation (RFM Analysis)
- SQL Views & Query Optimization
- Data Modeling in Power BI
- Power Query (ETL)
- DAX Measures & KPIs
- Interactive Dashboard Design
- Data Visualization & Storytelling
- Business Insight Generation
---

# 📁 Project Structure

```text
Ecommerce-Sales-Customer-Analytics/
│
├── Dashboard/
│   └── Ecommerce_Sales_Analytics.pbix
│
├── Images/
│   ├── banner.png
│   ├── architecture.png
│   ├── executive-overview.png
│   ├── customer-analytics.png
│   ├── product-operations.png
│   └── data-model.png
│
├── SQL/
│   ├── 01_Create_Database.sql
│   ├── 02_Create_Tables.sql
│   ├── 03_Import_Data.sql
│   ├── 04_Data_Validation.sql
│   ├── 05_Data_Cleaning.sql
│   ├── 06_Exploratory_Data_Analysis.sql
│   ├── 07_Business_Analysis.sql
│   ├── 08_RFM_Customer_Segmentation.sql
│   ├── 09_Views.sql
│   ├── 10_Indexes.sql
│   └── 11_Analytics_View.sql
│
├── README.md
└── LICENSE
```
---

# 🗄 SQL Workflow

The SQL scripts are organized into a complete analytics pipeline:

| Step | Description |
|------|-------------|
| 01 | Create Database |
| 02 | Create Tables |
| 03 | Import Raw Data |
| 04 | Validate Data |
| 05 | Clean Data |
| 06 | Exploratory Data Analysis |
| 07 | Business Analysis |
| 08 | RFM Customer Segmentation |
| 09 | Create SQL Views |
| 10 | Optimize Queries using Indexes |
| 11 | Build Final Analytics View |
---

# 🚀 Future Improvements

Potential enhancements for future versions include:

- Profit Analysis Dashboard
- Customer Lifetime Value (CLV)
- Sales Forecasting
- Inventory & Supply Chain Analytics
- Product Recommendation Analysis
- Real-Time Dashboard Refresh
- Advanced Customer Segmentation
---

# 👨‍💻 About the Author

**Muhammed Irshad**

Aspiring Data Analyst passionate about Business Intelligence, SQL, PostgreSQL, Power BI, and Data Visualization.

- GitHub: https://github.com/irshad480
- LinkedIn: www.linkedin.com/in/muhammed-irshad-b21523360
- Email: vvrirshadmk@email.com
---

# 📄 License

This project is licensed under the MIT License.
