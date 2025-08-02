CREATE DATABASE UBER;

USE UBER;

CREATE TABLE Uber_cabs (
	Request_id int,
    Pickup_point varchar(50),
    Driver_id int,
    Status varchar(50),
    Request_timestamp text,
    Request_hours time,
    Drop_timestamp text,
    Drop_hours time,
    Day varchar(50),
    Hour int,
    Slot varchar(50));
    
-- Fetching the records of uber_cabs table

-- Analysis part

-- 1. Knowing the total number of uber trip requests by status (completed, cancelled or no cars available)

SELECT status, COUNT(*) as total_requests
FROM uber_cabs
GROUP BY status;

-- 2. Identify the total number of uber trip requests 

SELECT COUNT(*) as total_requests
FROM uber_cabs;

-- 3. Knowing the high trip cancellation rates during peak hours

SELECT slot, status, count(*) as total_requests
FROM uber_cabs
WHERE status = "cancelled"
GROUP BY slot, status
ORDER BY slot, status;

-- 4. Identify the total number of requests based on pickup points (City, Airport)

SELECT pickup_point, COUNT(*) as total_requests
FROM uber_cabs
GROUP BY pickup_point;

-- 5. Identify how many cars are not available at several pickup points and on the basis of different slots

SELECT pickup_point, slot, COUNT(*) as no_cars_available
FROM uber_cabs
WHERE status = 'No cars available'
GROUP BY 1 , 2
ORDER BY 3 desc;

-- 6. Which drivers are completing the most and the least number of trips, and what is the distribution of completed trips across all drivers?

SELECT Driver_id, COUNT(*) as completed_trips
FROM uber_cabs
WHERE status = 'Trip completed' and Driver_id is not null
GROUP BY 1
ORDER BY 2 DESC;

-- 7. Which time slots during the day have the highest and lowest trip completion ratios, and how does performance vary by slot?

SELECT slot, 
	COUNT(CASE WHEN status = 'Trip completed' THEN 1 END) as completed_trips,
    COUNT(*) as total_requests,
    ROUND(COUNT(CASE WHEN status = 'Trip completed' THEN 1 END) * 100.0/ COUNT(*),2) as completion_ratios
    FROM uber_cabs
    GROUP BY 1
    ORDER BY completion_ratios;
    
-- 8. Demand gap analysis between cancelled cars and no cars available based on pickup points

SELECT pickup_point, COUNT(*) as demand_gap
FROM uber_cabs
WHERE status IN ('Cancelled', 'No Cars Available')
GROUP BY 1
ORDER BY demand_gap desc;  

-- 9. At what hours of the day does Uber experience the highest and lowest demand, and how can this inform better driver allocation and surge pricing decisions?

SELECT Hour, COUNT(*) as total_requests
FROM uber_cabs
GROUP BY 1
ORDER BY 1;

-- 10. Identify the total number of trips by driver

SELECT Driver_id, COUNT(*) as total_trips
FROM uber_cabs
WHERE status = 'Trip Completed'
GROUP BY 1 
ORDER BY total_trips;

-- 11. Identify the total number of requests where no driver was assigned

SELECT COUNT(*) as requests_without_driver
FROM uber_cabs
WHERE Driver_id IS NULL OR Driver_id = '';

-- 12. Identify the count of requests that have no drop timestamp?

SELECT COUNT(*) as no_drop_timestamp
FROM uber_cabs
WHERE Drop_timestamp IS NULL OR Drop_timestamp = '';

-- 13. How does Uber’s daily ride request performance vary throughout the week in terms of completed, cancelled, and unfulfilled trips?

SELECT day,
	COUNT(*) as total_requests,
    COUNT(CASE WHEN status = 'Trip Completed' THEN 1 END) as completed_trips,
    COUNT(CASE WHEN status = 'Cancelled' THEN 1 END) as cancelled_trips,
    COUNT(CASE WHEN status = 'No Cars Available' THEN 1 END) as no_trips
FROM uber_cabs
GROUP BY 1
ORDER BY CASE day
	WHEN 'Monday' THEN 1
    WHEN 'Tuesday' THEN 2
    WHEN 'Wednesday' THEN 3
    WHEN 'Thursday' THEN 4
    WHEN 'Friday' THEN 5
ELSE 6
END; 

-- 14. Are specific pickup points (City vs Airport) underserved during certain time slots, leading to higher no-car-available rates?

SELECT pickup_point, slot,	
	COUNT(*) as total_requests,
    COUNT(CASE WHEN Status = 'No Cars Available' THEN 1 END) as no_car_cases
FROM uber_cabs
GROUP BY 1,2
ORDER BY no_car_cases desc;    

-- 15. Are there time slots or hours when driver assignment is low despite high ride request volume?

SELECT Hour, 
	COUNT(*) as total_requests,
    COUNT(DISTINCT CASE WHEN Driver_id IS NOT NULL THEN Driver_id END) as active_drivers
FROM uber_cabs
GROUP BY 1
ORDER BY total_requests DESC;    


    
    