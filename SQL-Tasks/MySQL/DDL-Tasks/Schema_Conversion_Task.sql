--Problem 1
CREATE TABLE Customer (…, PRIMARY KEY (CustNo) )

CREATE TABLE Order(…, PRIMARY KEY (OrdNo),
            FOREIGN KEY (CustNo) REFERENCES Customer,
            FOREIGN KEY (EmpNo) REFERENCES Employee,
            CONSTRAINT CustNo NOT NULL )

CREATE TABLE Product(…, PRIMARY KEY (ProdNo) )

CREATE TABLE Employee(…, PRIMARY KEY (EmpNo),
            FOREIGN KEY (MgrNo) REFERENCES Employee )

CREATE TABLE OrderDetails(…, PRIMARY KEY (OrdNo, ProdNo),
            FOREIGN KEY (OrdNo) REFERENCES Order,
            FOREIGN KEY (ProdNo) REFERENCES Product )


--Problem 2
3 Entity type rules
2 1-M Relationship rules
0 M-N Relationship rules
2 identifying relationship rules

--Problem 3
CREATE TABLE Building(…, PRIMARY KEY (BldgID) )

CREATE TABLE Room(…, PRIMARY KEY (RoomNo),
            FOREIGN KEY (BldgID) REFERENCES Building,
            CONSTRAINT BldgID NOT NULL )
