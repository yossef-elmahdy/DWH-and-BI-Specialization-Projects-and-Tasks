-- Franchise Dimension
INSERT INTO franchise
VALUES
('F1', 'Northwest', '98011', 'Full'),
('F2', 'Mountain', '80111', 'Medium'),
('F3', 'Central', '45236', 'Large');


-- Service Dimension
INSERT INTO service
VALUES
('SC1', 'Ball machine'),
('SC2', 'Private lesson'),
('SC3', 'Adult class'),
('SC4', 'Child class');


-- Merchandise Dimension
INSERT INTO merchandise
VALUES
('MC1', 'Wilson balls', 'Balls'),
('MC2', 'Wilson racket', 'Racket'),
('MC3', 'Adidas shoes', 'Shoes'),
('MC4', 'Racket stringing', 'Racket');


-- Calendar Dimension
INSERT INTO calendar
VALUES
('C20090201', 2009, 2, 1),
('C20100101', 2010, 1, 1),
('C20110303', 2011, 3, 3);


INSERT INTO calendar
VALUES
('C20130210', 2013, 2, 10),
('C20130211', 2013, 2, 11),
('C20130212', 2013, 2, 12),
('C20130213', 2013, 2, 13),
('C20130214', 2013, 2, 14),
('C20130215', 2013, 2, 15),
('C20130216', 2013, 2, 16),
('C20130217', 2013, 2, 17),
('C20130218', 2013, 2, 18),
('C20130219', 2013, 2, 19),
('C20130220', 2013, 2, 20),
('C20130221', 2013, 2, 21);




-- Customer Dimension
INSERT INTO customer
VALUES
('1111', 'Joe', 'joe@serv1.com' , '98011', 'Platinum'),
('2222', 'Mary', 'mary@serv2.com', '80112', 'Gold'),
('3333', 'Sue', 'sue@serv3.com', '45327', 'Value');

INSERT INTO customer (CustId, CustName, CustEmail, CustZip)
VALUES
('4444', 'George', 'george@serv4.com' , '45236');

INSERT INTO customer (CustId, CustName, Type)
VALUES
('5555', 'First Data', 'Adult Social'),
('6666', 'DU Tennis', 'Pioneer Social'),
('7777', 'Creek High School', 'Team Practice');


-- Sales Fact
INSERT INTO sales_fact
(FranchId, CustId, MerchId, MerchDateId, MerchQTY, MerchPrice)
VALUES
('F1', '1111', 'MC1', 'C20130210', 2, 3),
('F1', '1111', 'MC2', 'C20130210', 1, 200),
('F2', '2222', 'MC4', 'C20130213', 1, 40),
('F3', '3333', 'MC3', 'C20130214', 1, 100),
('F3', '4444', 'MC4', 'C20130210', 1, 40);

INSERT INTO sales_fact
(FranchId, CustId, ServId, ServDateId, ServPrice)
VALUES
('F1', '1111', 'SC1', 'C20130213', 15),
('F2', '2222', 'SC2', 'C20130214', 75),
('F3', '4444', 'SC3', 'C20130215', 150)


INSERT INTO sales_fact
(FranchId, CustId, MemberDateId, CustMemPrice)
VALUES
('F1', '1111', 'C20090201' , 1000),
('F2', '2222', 'C20100101', 800),
('F3', '3333', 'C20110303', 300);

INSERT INTO sales_fact
(FranchId, CustId)
VALUES
('F3', '4444');
