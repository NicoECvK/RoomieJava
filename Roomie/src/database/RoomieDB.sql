USE c_cs108_cserepy;

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
("680", "Self-Op", "Upper Row", 1, "Durand.jpg", "680 is cool"),
("717", "Self-Op", "Upper Row", 1, "717.jpg", "717 is cool"),
("Columbae", "Self-Op", "Upper Row", 1, "717.jpg", "Columbae is cool"),
("Durand", "Self-Op", "Upper Row", 1, "Durand.jpg", "Durand is cool"),
("Enchanted Brccoli Forest (EBF)", "Co-Op", "Upper Row", 1, "717.jpg", "EBF is cool"),
("Grove", "Self-Op", "Upper Row", 1, "717.jpg", "Grove is cool"),
("Hammarskjold", "Co-Op", "Upper Row", 1, "717.jpg", "Ham is cool"),
("Haus Mitteleuropa", "Self-Op", "Upper Row", 1, "717.jpg", "Haus Mit is cool"),
("Jerry", "Self-Op", "Upper Row", 1, "717.jpg", "Jerry is cool"),
("Kairos", "Self-Op", "Upper Row", 1, "Kairos.jpg" , "Kairos is cool"),
("La Casa Italiana (Casa)", "Self-Op", "Upper Row", 1, "717.jpg", "Casa is cool"),
("La Maison Française (French House)", "Self-Op", "Upper Row", 1, "717.jpg", "French House is cool"),
("Mars", "Self-Op", "Lower Row", 1, "717.jpg", "Mars is cool"),
("Muwekma-Tah-Ruk", "Self-Op", "Upper Row", 1, "717.jpg", "Muwekma is cool"),
("Narnia", "Self-Op", "Lake House", 1, "717.jpg", "Narnia is cool"),
("Phi Sig", "Self-Op", "Campus Drive", 1, "717.jpg", "Phi Sig is cool"),
("Robert S. Moore (BOB)", "Self-Op", "Lower Row", 1, "717.jpg", "BOB is cool"),
("Roth", "Self-Op", "Upper Row", 1, "717.jpg", "Roth is cool"),
("Slavianskii Dom (Slav)", "Self-Op", "Upper Row", 1, "717.jpg", "Slav is cool"),
("Storey", "Self-Op", "Lower Row", 1, "717.jpg", "Storey is cool"),
("Synergy", "Co-Op", "On the hill by Upper Row", 1, "717.jpg", "Synergy is cool"),
("Xanadu", "Self-Op", "Lower Row", 1, "717.jpg", "Xanadu is cool");


CREATE TABLE Comment (
username VARCHAR(64),
houseName VARCHAR(64),
comment TEXT,
creationTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Comment (username, houseName, comment)VALUES
("Nico", "Jerry", "Great view"),
("Anna", "Durand", "Best food on campus"),
("Ling Tong", "Durand", "We have no money");


-- People can rate food, location and housing quality
CREATE TABLE Rating (
username VARCHAR(64),
houseName VARCHAR(64),
ratingType VARCHAR(64),
rating INT
);

INSERT INTO Rating VALUES
("Nico", "Jerry", "food", 1),
("Anna", "Durand", "location", 1),
("Ling Tong", "Durand", "housingQuality", 3),
("Nico", "Durand", "food", 2),
("Anna", "Jerry", "location", 3);


CREATE TABLE User (
username VARCHAR(64)
);

INSERT INTO User VALUES
("Nico"),
("Anna");


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

