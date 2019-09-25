--
-- File generated with SQLiteStudio v3.2.1 on Wed Sep 25 13:18:39 2019
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: campaign
CREATE TABLE campaign (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    name        VARCHAR UNIQUE
                        NOT NULL,
    description VARCHAR,
    goal        REAL    NOT NULL,
    CHECK (goal >= 0 AND 
           goal < 100000000000000) 
);


-- Table: campaigndonation
CREATE TABLE campaigndonation (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    donationid INTEGER REFERENCES donation (id) 
                       NOT NULL,
    campaignid INTEGER REFERENCES campaign (id) 
                       NOT NULL
);


-- Table: donation
CREATE TABLE donation (
    id          INTEGER  PRIMARY KEY AUTOINCREMENT,
    description VARCHAR,
    money       INTEGER  NOT NULL,
    value       REAL     DEFAULT (0) 
                         NOT NULL,
    location    VARCHAR,
    date        DATETIME,
    donorid     INTEGER  REFERENCES donor (id) 
                         NOT NULL,
    CHECK ( (money = 1 OR 
             money = 0) AND 
            (date IS NULL OR 
             (date(date) IS NOT NULL AND 
              date(date) > date('now', '-5 years') AND 
              date(date) < date('now', '+5 years') ) ) ) 
);


-- Table: donor
CREATE TABLE donor (
    id      INTEGER  PRIMARY KEY AUTOINCREMENT,
    name    VARCHAR  NOT NULL,
    email   VARCHAR,
    phone   VARCHAR,
    address VARCHAR,
    comdate DATETIME,
    comtype VARCHAR,
    CHECK ( (email IS NULL OR 
             email LIKE '%_@%_.%_') AND 
            (comdate IS NULL OR 
             (date(comdate) IS NOT NULL AND 
              date(comdate) > date('now', '-5 years') AND 
              date(comdate) < date('now', '+5 years') ) ) ) 
);


-- Table: member
CREATE TABLE member (
    id       INTEGER       PRIMARY KEY AUTOINCREMENT,
    username VARCHAR       NOT NULL
                           UNIQUE,
    password VARCHAR       NOT NULL,
    type     VARCHAR,
    name     VARCHAR,
    email    VARCHAR (255),
    phone    VARCHAR (255),
    address  VARCHAR (255),
    CHECK (type = 'board' OR 
           type = 'user' OR 
           type = 'campaign') 
);


-- Table: route
CREATE TABLE route (
    id          INTEGER       PRIMARY KEY AUTOINCREMENT,
    route       VARCHAR (255) UNIQUE
                              NOT NULL,
    body        VARCHAR (255),
    description VARCHAR (255) 
);


-- View: boardmember
CREATE VIEW boardmember AS
    SELECT *
      FROM member
     WHERE type = 'board';


-- View: campaigndonor
CREATE VIEW campaigndonor AS
    SELECT DISTINCT campaign.id AS campaign_id,
                    campaign.name AS c_name,
                    campaign.description AS c_description,
                    campaign.goal AS c_goal,
                    donor.id AS donor_id,
                    donor.name AS d_name,
                    donor.email AS d_email,
                    donor.phone AS d_phone,
                    donor.address AS d_address,
                    donor.comdate AS d_comdate,
                    donor.comtype AS d_comtype
      FROM campaign,
           donor,
           donation,
           campaigndonation
     WHERE donor.id = donation.donorid AND 
           donation.id = campaigndonation.donationid AND 
           campaign.id = campaigndonation.campaignid;


-- View: campaignmember
CREATE VIEW campaignmember AS
    SELECT *
      FROM member
     WHERE type = 'campaign';


-- View: campdonate
CREATE VIEW campdonate AS
    SELECT DISTINCT campaign.id AS campaign_id,
                    campaign.name AS c_name,
                    campaign.description AS c_description,
                    campaign.goal AS c_goal,
                    donation.id AS donation_id,
                    donation.description AS d_description,
                    donation.money AS d_money,
                    donation.value AS d_value,
                    donation.location AS d_location,
                    donation.date AS d_date,
                    donation.donorid AS d_donorid
      FROM campaign,
           donation,
           campaigndonation
     WHERE donation.id = campaigndonation.donationid AND 
           campaign.id = campaigndonation.campaignid;


-- View: campdonor
CREATE VIEW campdonor AS
    SELECT campaign_id,
           c_Name,
           donor_id,
           d_Name,
           d_Email,
           d_phone,
           d_address,
           d_comdate,
           d_comtype
      FROM campaigndonor;


-- View: campdons
CREATE VIEW campdons AS
    SELECT DISTINCT campaign.id AS campaign_id,
                    campaign.*,
                    donor.id AS donor_id,
                    donor.*,
                    donation.id AS donation_id,
                    donation.*
      FROM campaign,
           donor,
           donation,
           campaigndonation
     WHERE donor.id = donation.donorid AND 
           donation.id = campaigndonation.donationid AND 
           campaign.id = campaigndonation.campaignid;


-- View: usermember
CREATE VIEW usermember AS
    SELECT *
      FROM member
     WHERE type = 'user';


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
