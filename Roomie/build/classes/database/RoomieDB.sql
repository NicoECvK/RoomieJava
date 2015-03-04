USE c_cs108_ashwinsr;

DROP TABLE IF EXISTS House;
DROP TABLE IF EXISTS Comment;
DROP TABLE IF EXISTS Rating;
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Preference;


CREATE TABLE House (
houseName VARCHAR(64),
houseType VARCHAR(64),
location VARCHAR(64),
tier VARCHAR(64),
imageFileName VARCHAR(64),
text TEXT
);

INSERT INTO House VALUES
--("Jerry", "Self-Op", "Lake", 1),
("Durand", "Self-Op", "Upper Row", 1, "Durand.jpg", "Durand is cool"),
("717", "Self-Op", "Upper Row", 1, "717.jpg", "717 is cool"),
("Kairos", "Self-Op", "Upper Row", 1, "Kairos.jpg", , "Kairos is cool");


CREATE TABLE Comment (
username VARCHAR(64),
houseName VARCHAR(64),
text TEXT,
creationTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO House (username, houseName, text )VALUES
("Nico", "Jerry", "Great view"),
("Anna", "Durand", "Best food on campus"),
("Ling Tong", "Durand", "We have no money");


CREATE TABLE Rating (
username VARCHAR(64),
houseName VARCHAR(64),
rating INT
);

INSERT INTO Rating VALUES
("Nico", "Jerry", 1),
("Anna", "Durand", 1),
("Ling Tong", "Durand", 3),
("Nico", "Durand", 2),
("Anna", "Jerry", 3);


CREATE TABLE User (
username VARCHAR(64),
);


CREATE TABLE Preference (
username VARCHAR(64),
houseName VARCHAR(64),
rank INT
);

INSERT INTO Preference VALUES
("Nico", "Jerry", 1),
("Anna", "Durand", 1),
("Ling Tong", "Durand", 3),
("Nico", "Durand", 2),
("Anna", "Jerry", 3);

