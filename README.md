Rail System Reliability & Failure Analytics
End-to-end reliability analytics case study demonstrating SQL-based failure analysis and probability-driven risk scoring.

📌 Project Overview

This project analyzes predictive maintenance data to identify dominant failure drivers, quantify degradation risk, and develop probabilistic failure insights using SQL and Python.

The objective is to simulate a real-world industrial reliability analytics workflow.

📊 Dataset

AI4I 2020 Predictive Maintenance Dataset (Kaggle)

Contains:

Machine type (L, M, H)

Sensor readings

Tool wear

Failure indicators

🔎 Methodology

1️⃣ SQL-Based Reliability Analysis

Failure distribution analysis

Machine-type risk comparison

Tool wear threshold segmentation

Approximate MTBF estimation

2️⃣ Predictive Modeling

Logistic Regression

Class imbalance handling

Probability-based risk scoring

📈 Key Findings

Overall failure rate: 3.39%
Machine Type L exhibits highest failure probability
Failure probability increases to 6.06% when tool wear > 150
Torque acts as short-term stress trigger
Approximate MTBF: ~29 cycles

🧠 Reliability Insight

Failure risk increases significantly when high operational stress occurs in machines with accumulated degradation, indicating a compound degradation-stress mechanism.

⚙️ Tech Stack

PostgreSQL
SQL

Python

Pandas

Scikit-learn

Matplotlib / Seaborn

## Project Workflow

PostgreSQL → SQL Analysis → Python Modeling → Risk Scoring → Visualization

## Tool Wear vs Failure Risk
<img width="567" height="455" alt="wear_risk_outcome" src="https://github.com/user-attachments/assets/995a3972-b627-4f5f-a293-d57e6a0ea692" />


## Predicted Risk Distribution
<img width="571" height="455" alt="wear_risk" src="https://github.com/user-attachments/assets/e54010b8-c8e9-46b4-bbfc-328624c3776c" />


