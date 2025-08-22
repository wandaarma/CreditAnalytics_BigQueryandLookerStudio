# 📊 User and Credit Transaction Analytics with BigQuery & Looker Studio

## 🔎 Project Overview
This project aims to perform **cleaning, transformation, and analysis data** from a credit card dataset (transactions, users, and cards).  
The final output is an **interactive dashboard in Looker Studio** that provides insights into user profiles, transaction behavior, and card usage.  

**Pipeline:**
1. Data cleaning & preprocessing → SQL in **BigQuery**
2. Feature engineering & merging tables → combined table `all`
3. Analysis → SQL queries for insights (User, Transaction, and Card Overview)
4. Visualization → **Looker Studio dashboard**

---

## 📂 Dataset
- Source: Public Dataset with CSV Format (`transactions`, `cards`, and `users`)  
- You can download at this link below  

👉 [Download Dataset](https://drive.google.com/drive/folders/13hJzKFvmEhtUpe8od9_zfzh6B6lQC6rY?usp=sharing)

---

## 🛠️ Tools & Platforms
- **Google BigQuery** → Data cleaning, transformation, and analytical queries  
- **Google Drive** → Storage for raw dataset  
- **Looker Studio** → Dashboard visualization  

---

## 📑 SQL Files
- **`query_cleaning.sql`**
  - Date formatting
  - Standardizing merchant state
  - Merging `transactions`, `cards`, and `users` into `all` table
- **`query_view.sql`**
  - User 360 Overview
  - Transaction Overview
  - Card Overview

---

## 🚀 How to Run the Project  
1. **Import Dataset**
   - Open Google BigQuery  
   - Create a project named 'test1mandiri' and a new dataset named Tes1Mandiri 
   - Import all CSV files from computer/drive (max 100MB for computer upload)  

2. **Cleaning Data**
   - Run queries from `query_cleaning.sql`  
   - A combined table `test1mandiri.Tes1Mandiri.all` will be created  

3. **Run Analysis Queries**
   - Open `query_view.sql`  
   - Copy-paste queries into BigQuery and run  
   - Queries are grouped by User Overview, Transaction Overview, and Card Overview  

4. **Visualization in Looker Studio**
   - Connect BigQuery to Looker Studio  
   - Use the `all` table as the source   

---

## 📊 Dashboard Features
### 👤 User Overview
- Number of users per year  
- Distribution of age, income, credit score  
- Credit quality segmentation  

### 💳 Card Overview
- Number of active cards per year  
- Card age distribution  
- Card brand distribution  
- Cards found on dark web  

### 💰 Transaction Overview
- Number of transactions per year  
- Transaction trends per merchant  
- Error rate & chip usage  

👉 [See My Dashboard](https://lookerstudio.google.com/reporting/55410e2e-e8a2-41f7-8253-8af6fe31ad6b)  

---

## ✅ Project Highlights
- **End-to-End Flow**: From raw dataset → data cleaning → SQL analysis → visualization  
- **Reproducible**: Queries are provided and ready to run  
- **Scalable**: Can handle larger datasets (via Google Cloud Storage if >100 MB)  
- **Actionable Insights**: Helps monitor user, card, and transaction trends effectively  
