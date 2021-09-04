create database Nshop;
drop database Nshop;
use Nshop;
CREATE TABLE Accounts(
	Username nvarchar(50) not null primary key,
    Password nvarchar(50) not null,
    Fullname nvarchar(50) not null,
    Email nvarchar(50) not null,
    Photo nvarchar(50) not null
) ENGINE = InnoDB;
select * from Accounts;
drop table Accounts;

CREATE TABLE Authorities(
     Id int not null primary key AUTO_INCREMENT,
     Username nvarchar(50) not null,
     RoleId nvarchar(10) not null
)ENGINE = InnoDB;
drop table Authorities;

CREATE TABLE Categories(
     Id char(4) not null primary key,
     Name nvarchar(50) not null
)ENGINE = InnoDB;
drop table Categories;


CREATE TABLE Products(
     Id int not null primary key auto_increment,
     Name nvarchar(50) not null,
     Image nvarchar(50) not null,
     Price float not null,
     CreateDate date NOT NULL,
     Available bit not null,
     CategoryId char(4) not null
)ENGINE = InnoDB;
drop table Products;

CREATE TABLE Roles(
     Id nvarchar(10) not null primary key,
     Name nvarchar(50) not null
)ENGINE = InnoDB;
drop table Roles;

CREATE TABLE OrderDetails(
	Id bigint NOT NULL PRIMARY KEY auto_increment,
	OrderId bigint NOT NULL,
	ProductId int NOT NULL,
	Price float NOT NULL,
	Quantity int NOT NULL
)ENGINE = InnoDB;
drop table OrderDetails;

CREATE TABLE Orders(
	Id bigint  NOT NULL primary key auto_increment,
	Username nvarchar(50) NOT NULL,
	CreateDate datetime NOT NULL,
	Address nvarchar(100) NOT NULL
)ENGINE = InnoDB;
drop table Orders;

-- insert into Accounts values('htu','123','Nguyễn Hoàng Tú','tunh@gmail.com','a.jpg'),
-- ('nva','123','Nguyễn văn a','anv@gmail.com','b.jpg');

-- insert into Categories values
-- ('1001','Oppo'),
-- ('1002','Vivo'),
-- ('1003','iphone');

-- insert into Products values
-- ('1','Oppo Reno4','reno4.jpg',106.0,true,'1001'),
-- ('2','Oppo Reno5','reno5.jpg',202.0,true,'1001'),
-- ('3','Vivo Y20','vivoy20.jpg',105.0,true,'1002'),
-- ('4','Vivo Y12s','vivo12.jpg',204.0,true,'1002'),
-- ('5','Iphone 12','12.jpg',305.0,false,'1003'),
-- ('6','Iphone 11 Pro max','11pro.jpg',405.0,true,'1003');


-- insert into Authorities values
-- ('101','htu','ADMIN'),
-- ('102','nva','USER');

insert into Roles values
('ADMIN','Admin'),
('PM','Project Manager'),
('USER','User');

INSERT Accounts (Username, Password, Fullname, Email, Photo) VALUES ('tnghia','123','Huynh Trong Nghia','nghia@gmail.com','a.jpg');
INSERT Accounts (Username, Password, Fullname, Email, Photo) VALUES ('htn','123','Nguyễn văn n','nvn@gmail.com','b.jpg');
INSERT Accounts (Username, Password, Fullname, Email, Photo) VALUES ('nth','123','Nguyễn văn h','nvh@gmail.com','b1.jpg');

INSERT Authorities (Id, Username, RoleId) VALUES ('101','tnghia','ADMIN');
INSERT Authorities (Id, Username, RoleId) VALUES ('102','htn','USER');
INSERT Authorities (Id, Username, RoleId) VALUES ('103','nth','PM');


INSERT OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100005, 10249, 1001, 42.4, 40);
INSERT OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100006, 10250, 1002, 7.7, 10);
INSERT OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100007, 10250, 1003, 42.4, 35);
INSERT OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100008, 10250, 1004, 16.8, 15);
INSERT OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100009, 10251, 1005, 16.8, 6);
INSERT OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100010, 10251, 1006, 15.6, 15);
INSERT OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100011, 10251, 1007, 16.8, 20);
INSERT OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100012, 10252, 1008, 64.8, 40);
INSERT OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100013, 10252, 1009, 2, 25);
INSERT OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100014, 10252, 1010, 27.2, 40);

INSERT Categories (Id, Name) VALUES (N'1000', N'Iphone');
INSERT Categories (Id, Name) VALUES (N'1001', N'Ipad');
INSERT Categories (Id, Name) VALUES (N'1002', N'Macbook');
INSERT Categories (Id, Name) VALUES (N'1003', N'apple watch');


