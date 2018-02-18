DROP TABLE transactions;
DROP TABLE tags;
DROP TABLE users;

CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  category VARCHAR(100)
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  net_monthly_income MONEY,
  monthly_budget MONEY
);

CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  merchant_name VARCHAR(100),
  amount MONEY,
  transaction_date DATE,
  tag_id INT REFERENCES tags(id)
);
