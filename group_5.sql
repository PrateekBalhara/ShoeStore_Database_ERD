/*
2021F CSD 2206 1  

Term Project: The Shoe Store 

Professor: Rachida Amjoun 

Group 5 – Backbenchers: 
Ankit Saini - C0833396 
Arjun Simkhada - C0782784 
Hosne Ara Hoque - C0837278 
Prateek Balhara - C0830002 
Yasharaj Prajapati - C0847318 
*/





/* Create database db_PROJECT */
CREATE DATABASE DB_PROJECT

/* Create table Customer */
CREATE TABLE Customer(
customer_id INT PRIMARY KEY,
firstname VARCHAR(50) NOT NULL,
lastname VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
dob DATE NOT NULL,
mobile_number INT,
gender VARCHAR(7) 
);

/* Create table Address */
CREATE TABLE Address(
address_id INT PRIMARY KEY 
GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1),
customer_id INT FOREIGN KEY REFERENCES Customer(customer_id) NOT NULL,
firstname VARCHAR(50) DEFAULT 'address',
delivery_preference VARCHAR(50),
address_line1 VARCHAR(50) NOT NULL,
address_line2 VARCHAR(50),
city VARCHAR(20) NOT NULL,
state VARCHAR(20) NOT NULL,
country VARCHAR(20) NOT NULL,
zipcode INT NOT NULL
);

/* Create table Brand */
CREATE TABLE Brand(
brand_id INT PRIMARY KEY,
brand_name VARCHAR(50) NOT NULL,
logo VARCHAR(100),
brand_description TEXT,
size_chart VARCHAR(100)
);


/* Create table Warhouse */
CREATE TABLE Warehouse(
warehouse_id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
address VARCHAR(100) NOT NULL,
state VARCHAR(20) NOT NULL,
city VARCHAR(20) NOT NULL,
zipcode INT NOT NULL,
manager_name VARCHAR(20),
manager_mobile_number INT
);

/* Create table Inventory */
CREATE TABLE Inventory(
sku_id INT PRIMARY KEY
GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1),
brand_id INT FOREIGN KEY REFERENCES Brand(brand_id),
warehouse_id INT FOREIGN KEY REFERENCES Warehouse(warehouse_id),
name VARCHAR(50) NOT NULL,
size INT,
gender VARCHAR(7),
color VARCHAR(20),
type VARCHAR(20),
quantity INT,
price DECIMAL(7,2) NOT NULL,
status VARCHAR(7),
ankle_height VARCHAR(10)
);

/* Create table Logistic_Vendor*/
CREATE TABLE Logistic_Vendor(
Vendor_id INT PRIMARY KEY NOT NULL,
vendor_name VARCHAR(50) NOT NULL,
serviceable_cities VARCHAR(20),
status VARCHAR(10)
);

/* Create table Customer_Order*/
CREATE TABLE Customer_Order(
order_id INT PRIMARY KEY,
customer_id INT ,
address_id INT FOREIGN KEY REFERENCES Address(Address_id),
sku_id INT FOREIGN KEY REFERENCES Inventory(sku_id),
vendor_id INT FOREIGN KEY REFERENCES Logistic_Vendor(Vendor_id),
quantity INT NOT NULL,
order_status VARCHAR(10),
entry_time Time DEFAULT UNIX_TIMESTAMP(),
delivery_time TIME,
delivery_agent_name VARCHAR(50),
delivery_agent_mobile_number INT,
total_price DECIMAL(7,2),
coupon_code VARCHAR(50),
discount DECIMAL(7,2),
payable_price DECIMAL(7,2)
);

/* Create table order_history*/
CREATE TABLE Order_History(
order_history_id INT PRIMARY KEY,
order_id INT FOREIGN KEY REFERENCES Customer_Order(order_id),
agent_name VARCHAR(50),
agent_mobile_number INT,
old_status VARCHAR(10),
new_status VARCHAR(10),
remarks VARCHAR(50),
entry_time TIME DEFAULT UNIX_TIMESTAMP()
);

/* Create table Review */ 
CREATE TABLE Review(
review_id INT PRIMARY KEY,
customer_id INT FOREIGN KEY REFERENCES Customer(customer_id) NULL,
sku_id INT FOREIGN KEY REFERENCES Inventory(sku_id),
comment VARCHAR(50),
entry_time TIME DEFAULT UNIX_TIMESTAMP()
);

