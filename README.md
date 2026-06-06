# 🛒 Blinkit Retail Sales & Outlet Performance Dashboard
## 📌 Project Overview

An **end-to-end data analytics project** built on Blinkit's grocery retail dataset.  
Raw sales data was cleaned and transformed using **Python**, analyzed using **MySQL**,  
and visualized through a **3-page interactive Power BI dashboard**.

The project uncovers actionable business insights around product performance,  
outlet efficiency, and location-based sales trends across **10 outlets** and **16 item categories**.

---

## 🗂️ Project Structure

```
blinkit-sales-analysis/
│
├── dataset/
│   ├── BLINKIT.csv                  ← original raw data
│   └── blinkit_cleaned.csv          ← cleaned data (Python output)
│
├── python/
│   └── blinkit_cleaning.py          ← full cleaning + EDA script
│
├── sql/
│   └── analysis.sql                 ← all SQL business queries
│
├── dashboard/
│   └── Blinkit_Dashboard.pbix       ← Power BI dashboard file
│
├── screenshots/
│   ├── page1_kpi_overview.png
│   ├── page2_sales_analysis.png
│   └── page3_outlet_analysis.png
│
└── README.md
```

---

## 🛠️ Tools Used

| Tool | Purpose |
|---|---|
| **Python** (Pandas, Matplotlib) | Data cleaning, feature engineering, EDA charts |
| **MySQL Workbench** | Business queries, aggregations, KPI extraction |
| **Power BI Desktop** | Interactive 3-page dashboard, DAX measures, slicers |
| **Microsoft Excel** | Initial data inspection and column review |

---

## 📦 Dataset

| Property | Value |
|---|---|
| **Source** | Kaggle — Blinkit Grocery Sales Dataset |
| **Rows** | 8,523 |
| **Columns** | 12 (raw) → 15 (after feature engineering) |
| **Coverage** | 10 outlets · 16 item categories · 3 location tiers |

**Key columns:**

- `Item_Identifier` — unique product ID
- `Item_Type` — category (Fruits & Vegetables, Snack Foods, Dairy, etc.)
- `Item_MRP` — maximum retail price (₹)
- `Item_Fat_Content` — Low Fat / Regular
- `Item_Outlet_Sales` — actual sales value (₹) ← **main metric**
- `Outlet_Type` — Supermarket Type 1/2/3 or Grocery Store
- `Outlet_Location_Type` — Tier 1 / Tier 2 / Tier 3
- `Outlet_Size` — Small / Medium / High
- `Outlet_Establishment_Year` — year the outlet was opened

---

## 🧹 Python — What Was Cleaned

- ✅ Fixed inconsistent `Item_Fat_Content` labels — `LF`, `low fat` → `Low Fat` · `reg` → `Regular`
- ✅ Imputed **1,463 missing** `Item_Weight` values using column median
- ✅ Filled **2,410 missing** `Outlet_Size` values with `'Unknown'`
- ✅ Standardised all column names — lowercase, underscores, no special characters
- ✅ Removed duplicate rows
- ✅ Engineered 3 new columns:
  - `outlet_age` = 2025 − `Outlet_Establishment_Year`
  - `price_per_unit` = rounded `Item_MRP`
  - `sales_category` = Low / Medium / High sales bucket
- ✅ Exported `blinkit_cleaned.csv` (UTF-8 BOM — MySQL-safe)

---

## 🗄️ SQL — Business Queries

All queries are in `sql/analysis.sql`. Key analyses:

