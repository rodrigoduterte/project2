drop database if exists salesdb;
create database salesdb;
use salesdb;

CREATE TABLE Customers (id int NOT NULL AUTO_INCREMENT, firstname varchar(255) NOT NULL, lastname varchar(255) NOT NULL, address varchar(255), phone varchar(255) NOT NULL, email varchar(255), interested tinyint(1) DEFAULT 1, createdAt datetime NOT NULL, updatedAt datetime NOT NULL, PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 DEFAULT COLLATE=utf8_unicode_ci;
INSERT INTO Customers (id, firstname, lastname, address, phone, email, interested, createdAt, updatedAt) VALUES (1, 'Connor', 'Best', '2954 Ruxton Dr', '4072536785', 'connorrthebest@yahoo.com', true, '2018-09-01 00:25:04', '2018-09-01 02:34:26');
INSERT INTO Customers (id, firstname, lastname, address, phone, email, interested, createdAt, updatedAt) VALUES (2, 'John', 'Doe', '123 Greenwood Boulevard, Lake Mary, FL, USA', '2375832675', 'email@email.com', true, '2018-09-01 13:40:09', '2018-09-01 13:40:25');

CREATE TABLE FollowUps (id int NOT NULL AUTO_INCREMENT, open tinyint(1) DEFAULT 1 NOT NULL, action varchar(255), memo varchar(255), duedate datetime, createdAt datetime NOT NULL, updatedAt datetime NOT NULL, CustomerId int, FollowupStatusTypeId int, PRIMARY KEY (id), INDEX CustomerId (CustomerId), INDEX FollowupStatusTypeId (FollowupStatusTypeId)) ENGINE=InnoDB DEFAULT CHARSET=utf8 DEFAULT COLLATE=utf8_unicode_ci;
INSERT INTO FollowUps (id, open, action, memo, duedate, createdAt, updatedAt, CustomerId, FollowupStatusTypeId) VALUES (1, false, 'Call back', 'Call later', '2019-01-08 00:00:00', '2018-08-31 00:00:00', '2018-09-01 06:33:40', 1, 1);
INSERT INTO FollowUps (id, open, action, memo, duedate, createdAt, updatedAt, CustomerId, FollowupStatusTypeId) VALUES (2, true, 'Call back', null, '2018-09-01 05:56:57', '2018-09-01 05:56:57', '2018-09-01 05:56:57', null, null);
INSERT INTO FollowUps (id, open, action, memo, duedate, createdAt, updatedAt, CustomerId, FollowupStatusTypeId) VALUES (3, false, 'Call back', 'Call later', '2018-09-01 06:00:15', '2018-09-01 06:00:15', '2018-09-01 06:37:31', 1, 4);
INSERT INTO FollowUps (id, open, action, memo, duedate, createdAt, updatedAt, CustomerId, FollowupStatusTypeId) VALUES (4, true, 'Request shipping Date', '', '2001-09-01 04:00:00', '2018-09-01 06:05:34', '2018-09-01 06:28:03', 1, 7);
INSERT INTO FollowUps (id, open, action, memo, duedate, createdAt, updatedAt, CustomerId, FollowupStatusTypeId) VALUES (7, true, 'Call back', null, '2001-09-01 04:00:00', '2018-09-01 06:26:07', '2018-09-01 06:26:07', 1, 4);
INSERT INTO FollowUps (id, open, action, memo, duedate, createdAt, updatedAt, CustomerId, FollowupStatusTypeId) VALUES (8, true, 'Follow-Up', null, '2001-09-01 04:00:00', '2018-09-01 06:26:23', '2018-09-01 06:26:23', 1, 3);

CREATE TABLE FollowupActionTypes (action varchar(255) NOT NULL, createdAt datetime NOT NULL, updatedAt datetime NOT NULL, FollowupStatusTypeId int, INDEX FollowupStatusTypeId (FollowupStatusTypeId)) ENGINE=InnoDB DEFAULT CHARSET=utf8 DEFAULT COLLATE=utf8_unicode_ci;
INSERT INTO FollowupActionTypes (action, createdAt, updatedAt, FollowupStatusTypeId) VALUES ('Call back', '2018-09-01 01:18:57', '2018-09-01 01:18:57', 1);
INSERT INTO FollowupActionTypes (action, createdAt, updatedAt, FollowupStatusTypeId) VALUES ('Call back', '2018-09-01 01:18:57', '2018-09-01 01:18:57', 2);
INSERT INTO FollowupActionTypes (action, createdAt, updatedAt, FollowupStatusTypeId) VALUES ('Follow-Up', '2018-09-01 01:18:57', '2018-09-01 01:18:57', 3);
INSERT INTO FollowupActionTypes (action, createdAt, updatedAt, FollowupStatusTypeId) VALUES ('Change lead status to Dropped', '2018-09-01 01:18:57', '2018-09-01 01:18:57', 3);
INSERT INTO FollowupActionTypes (action, createdAt, updatedAt, FollowupStatusTypeId) VALUES ('Follow-Up', '2018-09-01 01:18:57', '2018-09-01 01:18:57', 4);
INSERT INTO FollowupActionTypes (action, createdAt, updatedAt, FollowupStatusTypeId) VALUES ('Change lead status to Dropped', '2018-09-01 01:18:57', '2018-09-01 01:18:57', 4);
INSERT INTO FollowupActionTypes (action, createdAt, updatedAt, FollowupStatusTypeId) VALUES ('Follow-Up', '2018-09-01 01:18:57', '2018-09-01 01:18:57', 5);
INSERT INTO FollowupActionTypes (action, createdAt, updatedAt, FollowupStatusTypeId) VALUES ('Change lead status to Dropped', '2018-09-01 01:18:57', '2018-09-01 01:18:57', 5);
INSERT INTO FollowupActionTypes (action, createdAt, updatedAt, FollowupStatusTypeId) VALUES ('Change lead status to Potential', '2018-09-01 01:18:57', '2018-09-01 01:18:57', 6);
INSERT INTO FollowupActionTypes (action, createdAt, updatedAt, FollowupStatusTypeId) VALUES ('Request shipping Date', '2018-09-01 01:18:57', '2018-09-01 01:18:57', 7);
INSERT INTO FollowupActionTypes (action, createdAt, updatedAt, FollowupStatusTypeId) VALUES ('Waiting to Ship', '2018-09-01 01:18:57', '2018-09-01 01:18:57', 7);
INSERT INTO FollowupActionTypes (action, createdAt, updatedAt, FollowupStatusTypeId) VALUES ('Check Inventory', '2018-09-01 01:18:57', '2018-09-01 01:18:57', 7);
INSERT INTO FollowupActionTypes (action, createdAt, updatedAt, FollowupStatusTypeId) VALUES ('No Action needed', '2018-09-01 01:18:57', '2018-09-01 01:18:57', 8);
INSERT INTO FollowupActionTypes (action, createdAt, updatedAt, FollowupStatusTypeId) VALUES ('No Action needed', '2018-09-01 01:18:57', '2018-09-01 01:18:57', 9);

CREATE TABLE FollowupStatusTypes (id int NOT NULL AUTO_INCREMENT, name varchar(255) NOT NULL, createdAt datetime NOT NULL, updatedAt datetime NOT NULL, PRIMARY KEY (id), CONSTRAINT name UNIQUE (name)) ENGINE=InnoDB DEFAULT CHARSET=utf8 DEFAULT COLLATE=utf8_unicode_ci;
INSERT INTO FollowupStatusTypes (id, name, createdAt, updatedAt) VALUES (1, 'Customer is Busy', '2018-09-01 01:14:13', '2018-09-01 01:14:13');
INSERT INTO FollowupStatusTypes (id, name, createdAt, updatedAt) VALUES (2, 'Call but no answer', '2018-09-01 01:14:13', '2018-09-01 01:14:13');
INSERT INTO FollowupStatusTypes (id, name, createdAt, updatedAt) VALUES (3, 'Need to discuss', '2018-09-01 01:14:13', '2018-09-01 01:14:13');
INSERT INTO FollowupStatusTypes (id, name, createdAt, updatedAt) VALUES (4, 'Already purchased', '2018-09-01 01:14:13', '2018-09-01 01:14:13');
INSERT INTO FollowupStatusTypes (id, name, createdAt, updatedAt) VALUES (5, 'No longer Need', '2018-09-01 01:14:13', '2018-09-01 01:14:13');
INSERT INTO FollowupStatusTypes (id, name, createdAt, updatedAt) VALUES (6, 'Not purchase now', '2018-09-01 01:14:13', '2018-09-01 01:14:13');
INSERT INTO FollowupStatusTypes (id, name, createdAt, updatedAt) VALUES (7, 'Follow up Sales Order', '2018-09-01 01:14:13', '2018-09-01 01:14:13');
INSERT INTO FollowupStatusTypes (id, name, createdAt, updatedAt) VALUES (8, 'Shipped', '2018-09-01 01:14:13', '2018-09-01 01:14:13');
INSERT INTO FollowupStatusTypes (id, name, createdAt, updatedAt) VALUES (9, 'Order Completed', '2018-09-01 01:14:13', '2018-09-01 01:14:13');

CREATE TABLE users (id int NOT NULL AUTO_INCREMENT, firstname varchar(255), lastname varchar(255), username text, about text, email varchar(255), password varchar(255) NOT NULL, last_login datetime, status enum('active','inactive') DEFAULT 'active', createdAt datetime NOT NULL, updatedAt datetime NOT NULL, PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 DEFAULT COLLATE=utf8_unicode_ci;
INSERT INTO users (id, firstname, lastname, username, about, email, password, last_login, status, createdAt, updatedAt) VALUES (1, 'Connor', 'Best', null, null, 'connor@gmail.com', '$2a$08$twmqlvZ3OESdN2ZxdSued.894rhVxAhPi/klAiMzuI33HGw16qMDq', null, 'active', '2018-09-01 00:24:16', '2018-09-01 00:24:16');
INSERT INTO users (id, firstname, lastname, username, about, email, password, last_login, status, createdAt, updatedAt) VALUES (2, 'Gabriel', 'Ferrer', null, null, 'labgrie@gmail.com', '$2a$08$oPzkKw/RtPFea9foiKghde4ZOeNIy8uT5hkqK.eDXj0AfJ/OLN3iO', null, 'active', '2018-09-01 00:26:32', '2018-09-01 00:26:32');
INSERT INTO users (id, firstname, lastname, username, about, email, password, last_login, status, createdAt, updatedAt) VALUES (3, 'John', 'Smith', null, null, 'email@email.com', '$2a$08$nhBccniscp6v.9dzd4EKWOkeb2QcpGO87vphmny.IZgCbViu7XRzq', null, 'active', '2018-09-01 02:50:20', '2018-09-01 02:50:20');
INSERT INTO users (id, firstname, lastname, username, about, email, password, last_login, status, createdAt, updatedAt) VALUES (4, 'John', 'Smith', null, null, 'John@email.com', '$2a$08$IU1XbQ0iU.p9k6Yu5QH/1ula3mL1MXexr6lLZHB2zrOM4CYYxjoUy', null, 'active', '2018-09-01 13:39:01', '2018-09-01 13:39:01');
ALTER TABLE `FollowUps` ADD FOREIGN KEY (`CustomerId`) REFERENCES `Customers` (`id`) ON UPDATE CASCADE;
ALTER TABLE `FollowUps` ADD FOREIGN KEY (`FollowupStatusTypeId`) REFERENCES `FollowupStatusTypes` (`id`) ON UPDATE CASCADE;
ALTER TABLE `FollowupActionTypes` ADD FOREIGN KEY (`FollowupStatusTypeId`) REFERENCES `FollowupStatusTypes` (`id`) ON UPDATE CASCADE;


CREATE VIEW `OPEN Followups BY Interested Customers` AS
SELECT
    `FollowUps`.`id`                                           AS `id`,
    concat(`Customers`.`firstname`,' ',`Customers`.`lastname`) AS `fullname`,
    `FollowupStatusTypes`.`name`                               AS `name`,
    `FollowUps`.`action`                                       AS `action`,
    `FollowUps`.`memo`                                         AS `memo`,
    `FollowUps`.`duedate`                                      AS `duedate`,
    `FollowUps`.`open`                                         AS `open`
FROM
    ((`Customers`
JOIN
    `FollowUps`
ON
    ((
            `Customers`.`id` = `FollowUps`.`CustomerId`)))
JOIN
    `FollowupStatusTypes`
ON
    ((
            `FollowUps`.`FollowupStatusTypeId` = `FollowupStatusTypes`.`id`)))
WHERE
    (
        `FollowUps`.`open` = 1);

CREATE VIEW `Followup Status Chart` AS
select
    count(0) AS `y`,
    `FollowupStatusTypes`.`name` AS `label`
from
    (
        `FollowupStatusTypes`
        join `FollowUps` on(
            (
                `FollowupStatusTypes`.`id` = `FollowUps`.`FollowupStatusTypeId`
            )
        )
    )
group by
    `FollowupStatusTypes`.`name`;
    
CREATE VIEW `Followups BY Interested Customers` AS
select
    `FollowUps`.`id` AS `id`,
    concat(
        `Customers`.`firstname`,
        ' ',
        `Customers`.`lastname`
    ) AS `fullname`,
    `FollowupStatusTypes`.`name` AS `name`,
    `FollowUps`.`action` AS `action`,
    `FollowUps`.`memo` AS `memo`,
    `FollowUps`.`duedate` AS `duedate`,
    `FollowUps`.`open` AS `open`
from
    (
        (
            `Customers`
            join `FollowUps` on((`Customers`.`id` = `FollowUps`.`CustomerId`))
        )
        join `FollowupStatusTypes` on(
            (
                `FollowUps`.`FollowupStatusTypeId` = `FollowupStatusTypes`.`id`
            )
        )
    )
where
    (`FollowUps`.`open` = 1);
    
CREATE VIEW customerlist AS
select
    `Customers`.`id` AS `value`,
    concat(
        `Customers`.`firstname`,
        ' ',
        `Customers`.`lastname`
    ) AS `text`
from
    `Customers`
where
    (`Customers`.`interested` = 1);

CREATE OR REPLACE VIEW `All Added Customers` as
SELECT
    Customers.firstname,
    Customers.lastname,
    Customers.address,
    Customers.phone,
    Customers.email
FROM
    Customers
ORDER BY
    Customers.createdAt DESC 