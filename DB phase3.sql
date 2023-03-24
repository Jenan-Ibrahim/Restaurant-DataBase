CREATE SCHEMA restaurant;
/**********************************************CREATE TABLE***************************************/
CREATE TABLE Manager(
MID           INT(4) NOT NULL,
MPhone_number INT(10) ,
CONSTRAINT Manager_PK primary key (MID)
);

CREATE TABLE Employee(
EID_number         INT(10) NOT NULL,
Employee_number    INT(10),
Employee_position  VARCHAR(20),
fName              VARCHAR(20),
lName              VARCHAR(20),
City               VARCHAR(30),
Street_address     VARCHAR(20),
MID                INT(4),
Employee_salary    DECIMAL(15,2) ,
Ework_Hours        INT(10) ,
CONSTRAINT Employee_PK PRIMARY KEY (EID_number),
CONSTRAINT Employee_FK FOREIGN KEY (MID) REFERENCES Manager(MID)ON DELETE CASCADE
);

CREATE TABLE Customer(
Customer_num      INT(10) NOT NULL,
City              VARCHAR(30),
Street_address    VARCHAR(20),
CPhone_number   INT(10),         
fName             VARCHAR(20),
lName             VARCHAR(20),
CONSTRAINT Customer_PK primary key (Customer_num)
);

CREATE TABLE Delivery_app(
Delivery_ID             INT(10) NOT NULL,
Payment_state          VARCHAR(20),
CONSTRAINT Delivery_PK primary key (Delivery_ID)
);

CREATE TABLE Orders(
Orders_ID          INT(5) NOT NULL,
Orders_date        VARCHAR(10),
Orders_description VARCHAR(100),
Amount             INT(10) ,
Payment_method     VARCHAR(20),
Delivery_ID         INT(10),
CONSTRAINT Orders_PK primary key (Orders_ID),
CONSTRAINT Orders_FK FOREIGN KEY (Delivery_ID) REFERENCES Delivery_app(Delivery_ID) ON DELETE CASCADE
);

CREATE TABLE Product(
Product_ID       INT(5) NOT NULL,
Product_name     VARCHAR(20),
Product_type     VARCHAR(20),
Product_price    DECIMAL(10,3),
MID              INT(4),
Product_availabe VARCHAR(5),
CONSTRAINT Product_PK primary key(Product_ID),
CONSTRAINT Product_FK FOREIGN KEY (MID) REFERENCES Manager(MID) ON DELETE CASCADE
);

CREATE TABLE Service(
EID_number        INT(20) NOT NULL,
Customer_num      INT(10) NOT NULL,
CONSTRAINT Service_PK primary key(EID_number,Customer_num),
CONSTRAINT Service_FK1 FOREIGN KEY(EID_number) REFERENCES Employee(EID_number)ON DELETE CASCADE,
CONSTRAINT Service_FK2 FOREIGN KEY(Customer_num) REFERENCES  Customer(Customer_num)ON DELETE CASCADE
);

CREATE TABLE Request(
Orders_ID          INT(5) NOT NULL,
Customer_num       INT(10) NOT NULL,
CONSTRAINT  Request_PK primary key (Orders_ID,Customer_num),
CONSTRAINT  Request_FK1 FOREIGN KEY (Orders_ID) REFERENCES Orders(Orders_ID)ON DELETE CASCADE,
CONSTRAINT  Request_FK2 FOREIGN KEY (Customer_num) REFERENCES Customer(Customer_num)ON DELETE CASCADE
);

CREATE TABLE Prepares(
Orders_ID          INT(5) NOT NULL,
EID_number        INT(20) NOT NULL,
CONSTRAINT  Prepares_PK primary key(Orders_ID,EID_number),
CONSTRAINT  Prepares_FK1 FOREIGN KEY (Orders_ID) REFERENCES Orders(Orders_ID)ON DELETE CASCADE,
CONSTRAINT  Prepares_FK2 FOREIGN KEY (EID_number) REFERENCES Employee(EID_number)ON DELETE CASCADE
);

CREATE TABLE Contain(
Orders_ID          INT(5) NOT NULL,
Product_ID       INT(5) NOT NULL,
CONSTRAINT Contain_PK primary key(Orders_ID,Product_ID ),
CONSTRAINT Contain_FK1 FOREIGN KEY (Orders_ID) REFERENCES Orders(Orders_ID)ON DELETE CASCADE,
CONSTRAINT Contain_FK2 FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)ON DELETE CASCADE
);


INSERT INTO Manager
VALUE (1234, 053789462);

INSERT INTO employee
 VALUES (85271711, 0539944778, 'Chef', 'Sultan', 'Omar', 'Makkah', 'Al Aziziyah', 1234, 50000.00, 65),
        (12312745, 0537418594, 'Waiter', 'Said', 'Ali', 'jeddah', 'Al Hamra', 1234, 35000.00, 50),
        (32456091, 0537496183, 'Clean Worker', 'Jameel', 'Saeed', 'Makkah', 'Jabal-Al-Noor', 1234, 25000.00, 22),
        (2056102, 0531496712, 'Chef', 'Osama', 'Fahad', 'Taif', 'Al Khalidiyah', 1234, 51000.00, 30),
		(89748312, 0538476792,'Recepion', 'Ahmad', 'Walid', 'Makkah', 'Al Sharia', 1234, 30000.00, 49),
		(12712755, 053978412, 'Waiter', 'Mohamad', 'Fahad', 'Taif', 'Al Faisaliyah', '1234', 35000.00, 48),
        (10312345, 053789462, 'Waiter', 'Ali', 'hasan', 'jeddah', 'Al Naseem', 1234, 35000.00, '48'),
        (10012345, 053478914, 'Waiter', 'Yaser', 'said', 'Makkah', 'Al Aziziyah', 1234, 35000.00, 34);

