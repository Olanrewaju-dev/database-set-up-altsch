-- 2(a) creation of all the entities

-- creating database
CREATE DATABASE inventory_management_db;

-- using created database
USE DATABASE inventory_management_db;

-- creating product category table
CREATE TABLE category (
    id BIGINT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);


-- creating product brand table
CREATE TABLE brand (
    id BIGINT NOT NULL,
    name ENUM('unilever', 'johnson & johnson', 'l-oreal', 'oriflame', 'nivea') NOT NULL,
    description VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);


-- creating product table
CREATE TABLE product (
    id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    size ENUM("small", "meduim", "large") NOT NULL,
    description VARCHAR(255) NOT NULL,
    created_at DATE NOT NULL,
    updated_at DATE NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT FK_category_id FOREIGN KEY (id) REFERENCES category(id),
    CONSTRAINT FK_brand_id FOREIGN KEY (id) REFERENCES brand(id)
);

-- creating users table
CREATE TABLE user (
    id BIGINT NOT NULL,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at DATE NOT NULL,
    last_login DATE NOT NULL,
    user_type ENUM("admin", "customer") NOT NULL,
    mobile_number VARCHAR(255),
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

-- creating order table
CREATE TABLE orders (
    id BIGINT PRIMARY KEY NOT NULL,
    order_status ENUM('approved', 'disapproved', 'awaiting_approval') NOT NULL,
    created_at DATETIME NOT NULL,
    CONSTRAINT FK_product_id FOREIGN KEY (id) REFERENCES category(id),
    CONSTRAINT FK_user_id FOREIGN KEY (id) REFERENCES user(id)
);


-- 2(b) Show commands for inserting records into the entities

-- inserting into category table
INSERT INTO category(id, title, description) 
VALUES 
    (1, 'toiletries', 'products used in washing such as shampoo, toothpaste, soap, etc'),
    (2, 'skin care', 'products used to care for human skin such as cream, face wash, sun screen cream etc'),
    (3, 'breverages', 'edible products in liquid form which either be alcoholic or not');
    

-- inserting into brand table
INSERT INTO brand(id, name, description) 
VALUES 
    (1, 'unilever', "Unilever Plc (Unilever) is a manufacturer and supplier of fast-moving consumer goods. The company's product portfolio comprises food products, beauty, and personal care products, beverages, home care products, vitamins, minerals, and supplements"),
    (2, 'oriflame', 'founded in 1966, oriflame is a social selling beauty company in over 60 markets, with a diverse portfolio of Swedish, nature-inspired, innovative beauty and wellness products'),
    (3, 'nivea', 'a German personal care brand that specializes in skin and body care. It is owned by the Hamburg-based company Beiersdorf Global AG. This was the origin of Eucerin brand. Nivea comes from the Latin adjective niveus, nivea, niveum, meaning "snow-white"');
    

-- inserting into product table
INSERT INTO product(id, name, price, size, description, created_at, FK_category_id, FK_brand_id) 
VALUES 
    (1, 'omo', 2.99, 'small', 'a detergent to wash household items such as plates, clothes etc', Date.now, 1, 1),
    (2, 'roll-on', 7.89, 'medium', 'a underarm deodorant that last for 24hrs', Date.now, 2, 3),
    (3, 'cornetto', 1.59, 'medium', 'cone ice-cream with different flavours', Date.now, 3, 1);


-- inserting into user table
INSERT INTO user(id, firstname, lastname, email, password, created_at, user_type, mobile_number, address) 
VALUES 
    (1, 'olanrewaju', 'balogun', 'obo@dmv.com', 'asdkfasldkf', Date.now, 'admin', '90323233456', 'Lagos, Nigeria'),
    (2, 'daniel', 'adesoji', 'asdfkk@gmail.com', 'z!@cmvzx#c', Date.now, 'customer', '9032369903', 'Abuja, Nigeria');
   

 -- inserting into orders table   
INSERT INTO orders(id, order_status, created_at, FK_product_id, FK_user_id)
VALUES
    (1, 'awaiting_approval', 2023-09-09 09:25:07, 3, 2),
    (2, 'approved', 2023-09-10 12:25:06, 2, 1);


--2(c) Show commands for getting records from two or more entities
-- getting all entries on the order table
SELECT * FROM orders;


-- getting all entries on the brand table
SELECT * FROM product WHERE price > 1.60;


--2(d) Show commands for updating records from two or more entities
-- updating records on orders table
UPDATE orders
SET order_status = 'approved', 
WHERE id = 1;

-- updating records on users table
UPDATE user
SET email = 'olanrewaju20@gmail.com', 
WHERE id = 1;


--2(e) Show commands for deleting records from two or more entities
-- deleting records from users table

DELETE FROM user 
WHERE id = 2;