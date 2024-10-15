use AssignMent

create table Customer(
   CustomerID int primary key,
   Name varchar(100),
   Email varchar(200),
   phone varchar (20),
   IDcard varchar (20)
)

create table Room(
    RoomID int primary key,
	RoomNumber varchar(10),
	RoomType varchar (50),
	Price decimal (10,2),
	Status varchar(20)
)

create table booking(
     BookingID int primary key,
	 CustomerID int,
	 RoomID int,
	 CheckInDate date,
	 CheckOutDate date,
	 TotalAmount decimal(10,2),
	 foreign key (CustomerID) references Customer(CustomerID),
     foreign key (RoomID) references Room(RoomID) 
)

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50), 
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);

create table Service(
   ServiceID int primary key,
   ServiceName varchar(100),
   Price decimal(10,2)
)

create table Booking_Service(
   BookingServiceID int primary key,
   BookingID int ,
   ServiceID int,
   Quantity int,
   foreign key (BookingID) references Booking(BookingID),
   foreign key (ServiceID) references Service (ServiceID)
)

insert into Customer(CustomerID, Name, Email, Phone, IDcard) 
values (1, 'nguyễn văn A', 'a.nguyen@gmail.com', '0902020455','123456789'),
(2, 'Le Thi B', 'b.le@gmail.com', '0902345678', '987654321');


INSERT INTO Room (RoomID, RoomNumber, RoomType, Price, Status) VALUES 
(1, '101', 'Standard', 500.00, 'Available'),
(2, '102', 'Deluxe', 800.00, 'Available'),
(3, '201', 'Suite', 1500.00, 'Occupied');

INSERT INTO Booking (BookingID, CustomerID, RoomID, CheckInDate, CheckOutDate, TotalAmount) VALUES 
(1, 1, 1, '2024-10-14', '2024-10-16', 1000.00),
(2, 2, 2, '2024-10-15', '2024-10-17', 1600.00);

INSERT INTO Payment (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod) VALUES 
(1, 1, '2024-10-14', 1000.00, 'Credit Card'),
(2, 2, '2024-10-15', 1600.00, 'Cash');


INSERT INTO Service (ServiceID, ServiceName, Price) VALUES 
(1, 'Room Cleaning', 50.00),
(2, 'Laundry', 30.00),
(3, 'Breakfast', 100.00);

INSERT INTO Booking_Service (BookingServiceID, BookingID, ServiceID, Quantity) 
VALUES (1, 1, 3, 2), 
       (2, 2, 1, 1);
