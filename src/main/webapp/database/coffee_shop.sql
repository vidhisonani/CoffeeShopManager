CREATE DATABASE IF NOT EXISTS coffee_shop;

USE coffee_shop;

CREATE TABLE
  admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
  );

CREATE TABLE
  menu_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(6, 2) NOT NULL,
    description VARCHAR(255),
    is_available TINYINT (1) DEFAULT 1
  );

CREATE TABLE
  customer_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    table_number INT NOT NULL,
    total_amount DECIMAL(8, 2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Pending',
    ordered_at DATETIME DEFAULT NOW ()
  );

CREATE TABLE
  order_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    item_id INT,
    quantity INT NOT NULL,
    subtotal DECIMAL(8, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES customer_order (order_id),
    FOREIGN KEY (item_id) REFERENCES menu_item (item_id)
  );

-- Default admin account
INSERT INTO
  admin (username, password)
VALUES
  ('admin', 'admin123');

-- Sample menu items
INSERT INTO
  menu_item (item_name, category, price, description)
VALUES
  ('Espresso', 'Coffee', 60.00, 'Strong single shot'),
  (
    'Cappuccino',
    'Coffee',
    90.00,
    'Espresso with steamed milk foam'
  ),
  (
    'Cold Coffee',
    'Coffee',
    110.00,
    'Chilled blended coffee'
  ),
  ('Masala Chai', 'Tea', 40.00, 'Spiced Indian tea'),
  ('Green Tea', 'Tea', 50.00, 'Light and refreshing'),
  (
    'Chocolate Brownie',
    'Snacks',
    80.00,
    'Warm fudgy brownie'
  ),
  (
    'Veg Sandwich',
    'Snacks',
    70.00,
    'Grilled with cheese'
  ),
  (
    'Cold Lemonade',
    'Cold',
    60.00,
    'Fresh lime with mint'
  );