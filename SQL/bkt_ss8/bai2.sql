select g.guest_name ,r.room_type,b.check_in
from bookings b
join guests g
on g.guest_id=b.guest_id
join rooms r
on b.room_id=r.room_id
;

select b.guest_id,count(b.guest_id)
from bookings b
group by b.guest_id;

select b.room_id,sum((b.check_out-b.check_in)*r.price_per_day)
from bookings b
join rooms r
on b.room_id=r.room_id
group by b.room_id
;

select b.guest_id,count(b.guest_id)
from bookings b
group by b.guest_id
having count(b.guest_id)>=2;

select b.room_id,count(b.room_id)
from bookings b
group by b.room_id
order by count(b.room_id) desc
limit 1;



