--Problem 1-4
CREATE TABLE Student (…, PRIMARY KEY (StdNo) )

CREATE TABLE Institution (…, PRIMARY KEY (InstID) )

CREATE TABLE Lender (…, PRIMARY KEY (LenderNo) )

CREATE TABLE Loan (…, PRIMARY KEY (LoanNo),
            FOREIGN KEY (StdNo) REFERENCES Student,
            FOREIGN KEY (InstID) REFERENCES Institution,
            FOREIGN KEY (LenderNO) REFERENCES Lender,
            CONSTRAINT StdNo NOT NULL,
            CONSTRAINT LoanNo NOT NULL,
            CONSTRAINT LenderNO NOT NULL )

CREATE TABLE DisburseLine (…, PRIMARY KEY (LoanNo, DateSent),
            FOREIGN KEY (LoanNo) REFERENCES Loan )



--Problem 5
CREATE TABLE Account (…, PRIMARY KEY (AcctID),
            FOREIGN KEY (DecID) REFERENCES Account )


--Problem 6
CREATE TABLE Owner (…, PRIMARY KEY (OwnID) )

CREATE TABLE Property (…, PRIMARY KEY (ProbID) )

CREATE TABLE SharedProperty (…, PRIMARY KEY (OwnID, ProbID)
            FOREIGN KEY (OwnID) REFERENCES Owner,
            FOREIGN KEY (ProbID) REFERENCES Property )



CREATE TABLE Building(…, PRIMARY KEY (BldgID) )

CREATE TABLE Room(…, PRIMARY KEY (RoomNo),
            FOREIGN KEY (BldgID) REFERENCES Building,
            CONSTRAINT BldgID NOT NULL )
