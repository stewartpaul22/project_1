DROP TABLE transactions;
DROP TABLE tags;
DROP TABLE users;

CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  category VARCHAR(100) NOT NULL
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  net_monthly_income NUMERIC (10, 2) NOT NULL,
  monthly_budget NUMERIC (10, 2) NOT NULL
);

CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  merchant_name VARCHAR(100),
  amount NUMERIC (10, 2) NOT NULL,
  transaction_date DATE,
  tag_id INT REFERENCES tags(id),
  user_id INT REFERENCES users(id)
);
