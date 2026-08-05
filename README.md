# Mauricio Hernández — Data Analytics Portfolio

Postgraduate student in Business Insights and Analytics at Humber Polytechnic (Toronto), with 2+ years of professional experience as a Business Intelligence Analyst/Specialist. This repository showcases independent projects applying SQL, Python, and BI tools to real-world business and public-sector data.

Toronto, ON | [LinkedIn](https://www.linkedin.com/in/mauriciohdz15) | mauricioehr@icloud.com

---

## Projects

###  [TTC Transit Delay Analysis](./TTC%20Subway%20Delay%20Analysis.ipynb)
Analyzed TTC subway delay records to identify operational drivers of service delays. A Random Forest classifier reached 62.9% test accuracy predicting delay occurrence from line, time of day, and day of week, while Pareto analysis showed passenger/security incidents account for ~25% of total delay minutes. A SARIMA(1,0,1)(0,1,1,7) model forecast daily delay volume with a MAPE of 16.4% (RMSE 14.98) over a 56-day holdout.
**Tools:** Python (pandas, scikit-learn, statsmodels)

###  [SEC Financial Statement Data Pipeline](./SEC%20Financial%20Statement%20Data%20Pipeline.ipynb)
Engineered and benchmarked two ETL pipelines (pandas vs. DuckDB) to consolidate 21 quarters (2021–2026) of SEC EDGAR financial statement data into a unified 72M+ row dataset. Found pandas faster at moderate scale (~14.6M rows) but unable to complete at full scale due to memory exhaustion, while DuckDB processed the full 72M-row consolidation in ~189 seconds.
**Tools:** Python, pandas, DuckDB, SQL

###  [South America Cell Tower Coverage Dashboard](./Network%20Tower%20Dash%20-%20AWS%20Connection.twb)
Built a Tableau dashboard connected directly to an AWS S3 bucket, aggregating and visualizing cell tower/antenna distribution by operator across South America.
**Tools:** Tableau, AWS S3
*Note: opening the `.twb` file requires Tableau Desktop. A published [Tableau Public](https://public.tableau.com) version with an interactive, browser-viewable dashboard is coming soon — check back or reach out for a live walkthrough.*

---

## Skills 
`SQL` `Python` `Power BI` `Tableau` `DuckDB` `AWS S3` `ETL Pipelines` `Time Series Forecasting (SARIMA)` `Machine Learning (Random Forest)` `Data Engineering at Scale`

---
*Note: Projects use publicly available datasets (City of Toronto Open Data, SEC EDGAR).*
