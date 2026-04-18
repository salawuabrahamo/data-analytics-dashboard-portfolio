--Creating CapstoneProject Database
CREATE DATABASE CapstoneProject;

/* Switching into the CapstoneProject Database */
USE CapstoneProject

--Creating Tables
CREATE TABLE PropertyDetails(
Property_ID INT PRIMARY KEY,
City VARCHAR(50),
Property_Type VARCHAR(50),
Bedrooms INT,
Bathrooms INT,
Size_sqm DECIMAL (6,2),
Price_Naira DECIMAL (12,2),
Listing_Type VARCHAR (20),
Amenities VARCHAR (255),
Year_Listed INT,
column11 VARCHAR(50),
column12 VARCHAR(50),
column13 VARCHAR(50),
column14 VARCHAR(50)
)

CREATE TABLE PropertyAmenities(
Property_ID INT PRIMARY KEY,
City VARCHAR(100),
Property_Type VARCHAR(100),
Bedrooms INT,
Bathrooms INT,
Size_sqm DECIMAL (6,2),
Price_Naira DECIMAL (12,2),
Listing_Type VARCHAR (20),
Amenities VARCHAR (255),
Year_Listed INT,
Amenity_1 VARCHAR (50),
Amenity_2 VARCHAR (50),
Amenity_3 VARCHAR (50),
Amenity_4 VARCHAR (50),
Amenity_5 VARCHAR (50),
Gated_Estate VARCHAR(50),
Security VARCHAR(50),
Electricity VARCHAR(50),
Furnished VARCHAR(50),
Parking_Space VARCHAR(50),
Water_Supply VARCHAR(50),
Borehole VARCHAR(50)
)

CREATE TABLE PropertyUtilities(
PropertyID INT PRIMARY KEY,
City VARCHAR(50),
Property_Type VARCHAR(50),
Bedrooms INT,
Bathrooms INT,
Size_sqm DECIMAL(12,2),
Price_EGP DECIMAL(12,2),
Listing_Type VARCHAR(20),
Amenities VARCHAR(255),
Year_Listed INT,
Gated_Estate VARCHAR(50),
Security VARCHAR(50),
Electricity VARCHAR(50),
Furnished VARCHAR(50),
Parking_Space VARCHAR(50),
Water_Supply VARCHAR(50),
Borehole VARCHAR(50)
)

CREATE TABLE PropertyStatus(
Property_ID INT PRIMARY KEY,
City VARCHAR(50),
Property_Type VARCHAR(50),
Bedrooms INT,
Bathrooms INT,
Size_sqm DECIMAL(6,2),
Price_Naira DECIMAL(12,2),
Listing_Type VARCHAR(20),
Amenities VARCHAR(255),
Year_Listed INT,
Amenity VARCHAR(50),
Availability VARCHAR(50),
Amenities_Grouped VARCHAR(50)
)

--INSERT DATA INTO TABLES
INSERT INTO PropertyDetails
SELECT Property_ID,City,Property_Type,Bedrooms,Bathrooms,Size_sqm,Price_Naira,Listing_Type,Amenities,Year_Listed,Column11,Column12,Column13,Column14
FROM[dbo].[PropertyDetails]

INSERT INTO PropertyAmenities
SELECT Property_ID,City,Property_Type,Bedrooms,Bathrooms,Size_sqm,Price_Naira,Listing_Type,Amenities,Year_Listed,Amenity_1,Amenity_2,Amenity_3,Amenity_4,Amenity_5,Gated_Estate,Security,Electricity,Furnished,Parking_Space,Water_Supply,Borehole
FROM[dbo].[PropertyAmenities]

INSERT INTO PropertyUtilities
SELECT Property_ID,City,Property_Type,Bedrooms,Bathrooms,Size_sqm,Price_Naira,Listing_Type,Amenities,Year_Listed,Gated_Estate,Security,Electricity,Furnished,Parking_Space,Water_Supply,Borehole
FROM[dbo].[PropertyUtilities]

INSERT INTO PropertyStatus
SELECT Property_ID,City,Property_Type,Bedrooms,Bathrooms,Size_sqm,Price_Naira,Listing_Type,Amenities,Year_Listed,Amenity,Availability,Amenities_Grouped
FROM[dbo].[PropertyStatus]

SELECT * FROM PropertyDetails

SELECT City,AVG(Price_Naira) AS Average_Price
FROM PropertyDetails
GROUP BY City

SELECT City,Property_Type,COUNT(*)AS Property_Type
FROM PropertyAmenities
GROUP BY City, Property_Type
ORDER BY City DESC;

SELECT Year_Listed, COUNT(*) AS Trends_Over_Time
FROM PropertyUtilities
GROUP BY Year_Listed
ORDER BY Year_Listed ASC;

SELECT TOP 10 
Property_ID,City,Property_Type,Bedrooms,Bathrooms,Size_sqm,Price_Naira,Listing_Type,Amenities,Year_Listed,Amenity,Availability,Amenities_Grouped
FROM PropertyStatus
ORDER BY Price_Naira DESC;
