-- for mySQL

-- Table: campaign
DROP TABLE IF EXISTS campaign;

CREATE TABLE campaign (
    id          INTEGER PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    goal        REAL    NOT NULL,
            UNIQUE (name)
);

INSERT INTO campaign (id, name, description, goal) VALUES (1, 'Save the Whales', 'Stop people from killing whales', 99999.0);
INSERT INTO campaign (id, name, description, goal) VALUES (2, 'Feed the Children', 'Help starving children', 50000.0);
INSERT INTO campaign (id, name, description, goal) VALUES (3, 'Stop Insomnia', 'Help people sleep', 60000.0);

-- Table: campaigndonation
DROP TABLE IF EXISTS campaigndonation;

CREATE TABLE campaigndonation (
    id         INTEGER PRIMARY KEY AUTO_INCREMENT,
    donationid INTEGER NOT NULL,
    campaignid INTEGER NOT NULL,
    UNIQUE(donationid,campaignid)
);

INSERT INTO campaigndonation (id, donationid, campaignid) VALUES (1, 1, 2);
INSERT INTO campaigndonation (id, donationid, campaignid) VALUES (2, 2, 1);
INSERT INTO campaigndonation (id, donationid, campaignid) VALUES (3, 3, 2);

-- Table: donation
DROP TABLE IF EXISTS donation;

CREATE TABLE donation (
    id          INTEGER  PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(255),
    money       INTEGER  NOT NULL,
    value       REAL     DEFAULT 0 
                         NOT NULL,
    location    VARCHAR(255),
    date        DATETIME,
    donorid     INTEGER  NOT NULL,
    UNIQUE(description)
);

INSERT INTO donation (id, description, money, value, location, date, donorid) VALUES (1, '$5000 for Feed the Children', 1, 321.0, 'Feed the children campaign', '2019-09-21', 1);
INSERT INTO donation (id, description, money, value, location, date, donorid) VALUES (2, '$5000 for save the whales', 1, 5000.0, 'save the whales campaign', '2019-09-21', 2);
INSERT INTO donation (id, description, money, value, location, date, donorid) VALUES (3, '$1000 for Feed the Children', 1, 1000.0, 'Feed the children campaign', '2019-09-21', 3);
INSERT INTO donation (id, description, money, value, location, date, donorid) VALUES (4, '$200 for save the sleepers', 1, 200.0, 'sleepers campaign headquarters', '2019-09-21', 4);

-- Table: donor
DROP TABLE IF EXISTS donor;

CREATE TABLE donor (
    id      INTEGER  PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(255)  NOT NULL,
    email   VARCHAR(255),
    phone   VARCHAR(255),
    address VARCHAR(255),
    comdate DATETIME,
    comtype VARCHAR(255),
    UNIQUE(name)
);

INSERT INTO donor (id, name, email, phone, address, comdate, comtype) VALUES (1, 'Waldo Wayne', 'new@hello.com', '212-555-5555', '123 Park Lane, Geneva, WI', '2019-09-21', 'phone');
INSERT INTO donor (id, name, email, phone, address, comdate, comtype) VALUES (2, 'Jane Wayne', 'jayne@waldo.com', '212-555-5555', '123 Park Lane, Geneva, WI', '2019-09-20', 'email');
INSERT INTO donor (id, name, email, phone, address, comdate, comtype) VALUES (3, 'Ralph Wayne', 'ralph@waldo.com', '212-555-5555', '123 Park Lane, Geneva, WI', '2019-09-21', 'phone');
INSERT INTO donor (id, name, email, phone, address, comdate, comtype) VALUES (4, 'Mary Wayne', 'mary@waldo.com', '212-555-5555', '123 Park Lane, Geneva, WI', '2019-09-21', 'phone');

-- Table: member
DROP TABLE IF EXISTS member;

CREATE TABLE member (
    id       INTEGER       PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255)       NOT NULL
                           ,
    password VARCHAR(255)       NOT NULL,
    type     VARCHAR(255),
    name     VARCHAR(255),
    email    VARCHAR(255),
    phone    VARCHAR(255),
    address  VARCHAR(255),
    UNIQUE(username)
    );

