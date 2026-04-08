CREATE DATABASE ola;
use ola;
show tables;
select *
from bookings;

#1.Retrieve all success bookings

create view succesful_booking as
select *
from bookings
where Booking_Status="Success";

select * from succesful_booking;

#2.Find the avg. ride distance for each vehicle type.

create view avg_ride_distance_per_vehicle_type as 
select round(avg(Ride_Distance),2),Vehicle_Type
from bookings
group by Vehicle_Type;

select * from avg_ride_distance_per_vehicle_type;

#3.Get the total number of cancelled rides by customer.

create view total_cancelled_by_customer as
select count(booking_status) as Cancelled_By_Customer
from bookings
where booking_status="Canceled by Customer";

select * from total_cancelled_by_customer;

#4.List the top 5 customers who booked the highest number of rides.

create view top_5_customer as
select customer_id
from bookings
group by customer_id
order by customer_id desc
limit 5;

select * from top_5_customers;

#5.Get the number of rides cancelled by drivers due to personal and car related issues

create view cancelled_by_drivers_personal_reasons as
select count(booking_id) as cancelled_by_drivers_due_to_personal_and_car_related_issue
from bookings 
where canceled_rides_by_driver="Personal & Car related issue";

select * from cancelled_by_drivers_personal_reasons;

#6.Find the min and max driver ratings for prime sedan bookings

create view min_max_rating as
select min(Customer_Rating) as min_rating,max(Customer_Rating) as max_rating
from  bookings
where Vehicle_Type="prime sedan";

select * from min_max_rating;

#7.Retrieve all rides where payment method was UPI

create view payment_method_upi as
select booking_ID
from bookings 
where Payment_Method="UPI";

select * from payment_method_upi;

#8.Find the Average customer rating per vehicle type

create view avg_rating_per_vehicle_type as
select round(avg(Customer_Rating),2) as Average_customer_rating,Vehicle_type
from bookings
group by vehicle_type;

select * from avg_rating_per_vehicle_type;

#9.Calculate the total booking value of rides completed succesfully

create view total_value_of_succesfull_rides as
select sum(booking_value)
from bookings
where Booking_Status="success";

select * from total_value_of_succesfull_rides;

#10.List all incomplete rides along with reason

create view incomplete_ride_reasons as
select booking_id,incomplete_rides_reason
from bookings
where incomplete_rides="yes";

select * from Incomplete_Ride_Reasons;