/* Create table Order_Invoice */
CREATE TABLE Order_Invoice(
invoice_id INT PRIMARY KEY,
Order_id INT FOREIGN KEY REFERENCES Customer_Order(Order_id),
invoice VARCHAR(20),
entry_time TIME DEFAULT UNIX_TIMESTAMP()
);


-- CONSTRAINTS

ALTER TABLE Customer_Order
  ADD CONSTRAINT customer_address_fk
    FOREIGN KEY ( Address )
    REFERENCES Address( address_id );
-- FK and NOT NULL constraint is on multiple other columns as well and has been enforced in insert statements itself

-- Unique Key constraint
ALTER TABLE customer
  ADD CONSTRAINT customer_email_uk
  UNIQUE ( email );

-- Check constraint
Add constraint order_status_ck  
CHECK order_status IN ('placed', 'ready_to_ship', 'shipped', 'out_for_delivery', 'delivered') 

Add constraint inventory_type_ck  
CHECK type IN ("sneakers", "boots", "flip flops", "crocs", "slippers", "sandals", "moccasins", "snow boots", 'accessories')





/*-----------------Insert data into tables-----------------*/
/*-----Insert data in customer table-----*/
INSERT INTO Customer(customer_id, firstname, lastname, email, dob, mobile_number, gender)
VALUES(NEXT VALUE FOR customer_id_seq,'A','A','a@gmail.com', '2021-01-01', 1234567890, 'Male');

INSERT INTO Customer(customer_id, firstname, lastname, email, dob, mobile_number, gender)
VALUES(NEXT VALUE FOR customer_id_seq,'B','B','b@gmail.com', '2021-02-02', 1234567890, 'female');

INSERT INTO Customer(customer_id, firstname, lastname, email, dob, mobile_number, gender)
VALUES(NEXT VALUE FOR customer_id_seq,'C','C','c@gmail.com', '2021-03-03', 1234567890, 'Male');

INSERT INTO Customer(customer_id, firstname, lastname, email, dob, mobile_number, gender)
VALUES(NEXT VALUE FOR customer_id_seq,'D','D','d@gmail.com', '2021-04-04', 1234567890, 'Female');

INSERT INTO Customer(customer_id, firstname, lastname, email, dob, mobile_number, gender)
VALUES(NEXT VALUE FOR customer_id_seq,'E','E','e@gmail.com', '2021-05-05', 1234567890, 'Male');

INSERT INTO Customer(customer_id, firstname, lastname, email, dob, mobile_number, gender)
VALUES(NEXT VALUE FOR customer_id_seq,'F','F','f@gmail.com', '2021-06-06', 1234567890, 'Female');

INSERT INTO Customer(customer_id, firstname, lastname, email, dob, mobile_number, gender)
VALUES(NEXT VALUE FOR customer_id_seq,'G','G','g@gmail.com', '2021-07-07', 1234567890, 'Female');

INSERT INTO Customer(customer_id, firstname, lastname, email, dob, mobile_number, gender)
VALUES(NEXT VALUE FOR customer_id_seq,'H','H','h@gmail.com', '2021-08-08', 1234567890, 'Male');


/*-----Insert data in Address table-----*/
INSERT INTO Address(address_id, customer_id, firstname, delivery_preference, address_line1, address_line2, city, state, country, zipcode)
VALUES(DEFAULT, 1,'A', 1, 'Street A', 'A Drive', 'Brampton', 'ON', 'Canada', 12345);

INSERT INTO Address(address_id, customer_id, firstname, delivery_preference, address_line1, address_line2, city, state, country, zipcode)
VALUES(DEFAULT, 2,'B', 2, 'Street B', 'B Drive', 'Brampton', 'ON', 'Canada', 12345);

INSERT INTO Address(address_id, customer_id, firstname, delivery_preference, address_line1, address_line2, city, state, country, zipcode)
VALUES(DEFAULT, 3,'C', 3, 'Street C', 'C Drive', 'Brampton', 'ON', 'Canada', 12345);

INSERT INTO Address(address_id, customer_id, firstname, delivery_preference, address_line1, address_line2, city, state, country, zipcode)
VALUES(DEFAULT, 4,'D', 4, 'Street D', 'D Drive', 'Brampton', 'ON', 'Canada', 12345);

