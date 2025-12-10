-- PostgreSQL compatible dump for ordermgmt

-- Drop tables in correct order to avoid FK errors
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS shippers;
DROP TABLE IF EXISTS customers;

-- =========================
-- TABLE: customers
-- =========================
CREATE TABLE customers (
    customerid SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    address VARCHAR(255) NOT NULL
);

INSERT INTO customers (customerid, name, address) VALUES
(1, 'Aaryan Risal', 'Nepal'),
(2, 'Abiral Lamsal', 'Mexico'),
(3, 'Safal Baniya', 'Mexico'),
(4, 'Ujjwal Basnet', 'UK'),
(5, 'Gaurab Neupane', 'Sweden');

-- =========================
-- TABLE: shippers
-- =========================
CREATE TABLE shippers (
    shipperid SERIAL PRIMARY KEY,
    shippername VARCHAR(100),
    phone VARCHAR(20)
);

INSERT INTO shippers (shipperid, shippername, phone) VALUES
(1, 'Speedy Express', '9999999999'),
(2, 'United Package', '9999999999'),
(3, 'Federal Shipping', '9999999999');

-- =========================
-- TABLE: orders
-- =========================
CREATE TABLE orders (
    orderid SERIAL PRIMARY KEY,
    customerid INTEGER,
    orderdate DATE,
    shipperid INTEGER,
    CONSTRAINT orders_customer_fk
        FOREIGN KEY (customerid)
        REFERENCES customers(customerid),
    CONSTRAINT orders_shipper_fk
        FOREIGN KEY (shipperid)
        REFERENCES shippers(shipperid)
);

INSERT INTO orders (orderid, customerid, orderdate, shipperid) VALUES
(101, 5, '2025-12-25', 2),
(102, 4, '2024-08-01', 2),
(103, 5, '2023-12-25', 1),
(104, 2, '2025-05-11', 3),
(105, 3, '2025-12-25', 2),
(106, 5, '2025-01-12', 1),
(107, 4, '2025-12-25', 3);

-- Fix sequence values to avoid conflicts on next inserts
SELECT setval('customers_customerid_seq', (SELECT MAX(customerid) FROM customers));
SELECT setval('shippers_shipperid_seq', (SELECT MAX(shipperid) FROM shippers));
SELECT setval('orders_orderid_seq', (SELECT MAX(orderid) FROM orders));