INSERT INTO member (id, username, password, type, name, email, phone, address) VALUES (1, 'user1', '$2a$10$s8T2qGSHhOr4EdkhCrEjWe41Ya9Gz3VL8QDPKrH.KZmls25Kwjfhm', 'board', 'Joe Smith', 'my@emai.com', '123-456-7890', '123 South Street, Mytown, NC');
INSERT INTO member (id, username, password, type, name, email, phone, address) VALUES (2, 'user2', '$2a$10$m/jfO.aWCieTbU9rEIDQ4.5uh5ycdd16SB79kZKo54r9tj5AET79O', 'user', 'Joan Smith', 'my@emai.com', '212-212-1212', '123 South Street, Mytown, NC');
INSERT INTO member (id, username, password, type, name, email, phone, address) VALUES (3, 'user3', '$2a$10$uiVSELrEo1EfR6hFbV.lu.vhb/c1F8TpCb31huXV0H4Xjaixg3Ege', 'campaign', 'Joey Smith', 'my@emai.com', '212-212-1212', '123 South Street, Mytown, NC');
INSERT INTO member (id, username, password, type, name, email, phone, address) VALUES (10, 'user77', 'password', 'user', 'Mary White', 'my@you.com', '123-456-7890', NULL);

-- Table: route
DROP TABLE IF EXISTS route;

CREATE TABLE route (
    id          INTEGER       PRIMARY KEY AUTO_INCREMENT,
    route       VARCHAR(255)  NOT NULL,
    body        VARCHAR(255),
    description VARCHAR(255),
    UNIQUE(route) 
);

INSERT INTO route (id, route, body, description) VALUES (1, 'get (/donate)', NULL, 'shows each route, a sample body, and a description');
INSERT INTO route (id, route, body, description) VALUES (2, 'get (/donate/member/user)', NULL, 'shows the information for each member of type user');
INSERT INTO route (id, route, body, description) VALUES (3, 'get (/donate/member/board)', NULL, 'shows the information for each member of type board');
INSERT INTO route (id, route, body, description) VALUES (4, 'get (/donate/member/campaign)', NULL, 'shows the information for each member of type campaign');
INSERT INTO route (id, route, body, description) VALUES (5, 'get (/donate/campaign)', NULL, 'shows the information for each campaign');
INSERT INTO route (id, route, body, description) VALUES (6, 'get (/donate/member)', NULL, 'shows the information for each member');
INSERT INTO route (id, route, body, description) VALUES (7, 'get (/donate/donor)', NULL, 'shows the information for each donor');
INSERT INTO route (id, route, body, description) VALUES (8, 'get (/donate/donation)', NULL, 'shows the information for each donation');
INSERT INTO route (id, route, body, description) VALUES (9, 'get (/donate/campaign/donation)', NULL, 'shows the campaign id and donation id for each donation to a specific campaign');
INSERT INTO route (id, route, body, description) VALUES (10, 'get (/donate/campaign/donate)', NULL, 'shows the information for donations and the campaign information for each donation');
INSERT INTO route (id, route, body, description) VALUES (11, 'get (/donate/campaign/donor)', NULL, 'shows the information for each donor that constributed to a campaingn and the information for that campaign');
INSERT INTO route (id, route, body, description) VALUES (12, 'get (/donate/camp/donor)', NULL, 'shows the information for each donor that constributed to a campaingn and the name for that campaign');
INSERT INTO route (id, route, body, description) VALUES (13, 'get (/donate/camp/don)', NULL, 'shows the information for each campaign and the donations to it and the donor of the donation');
INSERT INTO route (id, route, body, description) VALUES (14, 'delete (/donate/member/:id)', NULL, 'deletes a member with a given id');
INSERT INTO route (id, route, body, description) VALUES (15, 'delete (/donate/campaign/:id)', NULL, 'deletes a campaign with a given id');
INSERT INTO route (id, route, body, description) VALUES (16, 'delete (/donate/campaign/donattion/:id)', NULL, 'deletes a record in the many to many donation ids and campaingn ids with a given id');
INSERT INTO route (id, route, body, description) VALUES (17, 'delete (/donate/donor/:id)', NULL, 'deletes a donor with a given id');
INSERT INTO route (id, route, body, description) VALUES (18, 'delete (/donate/donation/:id)', NULL, 'deletes a donation with a given id');
INSERT INTO route (id, route, body, description) VALUES (19, 'post (/donate/donation)', ' {description: ''$5000 for Feed the Children'',money: 1,value: 321, location: ''Feed the children campaign'',date: ''2019-09-21'', donorid: 1 }', 'create a donation');
INSERT INTO route (id, route, body, description) VALUES (20, 'post (/donate/donor)', ' {name: ''Waldo Wayne'',email: ''waldo@waldo.com'',phone: ''212-555-5555'',address: ''123 Park Lane, Geneva, WI'',comdate: ''2019-09-21'',comtype: ''phone''}', 'create a donor');
INSERT INTO route (id, route, body, description) VALUES (21, 'post (/donate/campaign/donation)', ' { donationid: 1, campaignid: 2 }', 'create a record showing a donation id is linked to a particular campaign id');
INSERT INTO route (id, route, body, description) VALUES (22, 'post (/donate/campaign)', ' { name: ''Save the Whales'', description: ''Stop people from killing whales'', goal: 1000000 }', 'create a campaign');
INSERT INTO route (id, route, body, description) VALUES (23, 'put (/donate/donation/:id)', ' { description: ''$5000 for Feed the Children'', money: 1, value: 321, location: ''Feed the children campaign'', date: ''2019-09-21'',donorid: 1 }', 'update information about a donation');
INSERT INTO route (id, route, body, description) VALUES (24, 'put (/donate/donor/:id)', ' { name: ''Waldo Wayne'', email: ''waldo@waldo.com'', phone: ''212-555-5555'', address: ''123 Park Lane, Geneva, WI'', comdate: ''2019-09-21'', comtype: ''phone'' }', 'update information about a donor');
INSERT INTO route (id, route, body, description) VALUES (25, 'put (/donate/member/:id)', ' { username: ''user1'', password: ''something'', type: ''board'',email: ''waldo@waldo.com'',phone: ''212-555-5555'',address: ''123 Park Lane, Geneva, WI'' }', 'update information about a member');
INSERT INTO route (id, route, body, description) VALUES (26, 'put (/donate/campaign/:id)', ' {name: ''Save the Whales'', description: ''Stop people from killing whales'', goal: 1000000 }', 'update information about a campaign');
INSERT INTO route (id, route, body, description) VALUES (27, 'put (/donate/campaign/donation/:id)', ' { donationid: 1, campaignid: 2 }', 'update information about a donation id campaign id pairing');
INSERT INTO route (id, route, body, description) VALUES (28, 'post (/donate/register/user)', ' { username: ''user1'', password: ''something'',email: ''waldo@waldo.com'',phone: ''212-555-5555'',address: ''123 Park Lane, Geneva, WI''}', 'create a member account of type user');
INSERT INTO route (id, route, body, description) VALUES (29, 'post (/donate/register/board)', ' { username: ''user1'', password: ''something'',email: ''waldo@waldo.com'',phone: ''212-555-5555'',address: ''123 Park Lane, Geneva, WI''}', 'create a member account of type board');
INSERT INTO route (id, route, body, description) VALUES (30, 'post (/donate/register/campaign)', ' { username: ''user1'', password: ''something'',email: ''waldo@waldo.com'',phone: ''212-555-5555'',address: ''123 Park Lane, Geneva, WI'' }', 'create a member account of type campaign');
INSERT INTO route (id, route, body, description) VALUES (31, 'post (/donate/login)', ' { username: ''user1'', password: ''something'' }', 'log in for a member of any type');