INSERT INTO Address(address_id, customer_id, firstname, delivery_preference, address_line1, address_line2, city, state, country, zipcode)
VALUES(DEFAULT, 5,'E', 5, 'Street E', 'E Drive', 'Brampton', 'ON', 'Canada', 12345);


/*-----Insert data into Brand Table-----*/
INSERT INTO Brand(brand_id, brand_name, logo, brand_description, size_chart)
VALUES(1,'Nike', 'Nike Jents Shoes', 'Nike multibrand mens and ladies shoes', 'All size available');

INSERT INTO Brand(brand_id, brand_name, logo, brand_description, size_chart)
VALUES(2,'Adidas', 'Adidas Ladies Shoes', 'Adidas multibrand mens and ladies shoes', 'All size available');

INSERT INTO Brand(brand_id, brand_name, logo, brand_description, size_chart)
VALUES(3,'Reebok', 'Reebok Jents Shoes', 'Reebok multibrand mens and ladies shoes', 'All size available');

INSERT INTO Brand(brand_id, brand_name, logo, brand_description, size_chart)
VALUES(4,'Puma', 'Puma Jents Shoes', 'Puma multibrand mens and ladies shoes', 'All size available');

INSERT INTO Brand(brand_id, brand_name, logo, brand_description, size_chart)
VALUES(5,'New Balance', 'New Balance Jents Shoes', 'New Balance multibrand mens and ladies shoes', 'All size available');


/*-----Insert data in Inventory Table-----*/
INSERT INTO Inventory(sku_id, brand_id, warehouse_id, name, size, gender, color, type, quantity, price, status)
VALUES(DEFAULT, 1, 1, 'Nike Shoes', 10, 'Male', 'Black', 'Sport', 100, 500, 'Active');

INSERT INTO Inventory(sku_id, brand_id, warehouse_id, name, size, gender, color, type, quantity, price, status)
VALUES(DEFAULT, 2, 2, 'Adidas Shoes', 10, 'Female', 'White', 'Sport', 100, 500, 'active');

INSERT INTO Inventory(sku_id, brand_id, warehouse_id, name, size, gender, color, type, quantity, price, status)
VALUES(DEFAULT, 3, 3, 'Reepok Shoes',10, 'Female', 'Black and White', 'Sport', 100, 500, 'active');

INSERT INTO Inventory(sku_id, brand_id, warehouse_id, name, size, gender, color, type, quantity, price, status)
VALUES(DEFAULT, 4, 4, 'Puma Shoes',10, 'Female', 'Black', 'Sport', 100, 500, 'active');

INSERT INTO Inventory(sku_id, brand_id, warehouse_id, name, size, gender, color, type, quantity, price, status)
VALUES(DEFAULT, 5, 5, 'New Balance Shoes',10, 'Male', 'Grey', 'Sport', 100, 500, 'Active');

/*-----Insert data in Logistic vendor table-----*/

INSERT INTO Logistic_Vendor(Vendor_id, vendor_name, serviceable_cities, status)
VALUES(1, 'Peter', 'Brampton', 'Active');

INSERT INTO Logistic_Vendor(Vendor_id, vendor_name, serviceable_cities, status)
VALUES(2, 'Nick', 'Down Town', 'Inactive');

INSERT INTO Logistic_Vendor(Vendor_id, vendor_name, serviceable_cities, status)
VALUES(3, 'John', 'Toronto', 'Active');

INSERT INTO Logistic_Vendor(Vendor_id, vendor_name, serviceable_cities, status)
VALUES(4, 'Smith', 'Brampton', 'Active');

INSERT INTO Logistic_Vendor(Vendor_id, vendor_name, serviceable_cities, status)
VALUES(5, 'Rocky', 'Toronto', 'Active');

/*-----Insert data in Customer_order table------*/

INSERT INTO Customer_Order(order_id, customer_id, address_id, sku_id, vendor_id, quantity, order_status, entry_time,delivery_time, delivery_agent_name, delivery_agent_mobile_number, total_price, coupon_code, discount, payable_price)
VALUES(NEXT VALUE FOR order_id_seq, 1, 1, 1, 1, 10, 'Placed', '11:00', '02:30', 'Peter', 1234567890, 575, 'ABC', 10.00, 500);

