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

###  [Vibration-Based Machine Fault Classification](./Vibration_Fault_Classification_CWRU.ipynb)
Built a predictive maintenance pipeline that detects and classifies industrial bearing faults (ball, inner race, outer race) from raw accelerometer signals. Segmented 40 vibration recordings into 2,331 windows, extracted 29 time- and frequency-domain features (RMS, kurtosis, crest factor, FFT band energies), and benchmarked five classifiers against a baseline under three evaluation designs. Every model scored ~1.00 macro F1 on a random split, but on an unseen fault severity, the most realistic test, scores fell to 0.57–0.78: Logistic Regression generalized best (0.78), while Random Forest and XGBoost overfit (~0.58). Healthy vs. faulty bearings were separated with 100% recall on the healthy class.
**Tools:** Python (NumPy, SciPy, pandas, scikit-learn, XGBoost, matplotlib), signal processing (FFT)

###  [Used Car Price Prediction: Model Benchmarking](https://github.com/mauricio15hdz/LM-Algorithms/blob/main/Case%201%3A%20Regression%20of%20Used%20Car%20Prices.ipynb)
Benchmarked six regression models to predict used car prices on 188,533 listings (Kaggle Playground Series S4E9). Cleaned hidden missing values, engineered horsepower, engine size, and cylinder features from free-text engine descriptions, and evaluated every model against a mean baseline on a 20% held-out validation set. XGBoost achieved the lowest error (RMSE $67,756, 9.1% better than the $74,573 baseline). Diagnosed LightGBM overfitting on high-cardinality columns (1,897 models, 1,117 engines) through early stopping and fixed it by re-encoding them, and showed that a log-transformed target hurt RMSE by under-predicting high-priced cars.
**Tools:** Python (pandas, scikit-learn, LightGBM, XGBoost, matplotlib)

### [PySpark Weather API Pipeline](./San%20Salvador%20Weather%20Spark.ipynb)
Built a Spark-based ETL pipeline pulling live weather data from the WeatherAPI (current, forecast, and historical endpoints) for San Salvador, El Salvador, transforming nested JSON responses into flat Spark DataFrames via pandas.json_normalize and spark.createDataFrame. Engineered a rainfall-vs-forecast trend visualization as an early-warning indicator for how weather conditions may correlate with sales performance. Tools: Python, PySpark, pandas, requests, matplotlib. Note: built and run in Google Colab. Live demo available on request.

## Skills 
`SQL` `Python` `Power BI` `Tableau` `DuckDB` `AWS S3` `ETL Pipelines` `Time Series Forecasting (SARIMA)` `Machine Learning (Random Forest)` `Data Engineering at Scale`

---
*Note: Projects use publicly available datasets (City of Toronto Open Data, SEC EDGAR, CWRU Bearing Data Center, Kaggle).*
