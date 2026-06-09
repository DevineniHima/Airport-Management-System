
 -- Create Database
DROP DATABASE IF EXISTS AirportManagement;
CREATE DATABASE AirportManagement;
USE AirportManagement;

-- =========================
-- AIRPORT Table
-- =========================
CREATE TABLE AIRPORT(
    AID INT PRIMARY KEY AUTO_INCREMENT,
    NO_OF_TERMINALS INT,
    AIRPORT_NAME VARCHAR(50) NOT NULL,
    CITY VARCHAR(30),
    AREA VARCHAR(30),
    ACOUNTRY VARCHAR(30),
    TIMEZONE VARCHAR(10)
);

-- =========================
-- PAYMENT Table
-- =========================
CREATE TABLE PAYMENT(
    PAYID INT PRIMARY KEY AUTO_INCREMENT,
    PAYDATE DATE,
    PAYABLE_AMOUNT DECIMAL(10,2) NOT NULL,
    PAY_METHOD VARCHAR(30),
    PAYMENT_STATUS VARCHAR(20)
);

-- =========================
-- PASSENGER Table
-- =========================
CREATE TABLE PASSENGER(
    PID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(50) NOT NULL,
    PHONE VARCHAR(15) NOT NULL UNIQUE,
    EMAIL VARCHAR(50),
    DOB DATE,
    AGE INT,
    PASSPORTNO VARCHAR(15) NOT NULL UNIQUE,
    ADDRESS VARCHAR(50),
    NATIONALITY VARCHAR(20)
);

-- =========================
-- AIRLINE Table
-- =========================
CREATE TABLE AIRLINE(
    AIRLINEID INT PRIMARY KEY AUTO_INCREMENT,
    AIRLINENAME VARCHAR(50) NOT NULL UNIQUE,
    HELPLINENO VARCHAR(20) NOT NULL,
    COUNTRY VARCHAR(30),
    ACODE VARCHAR(10) NOT NULL
);

-- =========================
-- BOOKING Table
-- =========================
CREATE TABLE BOOKING(
    BID INT PRIMARY KEY AUTO_INCREMENT,
    BDATE DATE,
    BSTATUS VARCHAR(15),
    AMOUNT DECIMAL(10,2) NOT NULL,
    PAYMENTSTATUS VARCHAR(20),
    PID INT,
    PAYID INT,
    NO_OF_SEATS INT NOT NULL,
    FOREIGN KEY(PID) REFERENCES PASSENGER(PID),
    FOREIGN KEY(PAYID) REFERENCES PAYMENT(PAYID)
);

-- =========================
-- FLIGHT Table
-- =========================
CREATE TABLE FLIGHT(
    FID INT PRIMARY KEY AUTO_INCREMENT,
    FNO VARCHAR(20) NOT NULL,
    DEPARTURE VARCHAR(30) NOT NULL,
    ARRIVAL DATETIME NOT NULL,
    STATUS VARCHAR(15),
    AIRLINEID INT,
    FOREIGN KEY(AIRLINEID) REFERENCES AIRLINE(AIRLINEID)
);

-- =========================
-- TICKET Table
-- =========================
CREATE TABLE TICKET(
    TICKET_ID INT PRIMARY KEY AUTO_INCREMENT,
    SEAT_NO VARCHAR(10) NOT NULL,
    CLASS VARCHAR(20),
    BID INT,
    FID INT,
    AID INT,
    AIRLINEID INT,
    PID INT,
    DEPARTING_FROM VARCHAR(30) NOT NULL,
    ARRIVING_AT VARCHAR(30) NOT NULL,
    FOREIGN KEY(BID) REFERENCES BOOKING(BID),
    FOREIGN KEY(FID) REFERENCES FLIGHT(FID),
    FOREIGN KEY(AID) REFERENCES AIRPORT(AID),
    FOREIGN KEY(AIRLINEID) REFERENCES AIRLINE(AIRLINEID),
    FOREIGN KEY(PID) REFERENCES PASSENGER(PID)
);

-- =========================
-- USERS Table
-- =========================
CREATE TABLE USERS (
    username VARCHAR(50) PRIMARY KEY,
    pwd VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL
);

-- =========================
-- SAMPLE DATA
-- =========================

-- Airports
INSERT INTO AIRPORT (NO_OF_TERMINALS, AIRPORT_NAME, CITY, AREA, ACOUNTRY, TIMEZONE) VALUES
(4, 'Kempegowda Intl', 'Bangalore', 'Devanahalli', 'India', 'IST'),
(3, 'Mangalore Intl', 'Mangalore', 'Bajpe', 'India', 'IST'),
(2, 'Hubli Airport', 'Hubli', 'Gokul Rd', 'India', 'IST'),
(4, 'Chhatrapati Shivaji', 'Mumbai', 'Andheri', 'India', 'IST'),
(3, 'Indira Gandhi', 'Delhi', 'Palam', 'India', 'IST'),
(2, 'Netaji Subhas', 'Kolkata', 'Dum Dum', 'India', 'IST'),
(3, 'Chennai Intl', 'Chennai', 'Meenambakkam', 'India', 'IST'),
(2, 'Goa Intl', 'Goa', 'Dabolim', 'India', 'IST');

-- Payment
INSERT INTO PAYMENT (PAYDATE, PAYABLE_AMOUNT, PAY_METHOD, PAYMENT_STATUS) VALUES
('2025-02-20', 1500.50, 'Credit Card', 'Completed'),
('2025-02-21', 2300.75, 'Debit Card', 'Pending'),
('2025-02-22', 1200.00, 'Net Banking', 'Completed'),
('2025-02-23', 800.20, 'UPI', 'Failed'),
('2025-02-24', 5400.90, 'Credit Card', 'Completed'),
('2025-02-25', 3200.30, 'Debit Card', 'Pending'),
('2025-02-26', 2150.45, 'Net Banking', 'Completed'),
('2025-02-27', 765.60, 'UPI', 'Completed');

