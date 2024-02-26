create schema lms2;
use lms2;
create table library_member (member_id Integer primary key,first_name varchar(25),last_name varchar(25),email_address varchar(35),
phone_number bigint, memebership_level varchar(10),address_id Integer);
create table checkout(id Integer primary key,isbn bigint,member_id Integer,
checkout_date datetime,due_date datetime,is_returned boolean);
create table book(book_id Integer primary key,title varchar(45),
author_name varchar(50),year_published Integer,quantity Integer);
create table address(address_id Integer primary key, line1 varchar(30),line2 varchar(30),
city varchar(20),state char(2),zip Integer);
create table book_isbn(isbn bigint primary key,book_id Integer);
alter table library_member add foreign key (address_id) REFERENCES address (address_id);
alter table checkout add foreign key (member_id) REFERENCES library_member (member_id);
alter table checkout add foreign key (isbn) REFERENCES book_isbn (isbn);
alter table book_isbn add foreign key (book_id) REFERENCES book (book_id);

INSERT INTO book (book_id, title, author_name, year_published, quantity) VALUES
('123', 'Alice in Wonderland', 'Lewis Carroll', '1865', '100'),
('124', 'Harry Potter and the Philosopher\'s Stone', 'J.K. Rowling', '1997', '200'),
('125', 'The Hobbit', 'J.R.R. Tolkien', '1937', '250'),
('234', 'To Kill a Mockingbird', 'Harper Lee', '1960', '200'),
('240', 'The Catcher in the Rye', 'J.D. Salinger', '1951', '100'),
('260', 'Pride and Prejudice', 'Jane Austen', '1813', '50'),
('345', 'The Great Gatsby', 'F. Scott Fitzgerald', '1925', '150'),
('456', '1984', 'George Orwell', '1949', '300'),
('567', 'The Chronicles of Narnia', 'C.S. Lewis', '1950', '180');

INSERT INTO book_isbn VALUES ('0061120081', '123'),
('0141182556',123),
('0307277674', '124'),
('1400033411', '124'),
('0345803485', '260'),
('0679755330', '234'),
('0679720200', '260'),
('0060567180 ', '125'),
('0307475003', '234'),
('0061122416', '125'),
('0375706771', '123'),
('0345378482', '260'),
('0441172717', '123'),
('0140441702', '124'),
('0143105222', '125'),
('0140443330', '125'),
('0451524934', '125'),
('0679734775', '260'),
('0679732764', '123'),
('038549081', '124');

INSERT INTO address VALUES 
('100', '555 Cedar Avenue', 'Apartment 10B', 'Meadowville', 'WA', '54321'),
('101', '777 Pine Street', 'Suite 505', 'Greenville', 'SC', '12345'),
('102', '888 Elm Avenue', 'Unit 202', 'Riverside', 'OR', '98765'),
('103', '999 Oak Road', 'Building A', 'Hillcrest', 'NV', '67890'),
('104', '111 Birch Lane', 'Floor 3', 'Sunnydale', 'AZ', '24680'),
('105', '222 Maple Street', 'Room 101', 'Oakland', 'MI', '13579');

INSERT INTO library_member VALUES 
('11', 'Olivia', 'Smith', 'olivia.smith@example.com', '5551234576', 'student', '100'),
('12', 'Ethan', 'Johnson', 'ethan.johnson@example.com', '5551234577', 'student', '101'),
('13', 'Madison', 'Williams', 'madison.williams@example.com', '5551234578', 'vendor', '102'),
('14', 'Noah', 'Jones', 'noah.jones@example.com', '5551234579', 'vendor', '103'),
('15', 'Emma', 'Brown', 'emma.brown@example.com', '5551234580', 'associate', '104'),
('16', 'Aiden', 'Davis', 'aiden.davis@example.com', '5551234581', 'associate', '105'),
('17', 'Sophia', 'Miller', 'sophia.miller@example.com', '5551234582', 'student', '100'),
('18', 'Logan', 'Wilson', 'logan.wilson@example.com', '5551234583', 'student', '101'),
('19', 'Isabella', 'Taylor', 'isabella.taylor@example.com', '5551234584', 'vendor', '102'),
('20', 'Mason', 'Anderson', 'mason.anderson@example.com', '5551234585', 'vendor', '103');

-- Friday work
-- create member
-- Friday work
-- create member
INSERT INTO library_member VALUES 
('21', 'Jhanvitha', 'Ba', 'jhanvitha.ba@example.com', '5551234576', 'student', '103');
-- Find Member by Name and Mobile Number
SELECT * FROM library_member WHERE first_name = 'Jhanvitha' AND phone_number = '5551234576';
-- Display All Members
SELECT * FROM library_member;
-- List All Books a Member Has Checked Out
SELECT b.title, b.author_name
FROM book b
JOIN checkout c ON b.book_id = c.isbn
JOIN library_member m ON c.member_id = m.member_id
WHERE m.first_name = 'Jhanvitha' AND m.last_name = 'Ba';

INSERT INTO checkout (isbn, member_id, checkout_date, due_date, is_returned) 
VALUES ('0061120081', '11', CURRENT_TIMESTAMP, DATE_ADD(CURRENT_DATE, INTERVAL 14 DAY), FALSE);

-- Checkout a Book for a Given Member and Given Book
INSERT INTO checkout VALUES 
('1','0061120081', '21', CURRENT_TIMESTAMP, DATE_ADD(CURRENT_DATE, INTERVAL 14 DAY), FALSE);

-- List Available Books and Quantity That Can Be Checked Out
SELECT b.title, b.author_name, b.quantity - COUNT(c.id) AS available_quantity
FROM book b
LEFT JOIN checkout c ON b.book_id = c.isbn
GROUP BY b.book_id
HAVING available_quantity > 0;

-- List All the Checkouts That Are Due in Two Days
SELECT * 
FROM checkout
WHERE due_date = DATE_ADD(CURRENT_DATE, INTERVAL 2 DAY);

-- List All the Checkouts That Are Overdue
SELECT * 
FROM checkout
WHERE due_date < CURRENT_DATE AND is_returned = FALSE;
-- List All the Books That Are Checked Out Today
SELECT b.title, b.author_name
FROM book b
JOIN checkout c ON b.book_id = c.isbn
WHERE DATE(c.checkout_date) = CURRENT_DATE;

-- Create a Book
INSERT INTO book (book_id, title, author_name, year_published, quantity) 
VALUES ('678', 'New Book', 'New Author', '2023', '50');

-- Display All ISBNs and Their Checkout Status Along With Book Information
SELECT b.title, b.author_name, bi.isbn, c.is_returned
FROM book b
JOIN book_isbn bi ON b.book_id = bi.book_id
LEFT JOIN checkout c ON bi.isbn = c.isbn;