INSERT INTO Customer_Order(order_id, customer_id, address_id, sku_id, vendor_id, quantity, order_status, entry_time, delivery_time, delivery_agent_name, delivery_agent_mobile_number, total_price, coupon_code, discount, payable_price)
VALUES(NEXT VALUE FOR order_id_seq, 2, 2, 2, 2, 15, 'Replaced', '1:00', '07:30', 'Nick', 1234567890, 575, 'PQR', 10.00, 500);

INSERT INTO Customer_Order(order_id, customer_id, address_id, sku_id, vendor_id, quantity, order_status, entry_time, delivery_time, delivery_agent_name, delivery_agent_mobile_number, total_price, coupon_code, discount, payable_price)
VALUES(NEXT VALUE FOR order_id_seq, 3, 3, 3, 3, 20, 'Placed', '08:00', '12:30', 'Smith', 1234567890, 700, 'XZY', 0.50, 600);

INSERT INTO Customer_Order(order_id, customer_id, address_id, sku_id, vendor_id, quantity, order_status, entry_time, delivery_time, delivery_agent_name, delivery_agent_mobile_number, total_price, coupon_code, discount, payable_price)
VALUES(NEXT VALUE FOR order_id_seq, 4, 4, 4, 4, 10, 'Placed', '12:00', '05:30', 'Nick', 1234567890, 400, 'AA', 0.10, 500);

INSERT INTO Customer_Order(order_id, customer_id, address_id, sku_id, vendor_id, quantity, order_status, entry_time, delivery_time, delivery_agent_name, delivery_agent_mobile_number, total_price, coupon_code, discount, payable_price)
VALUES(NEXT VALUE FOR order_id_seq, 5, 5,5,5, 10, 'Replaced',  '06:00', '03:25', 'John', 1234567890, 575, 'PP', 20.00, 800);

/*----- Insert data in Order_History table------*/
INSERT INTO Order_History(order_history_id, order_id, agent_name, agent_mobile_number,  old_status, new_status, remarks, entry_time)
VALUES(1,1, 'Peter', 1234567890, 'Pending', 'Active', 'Delivered to address', '01:11:01');

INSERT INTO Order_History(order_history_id, order_id, agent_name, agent_mobile_number,  old_status, new_status, remarks, entry_time)
VALUES(2,2, 'Nick', 1234567890, 'Pending', 'Active', 'Delivered to address', '12:00');

INSERT INTO Order_History(order_history_id, order_id, agent_name, agent_mobile_number,  old_status, new_status, remarks, entry_time)
VALUES(3,3, 'John', 1234567890, 'Pending', 'Active', 'Delivered to address', '03:00');


/*-----Insert data in Review table------*/
INSERT INTO Review(review_id, customer_id, sku_id, comment,  entry_time)
VALUES(1, 1, 1, 'Your all products is affordable with good quality', '03:00');

INSERT INTO Review(review_id, customer_id, sku_id, comment,  entry_time)
VALUES(2, 2, 2, 'Your all products is affordable with good quality', '12:00');

INSERT INTO Review(review_id, customer_id, sku_id, comment,  entry_time)
VALUES(3, 3, 3, 'Your all products is affordable with good quality', '09:00');

INSERT INTO Review(review_id, customer_id, sku_id, comment,  entry_time)
VALUES(4, 4, 4, 'Your all products is affordable with good quality', '01:00');


/*-----Warehouse data insert-----*/
INSERT INTO Warehouse(warehouse_id, name, address, state,  city, zipcode, manager_name, manager_mobile_number)
VALUES(1, 'Cold Storage','A Drive Street', 'ON', 'Brampton', 12345, 'Peter', 134567890);

INSERT INTO Warehouse(warehouse_id, name, address, state,  city, zipcode, manager_name, manager_mobile_number)
VALUES(2, 'Lavis Storage','Buick Street', 'ON', 'Toronto', 12345, 'Smith', 134567890);

INSERT INTO Warehouse(warehouse_id, name, address, state,  city, zipcode, manager_name, manager_mobile_number)
VALUES(3, 'Swiss Storage','Creditview', 'ON', 'Brampton', 12345, 'John', 134567890);

