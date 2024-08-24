/* Total Number of Reservations */
SELECT COUNT(Booking_ID) AS Total_Numbe_of_Reservations
FROM hotel_data

/* Most Popular Meal Plan */
SELECT type_of_meal_plan AS Meal_Plan , COUNT(type_of_meal_plan) AS Number_of_Bookings
FROM hotel_data
GROUP BY Meal_plan
ORDER BY Number_of_Bookings DESC
LIMIT 1

/* Average Price per Room for Resevations Involving Children */
SELECT AVG(avg_price_per_room) AS Average_Price_per_Room
FROM hotel_data
WHERE no_of_children != 0

/* Number of Reservations in 2018 */
SELECT COUNT(Booking_ID) AS Number_of_Reservations_for_2018
FROM hotel_data
WHERE arrival_date LIKE '__-__-2018'

/* Most Commonly Booked Room Type */
SELECT DISTINCT room_type_reserved AS Room_Type, COUNT(room_type_reserved) AS Number_of_Reservations
FROM hotel_data
GROUP BY Room_Type
ORDER BY Number_of_Reservations DESC
LIMIT 1

/* No of Weekend Reservations */
SELECT COUNT(Booking_ID) AS No_of_Weekend_Reservations
FROM hotel_data
WHERE no_of_weekend_nights != 0

/* Max and Min Lead Time */
SELECT MAX(lead_time) AS Max_lead_Time, MIN(lead_time) AS Minimum_Lead_Time
FROM hotel_data

/* Most Common Market Segment Type for Resevation */
SELECT market_segment_type AS Market_Segment, COUNT(market_segment_type) AS Number_of_Reservations
FROM hotel_data
GROUP BY Market_Segment
ORDER BY Number_of_Reservations DESC
LIMIT 1

/* No of Reservations with Booking Status "Confirmed" */
SELECT COUNT(Booking_ID) AS Confirmed_Bookings
FROM hotel_data
WHERE booking_status = "Not_Canceled"

/* Total Number of Adults and Children Across all Reservations */
SELECT SUM(no_of_adults) AS Total_number_of_adults, SUM(no_of_children) AS Total_number_of_children
FROM hotel_data

/* Average Number of Weekend Nights for
Reservations Involving Children */
SELECT avg(no_of_weekend_nights) AS Number_of_weekend_nights_including_children
FROM hotel_data
WHERE no_of_children != 0

/* No of Reservations per Month */
/* Updating the arrival_date column to YYYY-DD-MM format */
update hotel_data
set arrival_date =str_to_date(arrival_date, "%d-%m-%Y");
/*  Converting from text to date format */
alter table hotel_data
modify arrival_date date; 

SELECT  
   MONTH (arrival_date) AS Month_Name,  
   COUNT(Booking_ID) AS No_of_Reservations
FROM hotel_data
GROUP BY MONTH (arrival_date)
ORDER BY MONTH (arrival_date)

/* Average Number of Nights Spent for Each Room Type */
SELECT room_type_reserved, AVG(no_of_weekend_nights) AS Average_weekend_nights, 
                           AVG(no_of_week_nights) AS Average_weekday_nights
FROM hotel_data
GROUP BY room_type_reserved

/* Most Common Room Type For Reservation Involving Children and its Average Price */
SELECT room_type_reserved, avg(avg_price_per_room) AS Average_Price
FROM hotel_data
WHERE no_of_children != 0
GROUP BY  room_type_reserved
ORDER BY Average_Price 
LIMIT 1 

/* Market Segment Generating the Highest Average Price per Room */
SELECT market_segment_type, AVG(avg_price_per_room) AS Average_Price
FROM hotel_data
GROUP BY market_segment_type
ORDER BY Average_Price DESC
LIMIT 1