-- Passenger
INSERT INTO PASSENGER (NAME, PHONE, EMAIL, DOB, AGE, PASSPORTNO, ADDRESS, NATIONALITY) VALUES
('Rajesh Kumar', '9876543210', 'rajesh.kumr@gml.com', '1990-01-15', 34, 'A12345678', 'Bangalore', 'Indian'),
('Priya Sharma', '9876543211', 'priya.sharm@yhoo.com', '1985-03-25', 39, 'A23456789', 'Mumbai', 'Indian'),
('Anil Patel', '9876543212', 'anil.patel@otlk.com', '1978-07-14', 45, 'A34567890', 'Ahmedabad', 'Indian'),
('Neha Rao', '9876543213', 'neha.rao@gml.com', '1995-11-30', 28, 'A45678901', 'Hyderabad', 'Indian'),
('Sunil Menon', '9876543214', 'sunil.meno@yhoo.com', '1988-04-10', 36, 'A56789012', 'Kochi', 'Indian'),
('Venugopal Iyer', '9876543215', 'meena.iyer@otlk.com', '1993-12-01', 30, 'A67890123', 'Chennai', 'Indian'),
('Vikram Singh', '9876543216', 'vikram.sing@gml.com', '1982-08-21', 41, 'A78901234', 'Delhi', 'Indian'),
('Aarti Desai', '9876543217', 'aarti.desy@yhoo.com', '1999-02-05', 25, 'A89012345', 'Pune', 'Indian');

-- Airlines
INSERT INTO AIRLINE (AIRLINENAME, HELPLINENO, COUNTRY, ACODE) VALUES
('Air India', '1234567890', 'India', 'AI'),
('IndiGo', '1234567891', 'India', '6E'),
('SpiceJet', '1234567892', 'India', 'SG'),
('Vistara', '1234567893', 'India', 'UK'),
('GoAir', '1234567894', 'India', 'G8'),
('AirAsia', '1234567895', 'India', 'I5'),
('Jet Airways', '1234567896', 'India', '9W'),
('Alliance Air', '1234567897', 'India', '9I');

-- Bookings
INSERT INTO BOOKING (BDATE, BSTATUS, AMOUNT, PAYMENTSTATUS, PID, PAYID, NO_OF_SEATS) VALUES
('2025-02-20', 'Confirmed', 1500.50, 'Completed', 1, 1, 1),
('2025-02-21', 'Pending', 2300.75, 'Pending', 2, 2, 2),
('2025-02-22', 'Confirmed', 1200.00, 'Completed', 3, 3, 1),
('2025-02-23', 'Cancelled', 800.20, 'Failed', 4, 4, 1),
('2025-02-24', 'Confirmed', 5400.90, 'Completed', 5, 5, 3),
('2025-02-25', 'Pending', 3200.30, 'Pending', 6, 6, 2),
('2025-02-26', 'Confirmed', 2150.45, 'Completed', 7, 7, 1),
('2025-02-27', 'Confirmed', 765.60, 'Completed', 8, 8, 1);

-- Flights
INSERT INTO FLIGHT (FNO, DEPARTURE, ARRIVAL, STATUS, AIRLINEID) VALUES
('101', 'Bangalore', '2024-07-20 08:00:00', 'On Time', 1),
('102', 'Mumbai', '2024-07-21 09:30:00', 'Delayed', 2),
('103', 'Delhi', '2024-07-22 10:45:00', 'On Time', 3),
('104', 'Kolkata', '2024-07-23 12:00:00', 'Cancelled', 4),
('105', 'Chennai', '2024-07-24 14:15:00', 'On Time', 5),
('106', 'Goa', '2024-07-25 16:30:00', 'Delayed', 6),
('107', 'Hyderabad', '2024-07-26 18:00:00', 'On Time', 7),
('108', 'Pune', '2024-07-27 20:00:00', 'On Time', 8);

-- Tickets
INSERT INTO TICKET (SEAT_NO, CLASS, BID, FID, AID, AIRLINEID, PID, DEPARTING_FROM, ARRIVING_AT) VALUES
('A1', 'Economy', 1, 1, 1, 1, 1, 'Bangalore', 'Delhi'),
('B1', 'Business', 2, 2, 4, 2, 2, 'Mumbai', 'Bangalore'),
('C1', 'Economy', 3, 3, 5, 3, 3, 'Delhi', 'Mumbai'),
('D1', 'First', 4, 4, 6, 4, 4, 'Kolkata', 'Chennai'),
('E1', 'Economy', 5, 5, 7, 5, 5, 'Chennai', 'Kolkata'),
('F1', 'Business', 6, 6, 8, 6, 6, 'Goa', 'Hyderabad'),
('G1', 'Economy', 7, 7, 2, 7, 7, 'Hyderabad', 'Goa'),
('H1', 'First', 8, 8, 3, 8, 8, 'Pune', 'Delhi');

-- Users
INSERT INTO USERS (username, pwd, role) VALUES
('admin', 'admin123', 'admin'),
('staff', 'staff123', 'staff'),
('user', 'user123', 'passenger');

-- =========================
-- CHECK DATA
-- =========================
SELECT * FROM AIRPORT;
SELECT * FROM PAYMENT;
SELECT * FROM PASSENGER;
SELECT * FROM AIRLINE;
SELECT * FROM BOOKING;
SELECT * FROM FLIGHT;
SELECT * FROM TICKET;
SELECT * FROM USERS;
 