INSERT Orders (Id, Username, CreateDate, Address) VALUES (10249, N'tnghia', CAST('2021-09-03 00:00:00'AS DateTime), N'Luisenstr. 48');
INSERT Orders (Id, Username, CreateDate, Address) VALUES (10250, N'htn', CAST('2021-09-03 00:00:00' AS DateTime), N'Rua do Paço, 67');
INSERT Orders (Id, Username, CreateDate, Address) VALUES (10251, N'nth', CAST('2021-09-03 00:00:00' AS DateTime), N'2, rue du Commerce');
INSERT Orders (Id, Username, CreateDate, Address) VALUES (10252, N'nth', CAST('2021-09-03 00:00:00' AS DateTime), N'Boulevard Tirou, 255');
INSERT Orders (Id, Username, CreateDate, Address) VALUES (10253, N'nth', CAST('2021-09-03 00:00:00' AS DateTime), N'Rua do Paço, 67');
INSERT Orders (Id, Username, CreateDate, Address) VALUES (10254, N'nth', CAST('2021-09-03 00:00:00' AS DateTime), N'Hauptstr. 31');
INSERT Orders (Id, Username, CreateDate, Address) VALUES (10255, N'nth', CAST('2021-09-03 00:00:00' AS DateTime), N'Starenweg 5');
INSERT Orders (Id, Username, CreateDate, Address) VALUES (10256, N'nth', CAST('2021-09-03 00:00:00' AS DateTime), N'Rua do Mercado, 12');
INSERT Orders (Id, Username, CreateDate, Address) VALUES (10257, N'nth', CAST('2021-09-03 00:00:00' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35');
INSERT Orders (Id, Username, CreateDate, Address) VALUES (10258, N'htn', CAST('2021-09-03 00:00:00' AS DateTime), N'Kirchgasse 6');

INSERT Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1001, N'Iphone 4', N'1001.jpg', 190, CAST('2021-09-02' AS Date), 0, N'1000');
INSERT Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1002, N'Iphone 6', N'1002.jpg', 19, CAST('2021-09-02' AS Date), 0, N'1000');
INSERT Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1003, N'Iphone 7', N'1003.jpg', 10, CAST('2021-09-02' AS Date), 1, N'1000');
INSERT Products (Id, Name, Image, Price, CreateDate, Available, CategoryId)VALUES (1004, N'Mac book pro', N'1004.jpg', 22, CAST('2021-09-02' AS Date), 1, N'1002');
INSERT Products (Id, Name, Image, Price, CreateDate, Available, CategoryId)VALUES (1005, N'Mac book pro1', N'1005.jpg', 21.35, CAST('2021-09-02' AS Date), 1, N'1002');
INSERT Products (Id, Name, Image, Price, CreateDate, Available, CategoryId)VALUES (1006, N'Iphone 11', N'1006.jpg', 25, CAST('2021-09-02' AS Date), 1, N'1000');
INSERT Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1007, N'Iphone 12', N'1007.jpg', 30, CAST('2021-09-02' AS Date), 1, N'1000');
INSERT Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1008, N'Ipad air', N'1008.jpg', 40, CAST('2021-09-02' AS Date), 1, N'1001');
INSERT Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1009, N'Ipad pro', N'1009.jpg', 97, CAST('2021-09-02' AS Date), 0, N'1001');
INSERT Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1010, N'apple watch', N'1010.jpg', 31, CAST('2021-09-02' AS Date), 0, N'1001');


select * from Categories;
select * from Products;
select * from Roles;
select * from Authorities;
select * from Accounts;


ALTER TABLE Products  ADD  CONSTRAINT FK_CategoryId FOREIGN KEY(CategoryId)
REFERENCES Categories (Id) ON DELETE CASCADE ;

ALTER TABLE Authorities  ADD  CONSTRAINT FK_UserRoles FOREIGN KEY(Username)
REFERENCES Accounts (Username)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE Authorities  ADD  CONSTRAINT FK_Roles FOREIGN KEY(RoleId)
REFERENCES Roles(Id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE OrderDetails  ADD  CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY(OrderId)
REFERENCES Orders(Id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE OrderDetails ADD  CONSTRAINT FK_OrderDetails_Products FOREIGN KEY(ProductId)
REFERENCES Products (Id)
ON UPDATE CASCADE;

ALTER TABLE Orders ADD  CONSTRAINT FK_Orders_Customers FOREIGN KEY(Username)
REFERENCES Accounts (Username)
ON UPDATE CASCADE
ON DELETE CASCADE