CREATE DATABASE DoAnCuoiKi;

USE DoAnCuoiKi;

CREATE TABLE Member(
	id int NOT NULL AUTO_INCREMENT,
    Firstname varchar(50) NULL,
    Lastname varchar(50) NULL,
    Username varchar(50) NOT NULL,
    Password varchar(50) NOT NULL,
    Phone varchar(10) NULL,
    Email varchar(50) NOT NULL,
    Description varchar(50) NULL,
    CreatedDate TIMESTAMP DEFAULT NOW(),
    UpdateTime TIMESTAMP NULL,
    PRIMARY KEY(id),
    UNIQUE (Username),
    UNIQUE (Email)
);

CREATE TABLE Content(
	id int NOT NULL AUTO_INCREMENT,
    Title varchar(50),
    Brief longtext null,
    Content longtext NULL,
    CreatedDate TIMESTAMP DEFAULT NOW(),
    UpdateTime TIMESTAMP,
    Sort int null,
    AuthorId int, 
    primary key(id),
    foreign key(AuthorID) references Member(id) ON DELETE cascade
);

SHOW DATABASES;

SELECT * FROM Member;
SELECT * FROM Content;
DELETE FROM Member;

DROP TABLE Member;
DROP TABLE Content;

SELECT * FROM Member WHERE id = 1;
SELECT * from Content WHERE AuthorID = '1';

INSERT INTO Member(Username, Password, Email) VALUES('test', '12062001', 'test@email.com');
INSERT INTO Member(Username, Password, Email) VALUES('test1', '12062001', 'test1@email.com');
DELETE FROM Content;
SELECT * FROM Member WHERE Email = 'test@email.com' AND Password = 'test';

INSERT INTO Content(Title, Brief, Content, AuthorID) VALUES('abcabcabcabcabcabcabcabc', 'defabcabcabcabcabcabcabcabcabcabcabcabcabcabc', 'ghjabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabc', 1);
INSERT INTO Content(Title, Brief, Content, AuthorID) VALUES('abcabcabcabcabcabcabcabc', 'defabcabcabcabcabcabcabcabcabcabcabcabcabcabc', 'ghjabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabc', 1);
INSERT INTO Content(Title, Brief, Content, AuthorID) VALUES('xyzmnhkjjjkjlhlghkhjiuopyp', 'defabcabcabcabcabcabcabcabcabcabcabcabcabcabc', 'ghjabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabc', 1);
INSERT INTO Content(Title, Brief, Content, AuthorID) VALUES('abcdaommmmmmmmmm', 'defabcabcabcabcabcabcabcabcabcabcabcabcabcabc', 'ghjabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabc', 1);
INSERT INTO Content(Title, Brief, Content, AuthorID) VALUES('mmmmmmmmmmmmmmmmmmmm', 'defabcabcabcabcabcabcabcabcabcabcabcabcabcabc', 'ghjabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabc', 1);
INSERT INTO Content(Title, Brief, Content, AuthorID) VALUES('nnnnnnnnnnnnnnnnnnn', 'defabcabcabcabcabcabcabcabcabcabcabcabcabcabc', 'ghjabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabc', 1);


SELECT DATE_FORMAT(CreatedDate, '%d/%m/%Y %H:%i') as CreatedDate FROM Content;

SELECT id, Title, Brief, DATE_FORMAT(CreatedDate, '%d/%m/%Y %H:%i') as CreatedDate from Content;

SELECT Firstname, Lastname, Email, Phone, Description FROM Member;

DELETE FROM Content WHERE id = 14;

SELECT COUNT(*) FROM Content WHERE Title like '%abc%';