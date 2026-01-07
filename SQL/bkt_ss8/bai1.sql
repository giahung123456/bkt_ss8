select guest_name,phone
from guests;

select room_type 
from rooms
group by room_type;

select room_type,price_per_day 
from rooms
order by price_per_day asc
;

select *
from rooms
where price_per_day >1000000
;

select *
from bookings
where check_in between '2024-1-1' and '2024-12-31'
;