```sql
-- Total Revenue
SELECT SUM(item_outlet_sales) AS total_revenue FROM blinkit_cleaned;

-- Top 5 Item Categories by Sales
SELECT item_type, SUM(item_outlet_sales) AS total_sales
FROM blinkit_cleaned
GROUP BY item_type
ORDER BY total_sales DESC
LIMIT 5;

-- Sales by Outlet Type
SELECT outlet_type, SUM(item_outlet_sales) AS total_sales
FROM blinkit_cleaned
GROUP BY outlet_type
ORDER BY total_sales DESC;

-- Sales by Location Tier
SELECT outlet_location_type, SUM(item_outlet_sales) AS total_sales
FROM blinkit_cleaned
GROUP BY outlet_location_type
ORDER BY total_sales DESC;

-- Best Performing Outlets
SELECT outlet_identifier, outlet_type, outlet_location_type,
       SUM(item_outlet_sales) AS total_sales
FROM blinkit_cleaned
GROUP BY outlet_identifier, outlet_type, outlet_location_type
ORDER BY total_sales DESC;
```

---

## 📊 Power BI Dashboard

3-page interactive dashboard built from `blinkit_cleaned.csv`.

### Page 1 — Executive KPIs
- Total Sales · Total Items · Average MRP · Average Sales per Item
- Donut chart: Sales by Fat Content
- Bar chart: Sales by Item Category
- Slicers: Outlet Type · Location Tier

### Page 2 — Sales Analysis
- Line chart: Sales by Outlet Establishment Year
- Column chart: Sales by Item Type
- Scatter plot: Item Visibility vs Sales
- Pie chart: Sales Category distribution

### Page 3 — Outlet Analysis
- Bar chart: Sales by Outlet Type
- Donut chart: Sales by Location Tier
- Column chart: Sales by Outlet Size
- Line chart: Outlet Age vs Sales
- Table: All outlets ranked by revenue

**DAX Measures created:**
```
Total Sales       = SUM(blinkit_cleaned[item_outlet_sales])
Avg Sales         = AVERAGE(blinkit_cleaned[item_outlet_sales])
Total Items       = COUNT(blinkit_cleaned[item_identifier])
Avg MRP           = AVERAGE(blinkit_cleaned[item_mrp])
Avg Sales per Item = DIVIDE([Total Sales], [Total Items])
```

---

## 💡 Key Insights

| # | Insight |
|---|---|
| 1 | **Total revenue across all outlets: ₹1.85 Crore** |
| 2 | **Supermarket Type 1** drives 69.5% of total sales — dominant outlet format |
| 3 | **Tier 3 cities (₹76.4L) outperform Tier 1 (₹44.8L)** — strong small-city demand |
| 4 | **Fruits & Vegetables (₹28.2L)** and **Snack Foods (₹27.3L)** are the top categories |
| 5 | **Low Fat products** account for ~65% of total sales across all outlets |
| 6 | **Grocery Stores** generate the least sales (₹3.7L) — lowest footfall outlet type |
| 7 | **Medium-sized outlets** outperform both Small and Large in total revenue |

---

## 📸 Dashboard Screenshots

> *(Add your Power BI screenshots here after completing the dashboard)*

| Page | Preview |
|---|---|
| Executive KPIs | `screenshots/page1_kpi_overview.png` |
| Sales Analysis | `screenshots/page2_sales_analysis.png` |
| Outlet Analysis | `screenshots/page3_outlet_analysis.png` |

---

## ▶️ How to Run This Project

### Python
```bash
# 1. Clone the repo
git clone https://github.com/YOUR_USERNAME/blinkit-sales-analysis.git

# 2. Install dependencies
pip install pandas matplotlib

# 3. Place BLINKIT.csv in the same folder as the script
# 4. Run
python python/blinkit_cleaning.py
```

### MySQL
```sql
CREATE DATABASE blinkit_project;
USE blinkit_project;
-- Import blinkit_cleaned.csv via Table Data Import Wizard
-- Then run queries from sql/analysis.sql
```

### Power BI
```
1. Open Power BI Desktop
2. Get Data → Text/CSV → select blinkit_cleaned.csv
3. Open dashboard/Blinkit_Dashboard.pbix
```

---

## 🙋 Author

**Sathwik**  
Aspiring Data Analyst | Python · SQL · Power BI  
📧 sathwiknemuri@gmail.com
🔗 https://www.linkedin.com/in/sathwik-nemuri-930570364/ 
💻 https://github.com/sathwiknemuri

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
