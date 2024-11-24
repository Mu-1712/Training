create table s1.events (
							sensors_id integer not null,
							event_type integer not null,
							value float not null,
							time date default getdate()
							);

							drop table s1.events;
 
insert into s1.events (sensors_id, event_type, value) values (2,4,10), (2,5,12), (3,7,5), (2,6,10), (2,4,15), (2,4,12), (4,5,15), (3,7,16);
 
select * from s1.events;
 
select sensors_id, count(distinct event_type) as types from s1.events group by sensors_id order by sensors_id;
