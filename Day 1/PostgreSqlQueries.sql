CREATE TABLE customer (
   customer_id SERIAL PRIMARY KEY,
   first_name VARCHAR(100) NOT NULL,
   last_name VARCHAR(100) NOT NULL,
   email VARCHAR(255) UNIQUE NOT NULL,
   created_date TIMESTAMPTZ NOT NULL DEFAULT NOW(),
   updated_date TIMESTAMPTZ
);

SELECT * FROM customer;

DROP TABLE IF EXISTS customer;

ALTER TABLE customer ADD COLUMN active BOOLEAN;

ALTER TABLE customer DROP COLUMN active;

ALTER TABLE customer RENAME TO users;
ALTER TABLE users RENAME TO customer;

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES customer(customer_id),
    order_date TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    order_number VARCHAR(50) NOT NULL,
    order_amount DECIMAL(10,2) NOT NULL
);

SELECT * FROM orders;

INSERT INTO customer(first_name, last_name, email, created_date, updated_date, active)
VALUES ('Bansi', 'Sachade', '.bansi.sachade@tatvasoft.com', NOW(), NULL, true);

INSERT INTO customer (first_name, last_name, email, created_date, updated_date, active) VALUES
  ('John', 'Doe', 'johndoe@example.com', NOW(), NULL, true),
  ('Alice', 'Smith', 'alicesmith@example.com', NOW(), NULL, true),
  ('Bob', 'Johnson', 'bjohnson@example.com', NOW(), NULL, true),
  ('Emma', 'Brown', 'emmabrown@example.com', NOW(), NULL, true),
  ('Michael', 'Lee', 'michaellee@example.com', NOW(), NULL, false),
  ('Sarah', 'Wilson', 'sarahwilson@example.com', NOW(), NULL, true),
  ('David', 'Clark', 'davidclark@example.com', NOW(), NULL, true),
  ('Olivia', 'Martinez', 'oliviamartinez@example.com', NOW(), NULL, true),
  ('James', 'Garcia', 'jamesgarcia@example.com', NOW(), NULL, false),
  ('Sophia', 'Lopez', 'sophialopez@example.com', NOW(), NULL, false),
  ('Jennifer', 'Davis', 'jennifer.davis@example.com', NOW(), NULL, true),
  ('Jennie', 'Terry', 'jennie.terry@example.com', NOW(), NULL, true),
  ('JENNY', 'SMITH', 'jenny.smith@example.com', NOW(), NULL, false),
  ('Hiren', 'Patel', 'hirenpatel@example.com', NOW(), NULL, false);


 SELECT * FROM customer;

 INSERT INTO orders (customer_id, order_date, order_number, order_amount) VALUES
  (1, '2024-01-01', 'ORD001', 50.00),
  (2, '2024-01-01', 'ORD002', 35.75),
  (3, '2024-01-01', 'ORD003', 100.00),
  (4, '2024-01-01', 'ORD004', 30.25),
  (5, '2024-01-01', 'ORD005', 90.75),
  (6, '2024-01-01', 'ORD006', 25.50),
  (7, '2024-01-01', 'ORD007', 60.00),
  (8, '2024-01-01', 'ORD008', 42.00),
  (9, '2024-01-01', 'ORD009', 120.25),
  (10,'2024-01-01', 'ORD010', 85.00),
  (1, '2024-01-02', 'ORD011', 55.00),
  (1, '2024-01-03', 'ORD012', 80.25),
  (2, '2024-01-03', 'ORD013', 70.00),
  (3, '2024-01-04', 'ORD014', 45.00),
  (1, '2024-01-05', 'ORD015', 95.50),
  (2, '2024-01-05', 'ORD016', 27.50),
  (2, '2024-01-07', 'ORD017', 65.75),
  (2, '2024-01-10', 'ORD018', 75.50);

SELECT * FROM orders;

SELECT first_name FROM customer;

SELECT first_name, last_name, email FROM customer;

SELECT first_name, last_name FROM customer ORDER BY first_name ASC, last_name DESC;

SELECT first_name, last_name FROM customer WHERE first_name = 'Alice';

SELECT first_name, last_name FROM customer WHERE first_name = 'Alice' AND last_name = 'Williams';

SELECT customer_id, first_name, last_name FROM customer WHERE first_name IN ('John', 'David', 'James');

SELECT first_name, last_name FROM customer WHERE first_name LIKE '%EN%';

SELECT first_name, last_name FROM customer WHERE first_name ILIKE '%EN%';  
  
SELECT * FROM orders AS o INNER JOIN customer AS c ON o.customer_id = c.customer_id;

SELECT * FROM customer AS c LEFT JOIN orders AS o ON c.customer_id = o.customer_id;

SELECT c.customer_id, c.first_name, c.last_name, c.email,
       COUNT(o.order_id) AS NoOrders,
       SUM(o.order_amount) AS Total
FROM customer AS c
INNER JOIN orders AS o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;  
  
SELECT c.customer_id, c.first_name, c.last_name, c.email,
       COUNT(o.order_id) AS No_Orders,
       SUM(o.order_amount) AS Total
FROM customer AS c
INNER JOIN orders AS o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING COUNT(o.order_id) > 1;

SELECT * FROM orders WHERE customer_id IN (
  SELECT customer_id FROM customer WHERE active = true
);


SELECT customer_id, first_name, last_name, email
FROM customer
WHERE EXISTS (
  SELECT 1 FROM orders WHERE orders.customer_id = customer.customer_id
);

UPDATE customer
SET first_name = 'Rakesh', last_name = 'Choudhary', email = 'rakeshchoudhary@gmail.com'
WHERE customer_id = 1;

DELETE FROM customer WHERE customer_id = 11;