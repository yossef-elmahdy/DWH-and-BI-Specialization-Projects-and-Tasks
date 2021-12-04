CREATE TABLE Franchise
(
    -- Franchise Dimension
    FranchId VARCHAR(10) NOT NULL,
    FranchRegion VARCHAR(20) NOT NULL,
    FranchPostCode CHAR(5) NOT  NULL,
    FranchModelType VARCHAR(10) NOT NULL CHECK (FranchModelType IN ('Full', 'Medium', 'Large')),
    CONSTRAINT pk_FranchId PRIMARY KEY (FranchId)
    -- FranchModelType can be: Full, Meduim or Large
);

CREATE TABLE Service
(
    -- Service Dimension
    ServId VARCHAR(10) NOT NULL,
    ServName VARCHAR(100) NOT NULL,
    CONSTRAINT pk_ServId PRIMARY KEY(ServId)
);

CREATE TABLE Customer
(
    -- Customer (Member) Dimension
    CustId VARCHAR(10) NOT NULL,
    CustName VARCHAR(100) NOT NULL,
    CustEmail VARCHAR(100) UNIQUE,
    CustZip VARCHAR(100),
    Type VARCHAR(50),
    CONSTRAINT pk_CustId PRIMARY KEY (CustId)
    -- Type: Membership or Event Type (Can be null for the guests members who
    -- purchase services or merchandise only)
    -- CustEmail and CustZip are missing for special events partnerships (more investigation)
    -- CustEmail: Unique email addresses
);

CREATE TABLE Merchandise
(
    -- Merchandise Dimension
    MerchId VARCHAR(10) NOT NULL,
    MerchName VARCHAR(100) NOT NULL,
    MerchType VARCHAR(50) NOT NULL,
    CONSTRAINT pk_MerchId PRIMARY KEY (MerchId)
    -- MerchType: Category of merchandise
    -- Possible Hierarchy of (MerchType --> MerchName)
);

CREATE TABLE Calendar
(
    -- Calendar Dimension for historical and date/time events
    CalId VARCHAR(10) NOT NULL,
    CalYear INT,
    CalMonth INT,
    CalDay Int,
    CONSTRAINT pk_CalId PRIMARY KEY (CalId)
    -- Possible Hierarchy of (CalYear --> CalMonth --> CalDay)
);

CREATE TABLE Sales_Fact
(
    -- Sales Fact Table as the center of the star schema
    Sales_Sk INT NOT NULL AUTO_INCREMENT,
    FranchId VARCHAR(10),
    CustId VARCHAR(10) NOT NULL,
    MerchId VARCHAR(10),
    ServId VARCHAR(10),
    MerchDateId VARCHAR(10),
    ServDateId VARCHAR(10),
    MemberDateID VARCHAR(10),
    MerchQTY INT,
    MerchPrice DECIMAL(8, 2),
    MerchAmount DECIMAL(8, 2) AS (MerchQTY * MerchPrice),
    ServPrice DECIMAL(8, 2),
    CustMemPrice DECIMAL(8, 2),
    CONSTRAINT pk_sales_sk PRIMARY KEY (Sales_Sk),
    CONSTRAINT fk_FranchId FOREIGN KEY (FranchId) REFERENCES Franchise (FranchId) ON DELETE CASCADE,
    CONSTRAINT fk_CustId FOREIGN KEY (CustId) REFERENCES Customer (CustId) ON DELETE CASCADE,
    CONSTRAINT fk_MerchId FOREIGN KEY (MerchId) REFERENCES Merchandise (MerchId) ON DELETE SET NULL,
    CONSTRAINT fk_ServId FOREIGN KEY (ServId) REFERENCES Service (ServId) ON DELETE SET NULL,
    CONSTRAINT fk_MerchDateId FOREIGN KEY (MerchDateId) REFERENCES Calendar (CalId) ON DELETE SET NULL,
    CONSTRAINT fk_ServDateId FOREIGN KEY (ServDateId) REFERENCES Calendar (CalId) ON DELETE SET NULL,
    CONSTRAINT fk_MemberDateId FOREIGN KEY (MemberDateId) REFERENCES Calendar (CalId) ON DELETE SET NULL
);


CREATE TABLE sales_fact_log
(
    -- Tracking and logging all the transactions that occurs to the sales fact
    -- using triggers
    logId INT NOT NULL AUTO_INCREMENT,
    logUser VARCHAR(100) NOT NULL,
    logTime TIMESTAMP AS CURRENT()
);

-------------TRIGGERS-----------
-- Insert Trigger
DELIMITER $$
CREATE TRIGGER sales_fact_log_insert_trig
AFTER INSERT
ON sales_fact FOR EACH ROW
BEGIN
	INSERT INTO sales_fact_log (logUser, logOperation, SalesId)
    VALUES (USER(), 'Insert', NEW.Sales_Sk);
END $$
DELIMITER ;

-- Update Trigger
DELIMITER $$
CREATE TRIGGER sales_fact_log_update_trig
AFTER UPDATE
ON sales_fact FOR EACH ROW
BEGIN
	INSERT INTO sales_fact_log (logUser, logOperation, SalesId)
    VALUES (USER(), 'Update', NEW.Sales_Sk);
END $$
DELIMITER ;

-- Delete Trigger
DELIMITER $$
CREATE TRIGGER sales_fact_log_delete_trig
BEFORE DELETE
ON sales_fact FOR EACH ROW
BEGIN
	INSERT INTO sales_fact_log (logUser, logOperation, SalesId)
    VALUES (USER(), 'Delete', OLD.Sales_Sk);
END $$
DELIMITER ;
