# 📊 Project: Test Management Database (QA)

### ℹ️ Description
This project showcases a relational database structure (PostgreSQL) designed for tracking **Test Cases** and **Bug Reports**. It demonstrates expertise in schema design, data integrity enforcement, and crafting complex SQL queries to solve real-world QA challenges.

### 🛠 Tech Stack
* **RDBMS:** PostgreSQL
* **Tools:** pgAdmin 4, VS Code

### 📂 Repository Content
1. **01_database_schema.sql** — DDL script that defines the tables for `test_cases` and `bug_reports`, including primary and foreign keys.
2. **02_initial_data.sql** — DML script containing a set of 50 mock test records to populate the database.
3. **03_logic_fix.sql** — A specialized script to align bug reports with their corresponding test cases using advanced mapping logic (includes UA/EN comments).

### 🔍 Key Skills Demonstrated
* **Database Design:** Implementing One-to-Many (1:N) relationships and referential integrity.
* **Data Reporting:** Utilizing complex `JOIN` operations to generate comprehensive test-to-bug reports.
* **Data Manipulation:** Performing bulk updates using the `UPDATE FROM VALUES` syntax to handle large datasets efficiently.

## 🚀 How to Run
1. Execute `01_database_schema.sql` to build the structure.
2. Run `02_initial_data.sql` to load initial data.
3. Apply `03_logic_fix.sql` to ensure correct data mapping.
