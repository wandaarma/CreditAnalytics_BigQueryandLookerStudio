/* ==========================
   USER 360 OVERVIEW
   ========================== */
   
-- Number of Users Making Transactions Each Year
SELECT
  EXTRACT(YEAR FROM date) AS year,
  COUNT(DISTINCT user_id) AS total_users
FROM test1mandiri.Tes1Mandiri.all
WHERE user_id IS NOT NULL
GROUP BY year
ORDER BY year;

-- User's Transactions
SELECT
  user_id,
  COUNT(transaction_id),
  SUM(amount)
FROM test1mandiri.Tes1Mandiri.all
WHERE user_id IS NOT NULL
GROUP BY user_id;

-- Credit Quality
SELECT
  CASE
    WHEN credit_score < 600 THEN "Poor"
    WHEN credit_score >= 600 AND credit_score < 725 THEN "Fair"
    WHEN credit_score >= 725 THEN "Good"
  END AS credit_quality,
  COUNT(DISTINCT user_id) AS total_users
FROM test1mandiri.Tes1Mandiri.all
WHERE user_id IS NOT NULL
GROUP BY credit_quality
ORDER BY total_users DESC;

-- Total Users
SELECT
  COUNT(DISTINCT user_id) AS total_users
FROM test1mandiri.Tes1Mandiri.all;

-- Average Age
SELECT
  ROUND(AVG(current_age), 0) AS average_age
FROM test1mandiri.Tes1Mandiri.all
WHERE current_age IS NOT NULL;

-- Average Income
SELECT
  ROUND(AVG(yearly_income), 2) AS average_income
FROM test1mandiri.Tes1Mandiri.all
WHERE yearly_income IS NOT NULL;

-- Average Credit Score
SELECT
  ROUND(AVG(credit_score), 0) AS average_credit_score
FROM test1mandiri.Tes1Mandiri.all
WHERE credit_score IS NOT NULL;

-- Average Debt
SELECT
  ROUND(AVG(total_debt), 2) AS average_debt
FROM test1mandiri.Tes1Mandiri.all
WHERE total_debt IS NOT NULL;

/* ==========================
   TRANSACTION OVERVIEW
   ========================== */

-- Total Transactions Each Year
SELECT
  EXTRACT(YEAR FROM date) AS year,
  COUNT(DISTINCT transaction_id) AS total_transactions
FROM `test1mandiri.Tes1Mandiri.all`
WHERE transaction_id IS NOT NULL
GROUP BY year
ORDER BY year;

-- Merchant Transactions
SELECT
  merchant_id,
  COUNT(id) AS total_transactions,
  SUM(amount) AS amount_of_transaction
FROM `test1mandiri.Tes1Mandiri.transactions_new`
WHERE id IS NOT NULL
GROUP BY merchant_id
ORDER BY total_transactions DESC;

-- Type of Transactions
SELECT
  use_chip,
   COUNT(use_chip) AS Total
FROM `test1mandiri.Tes1Mandiri.all`
WHERE transaction_id IS NOT NULL
GROUP BY use_chip;

-- Total Transactions
SELECT
  COUNT(DISTINCT transaction_id) AS total_transactions
FROM `test1mandiri.Tes1Mandiri.all`
WHERE transaction_id IS NOT NULL;

-- Amount of Transactions
SELECT
  SUM(amount) AS total_amount
FROM `test1mandiri.Tes1Mandiri.all`
WHERE transaction_id IS NOT NULL
  AND amount IS NOT NULL;

-- Total Errors
SELECT
  COUNT(errors) AS total_errors
FROM `test1mandiri.Tes1Mandiri.all`
WHERE transaction_id IS NOT NULL;

/* ==========================
   CARD OVERVIEW
   ========================== */

-- Number of Cards Used for Transactions Each Year
SELECT
  EXTRACT(YEAR FROM date) AS year,
  COUNT(DISTINCT card_id) AS total_cards
FROM `test1mandiri.Tes1Mandiri.all`
WHERE card_id IS NOT NULL
GROUP BY year
ORDER BY year;

-- Card Age
SELECT 
    DATETIME_DIFF(CURRENT_DATE(), acct_open_date, YEAR) AS card_age,
    COUNT(DISTINCT card_id) AS total_cards
FROM `test1mandiri.Tes1Mandiri.all`
WHERE card_id IS NOT NULL
GROUP BY card_age
ORDER BY card_age;

-- Number of Cards Owned by User
SELECT 
    user_id,
    COUNT(DISTINCT card_id) AS num_cards_owned
FROM `test1mandiri.Tes1Mandiri.all`
WHERE card_id IS NOT NULL
GROUP BY user_id;

-- Total Users for Each Card Brand
SELECT 
    card_brand,
    COUNT(DISTINCT user_id) AS total_users
FROM `test1mandiri.Tes1Mandiri.all`
WHERE card_id IS NOT NULL
GROUP BY card_brand;

-- Total Cards
SELECT COUNT(DISTINCT card_id) AS total_cards
FROM `test1mandiri.Tes1Mandiri.all`
WHERE card_id IS NOT NULL;  

-- Max Credit Limit
SELECT MAX(credit_limit) AS max_credit_limit
FROM `test1mandiri.Tes1Mandiri.all`
WHERE card_id IS NOT NULL;

-- Total Cards on Dark Web
SELECT COUNT(DISTINCT card_id) AS card_on_dark_web
FROM `test1mandiri.Tes1Mandiri.all`
WHERE card_id IS NOT NULL AND card_on_dark_web = true;
