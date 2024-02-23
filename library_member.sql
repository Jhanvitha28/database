create schema lms4;
use lms4;
create table library_member (member_id Integer primary key,first_name varchar(25),last_name varchar(25),email_address varchar(35),phone_number bigint, memebership_level varchar(10),address_id Integer);
create table checkout(id Integer primary key,isbn bigint,member_id Integer,checkout_date datetime,due_date datetime,is_returned boolean);
create table book(book_id Integer primary key,title varchar(45),author_name varchar(50),year_published Integer,quantity Integer);
create table address(address_id Integer primary key, line1 varchar(30),line2 varchar(30),city varchar(20),state char(2),zip Integer);
create table book_isbn(isbn bigint primary key,book_id Integer);
alter table library_member add foreign key (address_id) REFERENCES address (address_id);
alter table checkout add foreign key (member_id) REFERENCES library_member (member_id);
alter table checkout add foreign key (isbn) REFERENCES book_isbn (isbn);
alter table book_isbn add foreign key (book_id) REFERENCES book (book_id);

INSERT INTO book (book_id, title, author_name, year_published, quantity) VALUES
('123', 'Head First Java', 'Bert Bates', '2014', '100'),
('124', 'Effective Java', 'Joshua Bloch', '2015', '200'),
('125', 'Java Concurrency in Practice', 'Tim Peierls', '2016', '250'),
('234', 'Thinking in Java', 'Bruce Eckel', '2017', '200'),
('240', 'Java: The Complete Reference', 'Herbert Schildt', '2017', '100'),
('260', 'Java Programming', 'D.S. Malik', '2014', '50'),
('345', 'Clean Code', 'Robert C. Martin', '2008', '150'),
('456', 'Design Patterns', 'Erich Gamma', '1994', '300'),
('567', 'Head First Design Patterns', 'Eric Freeman', '2004', '180');


INSERT INTO book_isbn VALUES ('0061120081', '123'),(
'0141182556',123),
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

INSERT INTO address VALUES ('098', '123 Main Street', 'Suite 101', 'Anytown', 'NY', '12345'),
('099', '456 Elm Street', 'Apt 202', 'Springfield', 'IL', '54321'),
('089', '789 Oak Avenue', 'Unit B', 'Lakeside', 'CA', '67890'),
('780', '321 Pine Road', 'Building C', 'Mountainville', 'TX', '98765'),
('540', '654 Maple Lane', 'Floor 2', 'Riverdale', 'GA', '13579'),
('650', '987 Birch Street', 'Suite 303', 'Brookside', 'FL', '24680');


INSERT INTO library_member  VALUES ('1', 'Emily', 'Johnson', 'emily.johnson@example.com', '5551234567', 'assosiate', '89'),
 ('2', 'Michael', 'Brown', 'michael.brown@example.com', '5551234568', 'associate', '98'),
 ('3', 'Jessica', 'Martinez', 'jessica.martinez@example.com', '5551234569', 'student', '780'),
 ('4', 'Christopher', 'Anderson', 'christopher.anderson@example.com', '5551234560', 'student', '89'),
 ('5', 'Sarah', 'Thompson', 'sarah.thompson@example.com', '5551234570', 'vendor', '650'),
 ('6', 'David', 'White', 'david.white@example.com', '5551234571', 'vendor', '650'),
 ('7', 'Amanda', 'Garcia', 'amanda.garcia@example.com', '5551234572', 'student', '540'),
 ('8', 'Matthew', 'Rodriguez', 'matthew.rodriguez@example.com', '5551234573', 'student', '540'),
 ('9', 'Ashley', 'Wilson', 'ashley.wilson@example.com', '5551234574', 'associate', '98'),
 ('10', 'James', 'Lee', 'james.lee@example.com', '5551234575', 'associate', '89');