-- View: boardmember
DROP VIEW IF EXISTS boardmember;
CREATE VIEW boardmember AS
    SELECT *
      FROM member
     WHERE type = 'board';


-- View: campaigndonor
DROP VIEW IF EXISTS campaigndonor;
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
DROP VIEW IF EXISTS campaignmember;
CREATE VIEW campaignmember AS
    SELECT *
      FROM member
     WHERE type = 'campaign';


-- View: campdonate
DROP VIEW IF EXISTS campdonate;
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
DROP VIEW IF EXISTS campdonor;
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
DROP VIEW IF EXISTS campdons;
CREATE VIEW campdons AS
    SELECT DISTINCT
campaign.id as campaign_id,
campaign.name as c_name,
campaign.description as c_description,
campaign.goal as c_goal,
donation.id as donation_id,
donation.description as da_description,
donation.money as da_money,
donation.value as da_value,
donation.location as da_location,
donation.date as da_date,
donor.id as donor_id,
donor.name as dr_name,
donor.email as dr_email,
donor.phone as dr_phone,
donor.address as dr_address,
donor.comdate as dr_comdate,
donor.comtype as dr_comtype
      FROM campaign,
           donor,
           donation,
           campaigndonation
     WHERE donor.id = donation.donorid AND 
           donation.id = campaigndonation.donationid AND 
           campaign.id = campaigndonation.campaignid;



-- View: usermember
DROP VIEW IF EXISTS usermember;
CREATE VIEW usermember AS
    SELECT *
      FROM member
     WHERE type = 'user';
