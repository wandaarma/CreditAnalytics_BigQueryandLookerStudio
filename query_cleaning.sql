-- Change to Date Format
CREATE OR REPLACE TABLE `test1mandiri.Tes1Mandiri.cards` AS
SELECT
  id,
  client_id,
  card_brand,
  card_type,
  card_number,
  PARSE_DATE('%m/%Y-%d', CONCAT(expires, '-01')) AS expires,
  cvv,
  has_chip,
  num_cards_issued,
  credit_limit,
  PARSE_DATE('%m/%Y-%d', CONCAT(acct_open_date, '-01')) AS acct_open_date,
  year_pin_last_changed,
  card_on_dark_web
FROM `test1mandiri.Tes1Mandiri.cards`;

-- Create Copy of Table Transactions Because of External Source and Change Merchant Code for Consistency
CREATE OR REPLACE TABLE `test1mandiri.Tes1Mandiri.transactions_new` AS
SELECT
  id,
  date,
  client_id,
  card_id,
  amount,
  use_chip,
  merchant_id,
  merchant_city,
  CASE merchant_state
    WHEN 'IN' THEN 'Indiana'
    WHEN 'FL' THEN 'Florida'
    WHEN 'CT' THEN 'Connecticut'
    WHEN 'CA' THEN 'California'
    WHEN 'WI' THEN 'Wisconsin'
    WHEN 'MI' THEN 'Michigan'
    WHEN 'OH' THEN 'Ohio'
    WHEN 'MN' THEN 'Minnesota'
    WHEN 'TX' THEN 'Texas'
    WHEN 'KY' THEN 'Kentucky'
    WHEN 'NC' THEN 'North Carolina'
    WHEN 'NV' THEN 'Nevada'
    WHEN 'AL' THEN 'Alabama'
    WHEN 'TN' THEN 'Tennessee'
    WHEN 'AR' THEN 'Arkansas'
    WHEN 'NJ' THEN 'New Jersey'
    WHEN 'MS' THEN 'Mississippi'
    WHEN 'NY' THEN 'New York'
    WHEN 'ID' THEN 'Idaho'
    WHEN 'OK' THEN 'Oklahoma'
    WHEN 'CO' THEN 'Colorado'
    WHEN 'GA' THEN 'Georgia'
    WHEN 'VA' THEN 'Virginia'
    WHEN 'LA' THEN 'Louisiana'
    WHEN 'WA' THEN 'Washington'
    WHEN 'PA' THEN 'Pennsylvania'
    WHEN 'IL' THEN 'Illinois'
    WHEN 'SD' THEN 'South Dakota'
    WHEN 'HI' THEN 'Hawaii'
    WHEN 'NM' THEN 'New Mexico'
    WHEN 'MO' THEN 'Missouri'
    WHEN 'OR' THEN 'Oregon'
    WHEN 'MD' THEN 'Maryland'
    WHEN 'VT' THEN 'Vermont'
    WHEN 'AZ' THEN 'Arizona'
    WHEN 'SC' THEN 'South Carolina'
    WHEN 'MT' THEN 'Montana'
    WHEN 'NE' THEN 'Nebraska'
    WHEN 'IA' THEN 'Iowa'
    WHEN 'ME' THEN 'Maine'
    WHEN 'MA' THEN 'Massachusetts'
    WHEN 'WV' THEN 'West Virginia'
    WHEN 'RI' THEN 'Rhode Island'
    WHEN 'DE' THEN 'Delaware'
    WHEN 'KS' THEN 'Kansas'
    WHEN 'ND' THEN 'North Dakota'
    WHEN 'UT' THEN 'Utah'
    WHEN 'NH' THEN 'New Hampshire'
    WHEN 'AK' THEN 'Alaska'
    WHEN 'DC' THEN 'District of Columbia'
    WHEN 'WY' THEN 'Wyoming'
    WHEN 'AA' THEN 'Armed Forces Americas'
    ELSE merchant_state
  END AS merchant_state,
  zip,
  mcc,
  errors
FROM `test1mandiri.Tes1Mandiri.transactions`;

-- Merge All Table and Feature Selection
CREATE OR REPLACE TABLE test1mandiri.Tes1Mandiri.all AS
SELECT
  t.id AS transaction_id,
  t.date,
  t.amount,
  t.use_chip,
  t.errors,
  c.id AS card_id,
  c.card_brand,
  c.card_type,
  c.expires,
  c.num_cards_issued,
  c.credit_limit,
  c.acct_open_date,
  c.card_on_dark_web,
  u.id AS user_id,
  u.gender,
  u.current_age,
  u.latitude,
  u.longitude,
  u.per_capita_income,
  u.yearly_income,
  u.total_debt,
  u.credit_score,
  u.num_credit_cards
FROM `test1mandiri.Tes1Mandiri.transactions_new` t
FULL OUTER JOIN test1mandiri.Tes1Mandiri.cards c
  ON t.card_id = c.id
FULL OUTER JOIN test1mandiri.Tes1Mandiri.users u
  ON t.client_id = u.id;
