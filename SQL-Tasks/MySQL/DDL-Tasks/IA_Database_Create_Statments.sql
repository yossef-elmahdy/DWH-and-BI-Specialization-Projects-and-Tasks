            --CUSTOMER TABLE--
CREATE TABLE Customer
(
    custNo varchar(8) not null,
    custName varchar(30) not null,
    address varchar(30) not null,
    internal char(1) not null,
    contact varchar(30) not null,
    phone char(8) not null,
    city varchar(30) not null,
    state varchar(3) not null,
    zip char(6) not null,
    CONSTRAINT pk_custNo PRIMARY KEY (custNo)
);


        --Facility TABLE--
CREATE TABLE Facility
(
    facNo varchar(8) not null,
    facName varchar(30) not null,
    CONSTRAINT pk_facNo PRIMARY KEY (facNo)
);


        --Employee TABLE--
CREATE TABLE Employee
(
    empNo varchar(8) not null,
    empName varchar(30) not null,
    department varchar(30),
    email varchar(30) not null,
    phone varchar(8) not null,
    CONSTRAINT pk_empNo PRIMARY KEY (empNo),
    /*CONSTRAINT unique_email UNIQUE (email)*/
);


        --Resources TABLE--
CREATE TABLE ResourceTbl
(
    resNo varchar(8) not null,
    resName varchar(30) not null,
    rate float not null CHECK (rate > 0),
    CONSTRAINT pk_resNo PRIMARY KEY (resNo)
);


        --Location TABLE--
CREATE TABLE Location
(
    locNo varchar(8) not null,
    facNo varchar(8) not null,
    locName varchar(30) not null,
    CONSTRAINT pk_locNo PRIMARY KEY (locNo),
    CONSTRAINT fk_facNo FOREIGN KEY (facNo) REFERENCES Facility(facNo)
);



        --EventRequest TABLE--
CREATE TABLE EventRequest
(
    eventNo varchar(8) not null,
    dateHeld date not null,
    dateReq date not null,
    facNo varchar(8) not null,
    custNo varchar(8) not null,
    dateAuth date,
    status varchar(10) not null CHECK (status IN ('Pending', 'Denied', 'Approved')),
    estCost float not null,
    estAudience float not null CHECK (estAudience > 0),
    budNo varchar(8),
    CONSTRAINT pk_eventNo PRIMARY KEY (eventNo),
    CONSTRAINT fk_facNo FOREIGN KEY (facNo) REFERENCES Facility(facNo),
    CONSTRAINT fk_custNo FOREIGN KEY (custNo) REFERENCES Customer(custNo)
);


        --EventPlan TABLE--
CREATE TABLE EventPlan
(
    planNo varchar(8) not null,
    eventNo varchar(8) not null,
    workDate date not null,
    notes varchar(100),
    activity varchar(20) not null,
    empNo varchar(8),
    CONSTRAINT pk_planNo PRIMARY KEY (planNo),
    CONSTRAINT fk_eventNo FOREIGN KEY (eventNo) REFERENCES EventRequest(eventNo),
    CONSTRAINT fk_empNo FOREIGN KEY (empNo) REFERENCES Employee(empNo)
);


--EventPlanLine TABLE--
CREATE TABLE EventPlanLine
(
    planNo varchar(8) not null,
    lineNo varchar(3) not null,
    timeStart datetime not null CHECK (timeStart < timeEnd),
    timeEnd datetime not null,
    numberFld varchar(3) not null,
    locNo varchar(8) not null,
    resNo varchar(8) not null,
    CONSTRAINT pk_plan_line PRIMARY KEY (planNo, lineNo),
    CONSTRAINT fk_planNo FOREIGN KEY (planNo) REFERENCES EventPlan(planNo),
    CONSTRAINT fk_locNo FOREIGN KEY (locNo) REFERENCES Location(locNo),
    CONSTRAINT fk_resNo FOREIGN KEY (resNo) REFERENCES ResourceTbl(resNo)
);
