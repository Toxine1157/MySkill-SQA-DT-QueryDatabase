-- use insert
INSERT INTO "user" ("id", "name", "address", "phone_number", "email", "password", "created_at", "created_by", "updated_at", "updated_by")
VALUES
    ('923e4567-e89b-12d3-a456-426614174019', 'Liam Scott', '1616 Palm St', '555-6700', 'liam.scott@example.com', 'password123', CURRENT_TIMESTAMP, '00000000-0000-0000-0000-000000000019', CURRENT_TIMESTAMP, '00000000-0000-0000-0000-000000000019');

-- use select
select * from "user";

-- use where
select * from "user" where "address" = '808 Fir St';

-- use where, and
select * from "user" where "phone_number" = '555-9634' and "email" = 'charlotte.wilson@example.com';

-- use not
select * from "user" where not "address" = '808 Fir St';

-- use or
select * from "user" where "name" = 'Sara Lee' or "name" = 'Daniel Clark';

-- use >
select * from public."session" where "id" > 5;

-- use LIKE, %
select * from public."user" where "name" like '%t%';

-- use inner join
select u.name, a.id from "user" u inner join "attendance" a on u.id = a.user_id;

-- use left join
select u.address, s.id from "user" u left join "session" s on u.id = s.user_id;

-- use right join
select u.phone_number, s.session_id from "user" u right join "session" s on u.id = s.user_id;

-- use self join
select n.name, e.email from "user" n left join "user" e on n.id = e.id;

-- use count()
select count(*) from public."user";

-- use sum()
select sum(id) from public."session";

-- use avg()
select avg(id) from public."attendance";

-- use min()
select min(id) from public."attendance";

-- use max()
select max(id) from public."attendance";

-- use group by
select a.user_id, count(a.user_id) from "attendance" a where a."type" = 'clock-out' group by a.user_id;

-- use having
select id from "attendance" group by id having avg(id) > 61165;













