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

select r.room_type
from rooms r
join (
select b.room_id ma_phong,count(b.room_id)
from bookings b
group by b.room_id
having count(b.room_id) in(select max(t.luot_dat)
from(
select b.room_id ma_phong,count(b.room_id) luot_dat
from bookings b
group by b.room_id
) t)
) t
on r.room_id=t.ma_phong

;
-- bai3

select *
from rooms r
where r.price_per_day>(select avg(r.price_per_day)
from rooms r)
;

select *
from guests g
where g.guest_id not in(select  b.guest_id
from bookings b
group by b.guest_id)
;


select t.ma_phong ,t.so_luong_dat_phong
from (
select b.room_id ma_phong,count(b.room_id) so_luong_dat_phong
from bookings b
group by b.room_id
) t
where t.so_luong_dat_phong in(
select max(t.so_luong_dat_phong)
from (
select b.room_id,count(b.room_id) so_luong_dat_phong
from bookings b
group by b.room_id
) t
)
;




