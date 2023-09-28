-- Create a new database
CREATE DATABASE credit_card_db;

-- Use the newly created database
USE credit_card_db;

-- Create a table to store the data
CREATE TABLE credit_card (
  `index` INT,
  id INT,
  gender VARCHAR(1),
  car VARCHAR(1),
  property VARCHAR(1),
  children INT,
  income DECIMAL(10, 2),
  income_type VARCHAR(50),
  education VARCHAR(50),
  marital_status VARCHAR(50),
  housing_type VARCHAR(50),
  age DECIMAL(5, 1),
  employed_years DECIMAL(5, 1),
  work_phone INT,
  phone INT,
  email INT,
  family_members INT,
  reject INT
);


select * from credit_card;

-- 1. Group the customers based on their income type and find the average of their annual income.

SELECT income_type, AVG(income) AS avg_income
FROM credit_card
GROUP BY income_type;

-- 2.Find female owners of cars and property:
SELECT *
FROM credit_card
WHERE gender = 'F' AND car = 'Y' AND property = 'Y';

-- 3.Find male customers who are staying with their families:
SELECT gender,family_members
FROM credit_card
WHERE gender = 'M' AND family_members > 0;

-- 4.Please list the top five people having the highest income.
SELECT *
FROM credit_card
ORDER BY income DESC
LIMIT 5;

-- 5.How many married people are having bad credit?
SELECT COUNT(*) AS count_bad_credit
FROM credit_card
WHERE marital_status = 'Married' AND reject = 1;

-- 6.What is the highest education level and what is the total count?
SELECT education, COUNT(*) AS count
FROM credit_card
GROUP BY education
ORDER BY count DESC
LIMIT 1;

-- 7.Between married males and females, who is having more bad credit?
SELECT gender, marital_status,COUNT(*) AS count_bad_credit
FROM credit_card
WHERE marital_status = 'Married' AND reject = 1
GROUP BY gender;










