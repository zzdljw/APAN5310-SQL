CREATE TABLE order_priority (
     Order_Priority_ID INTEGER,
     Order_Priority varchar(10) NOT NULL,
     PRIMARY KEY (Order_Priority_ID)
);

CREATE TABLE records (
     Row_ID INTEGER,
     Order_ID varchar(30) NOT NULL,
     Order_Date date,
     Customer_ID varchar(15) NOT NULL,
     Product_ID varchar(30) NOT NULL,
     Quantity INTEGER NOT NULL,
     Order_Priority_ID INTEGER,
     PRIMARY KEY (Row_ID)
);

CREATE TABLE products (
     Product_ID varchar(15),
     Product_Name varchar(200) NOT NULL,
     SubCategory_ID INTEGER,
     PRIMARY KEY (Product_ID)
);

CREATE TABLE categories (
     Category_ID INTEGER,
     Category varchar(30) NOT NULL,
     PRIMARY KEY (Category_ID)
);

CREATE TABLE subcategories (
     SubCategory_ID INTEGER,
     SubCategory varchar(30) NOT NULL,
     Category_ID INTEGER NOT NULL,
     PRIMARY KEY (SubCategory_ID),
     FOREIGN KEY (Category_ID) REFERENCES categories
);

CREATE TABLE financial_info (
     Order_ID varchar(30),
     Sales FLOAT,
     Profit FLOAT,
     PRIMARY KEY (Order_ID)

);

CREATE TABLE shipping_cost (
     Order_ID varchar(30),
     Shipping_Cost FLOAT,
     PRIMARY KEY (Order_ID),
     FOREIGN KEY (Order_ID) REFERENCES financial_info

);

CREATE TABLE discount (
     Order_ID varchar(30),
     Discount FLOAT,
     PRIMARY KEY (Order_ID),
     FOREIGN KEY (Order_ID) REFERENCES shipping_cost,
     FOREIGN KEY (Order_ID) REFERENCES financial_info
);

CREATE TABLE segments (
     Segment_ID INTEGER,
     Segment varchar(15) NOT NULL,
     PRIMARY KEY (Segment_ID)
);

CREATE TABLE customers(
     Customer_ID varchar(15),
     Customer_Name varchar(50) NOT NULL,
     Segment_ID integer,
     PRIMARY KEY (Customer_ID)
);

CREATE TABLE customer_location(
     Customer_ID varchar(15),
     City varchar(50) NOT NULL,
     State varchar(50) NOT NULL,
     PRIMARY KEY (Customer_ID)
);

CREATE TABLE markets (
     Market_ID INTEGER,
     Market varchar(10) NOT NULL,
     PRIMARY KEY (Market_ID)
);


CREATE TABLE countries (
     Country varchar(50),
     Market_ID integer,
     PRIMARY KEY (Country),
     FOREIGN KEY (Market_ID) REFERENCES markets
);

CREATE TABLE ship_modes (
     Ship_Mode_ID INTEGER,
     Ship_Mode varchar(15) NOT NULL,
     PRIMARY KEY (Ship_Mode_ID)
);

CREATE TABLE shipping_info (
     Order_ID varchar(30),
     Ship_Date DATE,
     Ship_Mode_ID INTEGER,
     PRIMARY KEY (Order_ID),
     FOREIGN KEY (Ship_Mode_ID) REFERENCES ship_modes
);

CREATE TABLE order_location (
     Order_ID varchar(30),
     City varchar(50) NOT NULL,
     State varchar(50) NOT NULL,
     Country varchar(50) NOT NULL,
     Postal_Code varchar(10),
     PRIMARY KEY (Order_ID),
     FOREIGN KEY (Order_ID) REFERENCES shipping_cost,
     FOREIGN KEY (Order_ID) REFERENCES discount,
     FOREIGN KEY (Order_ID) REFERENCES financial_info
);