# 🧠 R&D Engineering Performance Analytics Dashboard 🚀

An end-to-end data analytics platform designed to monitor productivity, workload, and project delivery across engineering teams. This project simulates a real-world R&D environment, covering the full data pipeline from relational database design to advanced Power BI storytelling.

---

## 📊 Data Modeling (The Power BI Snowflake)
To support scalable analytics, I implemented a **Star Schema** with fact tables (Tasks, Time Logs) and dimensions (Engineers, Projects, Milestones, Task Levels, Date).

![Power BI Snowflake Model](Sql/Screen%20Shots/Snowflake%20modeling%20in%20Power%20BI.jpeg)

---

## ⚙️ Project Architecture & Pipeline
1. **Database Design (PostgreSQL):** Normalized relational schema representing the R&D lifecycle: Projects → Milestones → Tasks → Time Logs.
2. **Synthetic Data Generation (Python):** Used `Faker` and `psycopg2` to generate realistic operational data for 50 engineers and 1,000+ tasks with complexity-based logic.
3. **Advanced SQL Analytics:** Built CTE-based transformations to evaluate capacity utilization, milestone progress, and burnout indicators.
4. **BI Layer (Power BI):** Developed interactive dashboards using advanced DAX for mission-critical KPIs.

---

## 🛠️ Tech Stack
* **SQL:** PostgreSQL (Advanced Joins, CTEs, Time-Series Aggregations)
* **Python:** Pandas, NumPy, Faker, psycopg2
* **BI Tool:** Power BI & DAX
* **Methodology:** Dimensional Modeling & Operational Analytics

---

## 🖼️ Interactive Power BI Dashboard Previews

### 1. Executive Overview & Project Health
*Focus: Overall project health, delivery metrics, and task status distribution.*
![Executive Overview](Dashboard/Executive%20Overview.png)

### 2. Engineer Productivity & Workload Analysis
*Focus: Workload distribution, capacity usage, and overload/burnout detection.*
![Engineer Productivity](Dashboard/Engineer_Productivity.png)

### 3. Estimation Accuracy (Planned vs. Actual)
*Focus: Comparing planned engineering effort against actual time logs to improve future scoping.*
![Estimation Accuracy](Dashboard/Estimation_Accuracy.png)

---

## 🔥 Key Features & Metrics
* **Completion & Delay Rates:** Tracking real-time milestone progress.
* **Engineer Efficiency Rate:** Measuring output against logged effort.
* **Burnout Risk Indicator:** Detecting when capacity utilization exceeds 100%.
* **Estimation Accuracy:** Variance analysis between planned vs. actual hours.

---

## 📂 Project Structure
- **`Dashboard/`**: Power BI `.pbix` file and high-res visual exports.
- **`Sql/`**: Database DDL, DML, and advanced analytical queries.
- **`Sql/Screen Shots/`**: Data model diagrams and query output evidence.
- **`Scripts/`**: Python notebooks for data simulation and cleansing.
- **`Data/`**: Generated CSV datasets for analytics consumption.

---

## 🚀 How to Run
1. **Generate Data:** Run the Python scripts in `Scripts/` to create the CSV files.
2. **Setup DB:** Execute the SQL scripts in `Sql/` to create the PostgreSQL schema.
3. **Load Data:** Import the CSV files into your PostgreSQL instance.
4. **Connect Power BI:** Open the `.pbix` file and update the data source settings to your local DB.

---

## 👤 Author
**Yehia Elharery**
*BI-Focused Engineer | Data Analytics & Engineering Specialist*
