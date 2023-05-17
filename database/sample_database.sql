DROP TABLE IF EXISTS Profile_Images;
DROP TABLE IF EXISTS Date_Requests;
DROP TABLE IF EXISTS Profiles_Dispositions;
DROP TABLE IF EXISTS Dispositions;
DROP TABLE IF EXISTS News;
DROP TABLE IF EXISTS Profiles;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Animals;
DROP TABLE IF EXISTS Temp;

CREATE TABLE Profiles(
    profile_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    profile_name VARCHAR(255) NOT NULL,
	profile_type VARCHAR(255) NOT NULL,
	profile_breed VARCHAR(255) NOT NULL,
	profile_availability VARCHAR(255) NOT NULL,
	profile_news VARCHAR(255) NOT NULL,
	profile_description VARCHAR(255) NOT NULL,
    profile_created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB;

INSERT INTO Profiles(profile_name, profile_type, profile_breed, profile_availability, profile_news, profile_description, profile_created_at) 
VALUES 
    ("Layla", "Cat", "Siamese", "Available", "She just arrived at the shelter!", "Small size, long tail, white with brown paws", "2022-10-26 13:23:44"),
    ("March", "Dog", "Golden Retriever", "Available", "Newly Available for adoption!","Large size, light golden fur", "2022-10-24 13:23:44"),
    ("Ram", "Other", "Goat", "Available", "He likes to sleep", "Small size, white goat", "2022-10-11 13:23:44"),
	("Luna", "Cat", "Persian", "Pending", "Just adopted!", "Small size, long tail, orange with black spots", "2022-03-11 13:23:44"),
	("Hammie", "Other", "Hamster", "Available", "He likes to stash food", "Small size, long haired, brown fur", "2021-09-11 13:23:44"),
	("Buster", "Dog", "German Shepherd", "Not available", "Just adopted!", "Big size, tan fur", "2022-10-22 13:23:44"),
	("Benji", "Dog", "Pomeranian", "Available", "Still available for adoption! He's a sweetheart", "Small size, black and white fur", "2021-11-11 13:23:44")
;

CREATE TABLE Dispositions (
    disposition_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    disposition_value VARCHAR(255) NOT NULL
) ENGINE = InnoDB;

INSERT INTO Dispositions(disposition_value) 
VALUES
    ("Good with animals"),
    ("Good with children"),
    ("Animal must be leashed at all times")
;

CREATE TABLE Profiles_Dispositions (
    profile_disposition_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    profile_id INT,
    disposition_id INT,
    FOREIGN KEY (profile_id) REFERENCES Profiles(profile_id),
    FOREIGN KEY (disposition_id) REFERENCES Dispositions(disposition_id)
) ENGINE = InnoDB;

INSERT INTO Profiles_Dispositions(profile_id, disposition_id) 
VALUES
    (1,1),
    (2,1),
    (3,1),
    (4,2),
    (4,3),
    (5,3),
    (6,2),
    (7,2)
;

CREATE TABLE Users (
    user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_fname VARCHAR(255) NOT NULL,
	user_lname VARCHAR(255) NOT NULL,
	user_email VARCHAR(255) NOT NULL,
    user_password VARCHAR(255) NOT NULL,
	user_is_admin TINYINT NOT NULL,
    user_email_preference TINYINT NOT NULL DEFAULT '1'
) ENGINE = InnoDB;

INSERT INTO Users(user_fname, user_lname, user_email, user_password, user_is_admin, user_email_preference)
VALUES 
    ("Martha", "Smith", "martha.smith@email.com", SHA1("password1"), 1, 0),
    ("Peter", "Williams", "peter.williams@email.com", SHA1("password2"), 0, 0),
    ("Mark", "Brown", "mark.brown@email.com", SHA1("password3"), 1, 0),
    ("Susan", "Davis", "susan.davis@email.com", SHA1("password4"), 1, 0),
    ("Joe", "Garcia", "joe.garcia@email.com", SHA1("password5"), 0, 0),
    ("Mary", "Jones", "mary.jones@email.com", SHA1("password6"), 0, 0),
    ("David", "Miller", "david.miller@email.com", SHA1("password7"), 1, 1)
;

CREATE TABLE Animals (
	animal_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    animal_category VARCHAR(255) NOT NULL,
    animal_breed VARCHAR(255) NOT NULL
) ENGINE = InnoDB;

INSERT INTO Animals(animal_category, animal_breed)
VALUES
	("Dog", "Labrador Retriever"),
    ("Dog", "German Shepherd"),
    ("Dog", "Golden Retriever"),
    ("Dog", "French Bulldog"),
    ("Dog", "Bulldog"),
    ("Dog", "Beagle"),
    ("Dog", "Poodle"),
    ("Dog", "Pomeranian"),
    ("Dog", "Rottweiler"),
    ("Dog", "Yorkshire Terrier"),
    ("Dog", "German Shorthaired Pointer"),
    ("Dog", "Other"),
    ("Cat", "Siamese"),
    ("Cat", "Persian"),
    ("Cat", "Maine Coon"),
    ("Cat", "Ragdoll"),
    ("Cat", "Bengal"),
    ("Cat", "Abyssinian"),
    ("Cat", "Birman"),
    ("Cat", "American Shorthair"),
    ("Cat", "Sphynx"),
    ("Cat", "Himalayan"),
    ("Cat", "Other"),
    ("Other", "Hamster"),
    ("Other", "Rabbit"),
    ("Other", "Turtle"),
    ("Other", "Guinea Pig"),
    ("Other", "Goat"),
    ("Other", "Ferret"),
    ("Other", "Parrot"),
    ("Other", "Other");

CREATE TABLE News (
	news_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    profile_id INT NOT NULL,
    news_description VARCHAR(255) NOT NULL,
    news_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (profile_id) REFERENCES Profiles(profile_id)
) ENGINE = InnoDB;

INSERT INTO News(profile_id, news_description, news_date)
VALUES
	(1, "She just arrived at the shelter!", "2022-10-26 13:23:44"),
    (2, "Newly Available for adoption!", "2022-10-24 13:23:44"),
    (3, "He likes to sleep", "2022-10-11 13:23:44"),
    (4, "Just adopted!", "2022-03-11 13:23:44"),
    (5, "He likes to stash food", "2021-09-11 13:23:44"),
    (6, "Just adopted!", "2022-10-22 13:23:44"),
    (7, "Still available for adoption! He's a sweetheart", "2021-11-11 13:23:44");

CREATE TABLE Date_Requests (
	date_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    profile_id INT NOT NULL,
	user_email VARCHAR(255) NOT NULL,
    request_created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (profile_id) REFERENCES Profiles(profile_id)
) ENGINE = InnoDB;

CREATE TABLE Profile_Images (
    image_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    profile_id INT NOT NULL,
    image_path VARCHAR(255) NOT NULL,
    FOREIGN KEY (profile_id) REFERENCES Profiles(profile_id)
) ENGINE = InnoDB;

INSERT INTO Profile_Images(profile_id, image_path)
VALUES
	(1, "siamese.jpg"),
    (1, "siamese2.jpg"),
    (1, "siamese3.jpg"),
    (2, "golden.jpg"),
    (2, "golden2.jpg"),
    (2, "golden3.jpg"),
    (3, "goat.jpg"),
    (3, "goat2.jpg"),
    (3, "goat3.jpg"),
    (4, "persian.jpg"),
    (4, "persian2.jpg"),
    (4, "persian3.jpg"),
    (5, "hamster.jpg"),
    (5, "hamster2.jpg"),
    (5, "hamster3.jpg"),
    (6, "gsd.jpg"),
    (6, "gsd2.jpg"),
    (6, "gsd3.jpg"),
    (7, "pom.jpg"),
    (7, "pom2.jpg"),
    (7, "pom3.jpg");