INSERT INTO customer
 VALUES (1478925, 'Makkah', 'Al Hamra', 0534898857, 'Alaa', 'Al shehry'),
        (1457928, 'Makkah', 'Al Aziziyah', 0534591783, 'Amer', 'Melebary'),
        (1234789, 'Makkah', 'Al Sharia', 0597841367, 'Ola', 'Kalid'),
        (1478964,'Makkah', 'Jabal-Al-Noor', 0587974613, 'Areej', 'Mohamad'),
		(1234597, 'Makkah', 'Al Sharia', 053147893, 'Sara', 'saeed'),
        (1345689, 'Makkah', 'Al Aziziyah', 053647957, 'nada', 'alfahmi');
        
        
INSERT INTO delivery_app
 VALUES ('1478', 'True'),
		('1120', 'False'),
		('1178', 'True'),
        ('1211', 'True'),
        ('1333', 'True');

        
		
INSERT INTO orders
 VALUES (378, '13/01/2023', 'salad,Orange juice,rice', 3, 'CredieCard', 1120),
        (1247, '15/09/2023', 'Meat,pasta,salad,Orange juice', 4, 'Cash', null),
        (147, '20/01/2023', 'pasta,Apple juice,chicken', 3, 'Cash', 1478),
        (597, '22/05/2023', 'rice,meat,salad,soup meat,pasta', 5, 'CredieCard', 1333),
        (133, '16/09/2023', 'salad,Meat,rice', 3, 'CredieCard',1178),
        (122, '16/09/2023', 'pasta,Apple juice', '2', 'Cash',1211);


INSERT INTO Product
 VALUES (123, 'rice', 'Main Course', 95, 1234, 'True'),
        (147, 'Chicken', 'Main Course', 65, 1234, 'True'),
        (148, 'Meat', 'Main Course', 96, 1234, 'True'),
        (211, 'pasta', 'Main Course', 55, 1234, 'True'),
        (223, 'salad', 'Starters', 30, 1234, 'True'),
        (110, 'soup of chicken', 'Starters', 25, 1234, 'False'),
        (111, 'soup of meat', 'Starters', 27, 1234, 'True'),
        (103, 'Orange Juice', 'Drink', 15, 1234, 'True'),
        (104, 'Apple Juice', 'Drink', 16, 1234, 'True'),
        (105, 'cocktail Juice', 'Drink', 20, 1234, 'False');
        
INSERT INTO service
VALUES (89748312, 1478925),/* order out of restaurant*/
       (10312345, 1457928),
       (89748312, 1478964),/* order out of restaurant*/
	   (89748312, 1234789),/* order out of restaurant*/
       (89748312, 1234597),/* order out of restaurant*/
       (89748312, 1345689);/* order out of restaurant*/
      
       

  INSERT INTO request
  VALUES (378, 1234597),
         (1247, 1345689),
         (147, 1478925),
         (597, 1478964),
         (133,1457928),
         (122,1234789);
 
 INSERT INTO prepares
 VALUES (147, 2056102),
        (378, 85271711),
        (597, 85271711),
        (1247, 2056102),
        (133,2056102),
        (122,85271711);

        
INSERT INTO contain
VALUES (378, 223),
       (378, 103),
       (378, 123),
       (1247, 148),
       (1247, 211),
       (1247, 223),
       (1247, 103),
       (147, 211),
       (147, 104),
       (147, 147),
       (597, 123),
       (597, 148),
       (597, 223),
       (597, 111),
       (597, 211),
       (133,223),
       (133,148),
       (133,123),
       (122,211),
       (122,104);
       
       
 /**************************************************DELETE************************************************/      

DELETE FROM Delivery_app
WHERE Payment_state ='False';

/**************************************************UPDATE************************************************/

UPDATE Product 
SET    Product_price = Product_price + (Product_price * 0.15)
WHERE  Product_availabe='True';

UPDATE 	customer
SET 	customer.city = 'Jeddah', Street_Address = 'Al-Hamra'
WHERE	Customer_num = 1478964;

UPDATE	Employee
SET		Employee_position = 'Chef',  Employee_salary = Employee_salary + 10000
WHERE	EID_number = 12712755;

/*************************************************SELECT*************************************************/
 
 /*1*/
 SELECT *
 FROM Product;
 
 /*2*/
 SELECT *
 FROM orders
 ORDER BY Amount DESC,Payment_method ;
 
 /*3*/
SELECT Delivery_ID
FROM Delivery_app
GROUP BY Delivery_ID,Payment_state
HAVING Payment_state = 'True';

/*4*/	
SELECT d.Delivery_ID,Orders_date,Orders_description,Payment_method,Payment_state
FROM Orders o , Delivery_app d
WHERE o.Delivery_ID = d.Delivery_ID
ORDER BY Orders_date,o.Orders_ID  ASC, Delivery_ID  DESC;

/*5*/
SELECT *
FROM Orders
WHERE Delivery_ID IN (SELECT Delivery_ID
						FROM Delivery_app
						WHERE Payment_state = 'False');
                        
/*6*/					
SELECT Product_ID, Product_price
FROM Product
WHERE Product_price > (SELECT AVG(Product_price) FROM Product);

/*7*/
SELECT e.fName, e.lName, EWork_Hours, p.Orders_ID, Orders_date, Orders_description
FROM Employee e, orders o, Prepares p
WHERE o.Orders_ID=p.Orders_ID AND e.EID_number = p.EID_number
ORDER BY Orders_date ASC; 

/*8*/
SELECT   EID_number, SUM(Employee_salary) AS sum
FROM     Employee
GROUP BY EID_number
HAVING   SUM(Employee_salary)>35000.00;
