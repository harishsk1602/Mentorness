-- Step 1: Create a new schema named 'hotel_reservation'
CREATE DATABASE hotel_reservation;

-- Step 2: Use the newly created schema
USE hotel_reservation;

/* Note: The table 'hotel reservation dataset' has been created and the data imported using the Table Data Import Wizard in MySQL Workbench.

The wizard steps are:
	1. Select the schema: hotel_reservation
	2. Specify the path to the CSV file: 'Hotel Reservation Dataset.csv'
	3. Follow the wizard steps to map columns and data types
	4. Complete the import process to create the table 'hotel reservation dataset'

The following SQL code assumes that the table 'hotel reservation dataset' has the correct structure and data as described in the project.
*/

-- Step 3: Verify the table structure
DESC `hotel reservation dataset`;

-- Step 4: View all data in the table
SELECT * FROM `hotel reservation dataset`;

-- Step 5: Total number of reservations
SELECT COUNT(Booking_ID) AS total_reservations 
FROM `hotel reservation dataset`;

-- Step 6: Most popular meal plan
SELECT type_of_meal_plan, COUNT(type_of_meal_plan) AS popularity 
FROM `hotel reservation dataset` 
GROUP BY type_of_meal_plan 
ORDER BY popularity DESC 
LIMIT 1;

-- Step 7: Average price per room for reservations involving children
SELECT AVG(avg_price_per_room) AS average_price 
FROM `hotel reservation dataset` 
WHERE no_of_children > 0;

-- Step 8: Number of reservations made for the year 2018
SELECT COUNT(*) AS reservations_2018_count
FROM `hotel reservation dataset`
WHERE YEAR(STR_TO_DATE(arrival_date, '%d/%m/%Y')) = 2018;

-- Step 9: Most commonly booked room type
SELECT room_type_reserved, COUNT(room_type_reserved) AS popularity 
FROM `hotel reservation dataset` 
GROUP BY room_type_reserved 
ORDER BY popularity DESC 
LIMIT 1;

-- Step 10: Number of reservations on a weekend
SELECT COUNT(Booking_ID) AS weekend_reservations 
FROM `hotel reservation dataset` 
WHERE no_of_weekend_nights > 0;

-- Step 11: Highest and lowest lead time for reservations
SELECT MAX(lead_time) AS highest_lead_time, MIN(lead_time) AS lowest_lead_time 
FROM `hotel reservation dataset`;

-- Step 12: Most common market segment type
SELECT market_segment_type, COUNT(market_segment_type) AS popularity 
FROM `hotel reservation dataset` 
GROUP BY market_segment_type 
ORDER BY popularity DESC 
LIMIT 1;

-- Step 13: Number of reservations with a booking status of 'Confirmed'
SELECT COUNT(Booking_ID) AS confirmed_reservations_count 
FROM `hotel reservation dataset` 
WHERE booking_status = 'Not_canceled';

-- Step 14: Total number of adults and children across all reservations
SELECT SUM(no_of_adults) AS total_adults, SUM(no_of_children) AS total_children 
FROM `hotel reservation dataset`;

-- Step 15: Average number of weekend nights for reservations involving children
SELECT AVG(no_of_weekend_nights) AS avg_weekend_nights 
FROM `hotel reservation dataset` 
WHERE no_of_children > 0;

-- Step 16: Number of reservations in each month of the year
SELECT MONTH(STR_TO_DATE(arrival_date, '%d/%m/%Y')) AS month, COUNT(*) AS reservations_count
FROM `hotel reservation dataset` 
GROUP BY MONTH(STR_TO_DATE(arrival_date, '%d/%m/%Y'))
ORDER BY month;

-- Step 17: Average number of nights (both weekend and weekday) for each room type
SELECT room_type_reserved, AVG(no_of_weekend_nights + no_of_week_nights) AS avg_total_nights 
FROM `hotel reservation dataset` 
GROUP BY room_type_reserved;

-- Step 18: Most common room type for reservations involving children and its average price
SELECT room_type_reserved, COUNT(room_type_reserved) AS popularity, AVG(avg_price_per_room) AS avg_price 
FROM `hotel reservation dataset` 
WHERE no_of_children > 0 
GROUP BY room_type_reserved 
ORDER BY popularity DESC 
LIMIT 1;

-- Step 19: Market segment type generating the highest average price per room
SELECT market_segment_type, AVG(avg_price_per_room) AS avg_price 
FROM `hotel reservation dataset` 
GROUP BY market_segment_type 
ORDER BY avg_price DESC 
LIMIT 1;

/*
Conclusion:
The analysis of the hotel reservation data provides valuable insights into guest preferences and booking patterns. 
Key findings include:
	1. Meal Plan 1 is the most popular meal plan among guests.
	2. The average price per room for reservations involving children is significant, highlighting potential revenue opportunities.
	3. The year 2018 had a substantial number of reservations, indicating a peak period.
	4. Room Type 1 is the most commonly booked, suggesting its popularity among guests.
	5. Weekend stays are frequent, emphasizing the importance of weekend promotions.
	6. Lead times for reservations vary greatly, with both very early and last-minute bookings being common.
	7. The online market segment is the most common, pointing to the importance of maintaining a strong online presence.
	8. A large number of reservations have a status of 'Not_canceled', indicating high booking commitment.
	9. The total number of adults and children across all reservations provides a demographic overview of guests.
	10. For reservations involving children, the average number of weekend nights is notable, suggesting family-friendly weekend packages could be beneficial.
	11. Monthly reservation counts can help in planning and managing seasonal demand.
	12. The average number of nights spent in each room type can assist in optimizing room allocation and pricing strategies.
	13. The most common room type for reservations involving children, along with its average price, can help in designing family-friendly offers.
	14. Market segments that generate the highest average price per room can be targeted for premium offerings and marketing campaigns.

Overall, these insights can help the hotel management in making informed decisions to enhance guest satisfaction, optimize operations, and improve marketing strategies.
*/