INSERT INTO Warehouse(warehouse_id, name, address, state,  city, zipcode, manager_name, manager_mobile_number)
VALUES(4, 'Cold Storage','Venue Drive', 'ON', 'London', 12345, 'Nick', 134567890);

INSERT INTO Warehouse(warehouse_id, name, address, state,  city, zipcode, manager_name, manager_mobile_number)
VALUES(5, 'Spare Storage','New Drive Street', 'ON', 'Brampton', 12345, 'Jams', 134567890);

/*-----Insert data it OrderInvoice table-----*/
INSERT INTO Order_Invoice(invoice_id, Order_id, invoice, entry_time)
VALUES(1, 1, '500 dollar','12:00');

INSERT INTO Order_Invoice(invoice_id, Order_id, invoice, entry_time)
VALUES(2, 2, '700 dollar','02:00');

INSERT INTO Order_Invoice(invoice_id, Order_id, invoice, entry_time)
VALUES(3, 3, '300 dollar','09:00');

INSERT INTO Order_Invoice(invoice_id, Order_id, invoice, entry_time)
VALUES(4, 4, '250 dollar','04:00');

INSERT INTO Order_Invoice(invoice_id, Order_id, invoice, entry_time)
VALUES(5, 5, '750 dollar','06:00');




-- SEQUENCE
CREATE OR REPLACE SEQUENCE order_id_seq START WITH 1 INCREMENT BY 1;
CREATE OR REPLACE SEQUENCE customer_id_seq START WITH 1 INCREMENT BY 1;
-- Data insertion is on line 245 and line 150 respectively

--  IDENTITY
-- Identity columns have been defined for Address Table (line 34) and Inventory Table (line 71)
-- Data insertion is on line 176 and line 210 respectively




-- CONSTRAINT TESTING
-- FK AND NOT NULL testing
INSERT INTO Customer_Order(order_id, customer_id, address_id, sku_id, vendor_id, quantity, order_status, entry_time,delivery_time, delivery_agent_name, delivery_agent_mobile_number, total_price, coupon_code, discount, payable_price)
VALUES(NEXT VALUE FOR order_id_seq, 1, NULL, 1, 1, 10, 'Placed', '11:00', '02:30', 'Peter', 1234567890, 575, 'ABC', 10.00, 500);
-- Fails because address_id can't be NULL. 
INSERT INTO Customer_Order(order_id, customer_id, address_id, sku_id, vendor_id, quantity, order_status, entry_time, delivery_time, delivery_agent_name, delivery_agent_mobile_number, total_price, coupon_code, discount, payable_price)
VALUES(NEXT VALUE FOR order_id_seq, 2, 109, 2, 2, 15, 'Replaced', '1:00', '07:30', 'Nick', 1234567890, 575, 'PQR', 10.00, 500);
-- Fails because address_id doesn't exist


-- Unique Key testing
INSERT INTO Customer(customer_id, firstname, lastname, email, dob, mobile_number, gender)
VALUES(NEXT VALUE FOR customer_id_seq,'A','A','a@gmail.com', '2021-01-01', 1234567890, 'Male');
INSERT INTO Customer(customer_id, firstname, lastname, email, dob, mobile_number, gender)
VALUES(NEXT VALUE FOR customer_id_seq,'A','A','a@gmail.com', '2021-01-01', 1234567890, 'Male');
-- Fails because matching email found


-- Check constraint testing
--  order_status_ck (line: 159)
INSERT INTO Customer_Order(order_id, customer_id, address_id, sku_id, vendor_id, quantity, order_status, entry_time,delivery_time, delivery_agent_name, delivery_agent_mobile_number, total_price, coupon_code, discount, payable_price)
VALUES(NEXT VALUE FOR order_id_seq, 1, 1, 1, 1, 10, 'booked', '11:00', '02:30', 'Peter', 1234567890, 575, 'ABC', 10.00, 500);
-- Fails  because "booked" is not a valid inventory type


-- inventory_type_ck (line: 162)
INSERT INTO Inventory(sku_id, brand_id, warehouse_id, name, size, gender, color, type, quantity, price, status)
VALUES(DEFAULT, 1, 1, 'Nike Shoes', 10, 'Male', 'Black', 'sport', 100, 500, 'Active');
-- Fails  because "sport" is not a valid inventory type

