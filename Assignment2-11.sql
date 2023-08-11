create database ExerciseDb
use ExerciseDb

--create the tables if publisher,category,author,book
create table Publisher(
PID int primary key,
PublisherName nvarchar(50) not null unique
)

create table Category(
CID int primary key,
CategoryName nvarchar(50) not null unique
)

create table Author(
AID int primary key,
AuthorName nvarchar(50) not null unique
)

create table Book1(
BID int primary key,
BName nvarchar(100) not null,
Bprice decimal(10,2),
Author int,
Publisher int,
Category int,
foreign key(Author) references author(AID),
foreign key(Publisher) references Publisher(PID),
foreign key(Category) references Category(CID),
)
---insert 3 record of category author Book

insert into Category (CID,CategoryName ) values(1,'fiction')
insert into Category (CID,CategoryName ) values(2,'non-fiction')
insert into Category (CID,CategoryName ) values(3,'science')

 insert into Author (AID,AuthorName) values(1,' Rudy Van De')
 insert into Author (AID,AuthorName) values(2,' Richard Schreier')
 insert into Author (AID,AuthorName) values(3,'  R. Jacob Baker')

 insert into Book1 values
(1,'.NET Core 3.0',4865.00,811,1221,1),
(2,'C#',2000.70,812,1222,2),
(3,'Head First C#',2200.00,813,1223,3),
(4,'oracle',4700.50,814,1223,2),
(5,'data structure',2900,811,1222,3),
(6,'python',5000,811,1223,3)

SELECT BID, BName, BPrice, AuthorName AS Author, PublisherName AS Publisher, CategoryName AS Category
FROM Book1
INNER JOIN Author ON Book1.Author = Author.AID
INNER JOIN Publisher ON Book1.Publisher = Publisher.PID
INNER JOIN Category ON Book1.Category = Category.CID;
select * from Book1