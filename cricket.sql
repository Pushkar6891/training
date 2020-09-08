create database cricket_db;

use cricket_db;

drop table cricket_odi_player;
drop table cricket_odi_team;

create table cricket_odi_team(
tid int not null,
team varchar(50),
points int,
primary key(tid)
);

insert into cricket_odi_team values(1,'England',127);
insert into cricket_odi_team values(2,'India',119);
insert into cricket_odi_team values(3,'New Zealand',116);
insert into cricket_odi_team values(4,'South Africa',108);
insert into cricket_odi_team values(5,'Australia',107);
insert into cricket_odi_team values(6,'Pakistan',102);
insert into cricket_odi_team values(7,'Bangladesh',88);
insert into cricket_odi_team values(8,'Sri Lanka',85);
insert into cricket_odi_team values(9,'West Indies',76);
insert into cricket_odi_team values(10,'Afghanistan',55);

select * from cricket_odi_team;

create table cricket_odi_player(
cid int not null,
first_name varchar(50),
last_name varchar(50),
runs int,
tid int not null,
primary key(cid),
foreign key(tid) references cricket_odi_team(tid)
);

insert into cricket_odi_player values(1,'sachin','tendulkar',18426,2);
insert into cricket_odi_player values(2,'kumar','sangakkara',14234,8);
insert into cricket_odi_player values(3,'ricky','ponting',13704,5);
insert into cricket_odi_player values(4,'sanath','jayasuriya',13430,8);
insert into cricket_odi_player values(5,'mahela','jayawardena',12650,8);
insert into cricket_odi_player values(6,'virat','kohli',11867,2);
insert into cricket_odi_player values(7,'inzamam','ul-haq',11739,6);
insert into cricket_odi_player values(8,'jacques','kallis',11579,4);
insert into cricket_odi_player values(9,'sourav','ganguly',11363,2);
insert into cricket_odi_player values(10,'rahul','dravid',10889,2);

select * from cricket_odi_player


-- #1 Find List of Cricketers
-- select * from cricket_odi_player;

-- #2 Find List of Teams
-- select * from cricket_odi_team;

-- #3 Find certain fields from Cricketers
-- select cid, first_name, last_name, runs, tid from cricket_odi_player

-- #4 Find Cricketers with 18426 runs
-- select cid, first_name, last_name, runs, tid from cricket_odi_player where runs=18426

-- #5 Find List of Cricketers with more than 12000 runs
-- select cid, first_name, last_name, runs, tid from cricket_odi_player where runs>12000

-- #6 Find List of Cricketers with more than 12000 runs and whose first name starts with s
-- select cid, first_name, last_name, runs, tid from cricket_odi_player where runs>12000 and first_name like 's%'

-- #7 Find List of Cricketers with more than 12000 runs and whose first name do not starts with s
-- select cid, first_name, last_name, runs, tid from cricket_odi_player where runs>12000 and first_name not like 's%'

-- #8 Find runs for Sachin
-- select * from cricket_odi_player where first_name='sachin'

-- #9 Find List of Cricketers whose tid(team id) not equal to 2
-- select * from cricket_odi_player where tid!=2;
-- select * from cricket_odi_player where tid <> 2;

-- #10 Find how many Cricketers have tid 2 or 6
-- select * from cricket_odi_player where tid=2 or tid=6

-- #11 Find List of Cricketers in ascending order of runs scored
-- select * from cricket_odi_player order by runs
-- select * from cricket_odi_player order by runs asc

-- #12 Find List of Cricketers in descending order of runs scored
-- select * from cricket_odi_player order by runs desc

-- #13 Sybase : Find List of Cricketers by joining their first_name and last_name
-- select (first_name || ' ' || last_name) as fullname from cricket_odi_player
-- #13 MySQL : Find List of Cricketers by joining their first_name and last_name
-- select concat(first_name, ' ', last_name) as fullname from cricket_odi_player;
-- select concat(first_name, ' ', last_name) as 'fullname' from cricket_odi_player;
-- select concat(first_name, ' ', last_name) 'fullname' from cricket_odi_player;

-- #14 Find average runs scored by all cricket_odi_player
-- select avg(runs) as total_average_runs from cricket_odi_player

-- #15 Find total runs scored by all cricket_odi_player
-- select sum(runs) as total_runs from cricket_odi_player

-- #16 Find count of List of Cricketers 
-- select count(*) from cricket_odi_player

-- #17 Sybase : Find List of Cricketers with their country name
-- select (first_name || ' ' || last_name) as fullname, t.team from cricket_odi_player p inner join cricket_odi_team t
-- on p.tid=t.tid
-- #17 MySQL : Find List of Cricketers with their country name
-- select concat(first_name, ' ', last_name) as fullname, t.team from cricket_odi_player p inner join cricket_odi_team t
-- on p.tid=t.tid

-- #18 Sybase : Find List of Cricketers who belong to team='India'
-- select (p.first_name || ' ' || p.last_name) as fullname,  
-- t.team 
-- from cricket_odi_player p 
-- inner join cricket_odi_team t
-- on p.tid=t.tid
-- where t.team='India'
-- #18 MySQL : Find List of Cricketers who belong to team='India'
-- select concat(first_name, ' ', last_name) as fullname,  
-- t.team 
-- from cricket_odi_player p 
-- inner join cricket_odi_team t
-- on p.tid=t.tid
-- where t.team='India'

-- #19 Sybase : Find List of Cricketers who belong to team='India' and runs > 12000
-- select (p.first_name || ' ' || p.last_name) as fullname,  
-- t.team 
-- from cricket_odi_player p 
-- inner join cricket_odi_team t
-- on p.tid=t.tid
-- where t.team='India' and runs>12000
-- #19 MySQL : Find List of Cricketers who belong to team='India' and runs > 12000
-- select concat(first_name, ' ', last_name) as fullname,  
-- t.team 
-- from cricket_odi_player p 
-- inner join cricket_odi_team t
-- on p.tid=t.tid
-- where t.team='India' and runs>12000

-- #20 Find Count of List of Cricketers who belong to team 'India'
-- select count(*) as no_of_indian_players from cricket_odi_player p 
-- inner join cricket_odi_team t
-- on p.tid=t.tid
-- where t.team='India'

-- #21 Find cricketer details with maximum runs
-- select * from cricket_odi_player where runs = (select max(runs) from cricket_odi_player)

-- #22 Find cricketer details with minimum runs
-- select * from cricket_odi_player where runs = (select min(runs) from cricket_odi_player)

-- #23 Find total number of players playing for each country
-- select t.team,count(*) as total_no_of_players from cricket_odi_player p inner join cricket_odi_team t
-- on p.tid = t.tid
-- group by t.team

-- #24 Sybase : Find top N runs scorer from start
-- select top 5 first_name from cricket_odi_player
-- select top 5 first_name from (select * from cricket_odi_player) as t1 order by t1.runs desc
-- #24 MySQL : Find top N runs scorer from start
-- select first_name from cricket_odi_player order by runs desc limit 0,5

-- #25 Find Teams and Put Remarks based on Points
-- select team, ( case 
-- when points>=120 and points<=200 then 'Super Excellent Team'
-- when points>=115 and points<=120 then 'Excellent Team'
-- when points>=110 and points<=115 then 'Super Good Team'
-- when points>=105 and points<=110 then 'Good Team'
-- when points>=100 and points<=105 then 'Average Team'
-- when points>=95 and points<=100 then 'Bad Team'
-- else 'Really Bad Team' end) as scale, points from cricket_odi_team

-- #26 Find List of Cricketers and categorize them on basis of their country initial 3 characters
-- select p.cid, p.first_name,p.last_name,p.runs,t.tid,t.team,t.points,
-- (case
-- when substring(team,1,3)='Aus' then 'Aus'
-- when substring(team,1,3)='Ind' then 'Ind'
-- when substring(team,1,3)='Sri' then 'Sri'
-- when substring(team,1,3)='Pak' then 'Pak'
-- else 'NA'
-- end ) as country_initial
-- from cricket_odi_player p inner join cricket_odi_team t
-- on p.tid = t.tid

-- #27 Find all indian players
-- Problem  : select * from cricket_odi_player where tid IN (select * from cricket_odi_team where team like 'In%')
-- Solution : select * from cricket_odi_player where tid IN (select tid from cricket_odi_team where team like 'In%')

-- #28 Find all indian players and pakistan players
-- select * from cricket_odi_player where tid IN (select tid from cricket_odi_team where team like 'In%' or team like 'Pak%')

-- #29 Find all players who are from asia
-- select * from cricket_odi_player p join cricket_odi_team t on p.tid=t.tid
-- where team in ('India','Pakistan','Sri Lanka','Bangladesh')

-- #30 Find all players who are not from asia
-- select * from cricket_odi_player p join cricket_odi_team t on p.tid=t.tid
-- where team not in ('India','Pakistan','Sri Lanka','Bangladesh')

-- #31 Find all players with points above 100 and non asian
-- select * from cricket_odi_player p join cricket_odi_team t on p.tid=t.tid
-- where t.points>100 and team not in ('India','Pakistan','Sri Lanka','Bangladesh')

-- #32 Find names starting with s
-- select * from cricket_odi_player where first_name like 's%'

-- #33 Find names starting with s and skip second char
-- select * from cricket_odi_player where first_name like 's_%'

-- #34 Sybase : Find fullname
-- select first_name || ' ' || last_name as upper_case_name from cricket_odi_player;
-- #34 MySQL : Find fullname
-- select concat(lower(upper(first_name)), ' ', last_name) as upper_case_name from cricket_odi_player;

-- #35 Count Number of records
-- select count(*) from cricket_odi_player;
-- select upper(first_name) as upper_case_name from cricket_odi_player;

-- #36 Average of total points
-- select avg(points) as average_team_points from cricket_odi_team

-- #37 Sum of all runs
-- select sum(runs) as total_odi_runs from cricket_odi_player

-- #38 Sybase : Find top N runs scorer from end in desc order / Find bottom N runs scorer from start
-- select top 5 first_name from (select * from cricket_odi_player) as t1 order by t1.runs asc

-- #39 Find Nth runs from start / 2nd max runs
-- #Find top 2 runs scorers in desc order / top 2 run getters (using correlated subquery)
-- select * from cricket_odi_player as p1 where 2>(select count(distinct runs) from cricket_odi_player as p2 where p2.runs>p1.runs)

-- #40 Find Nth runs from end / 2nd min runs
-- select * from cricket_odi_player as p1 where 2>(select count(distinct runs) from cricket_odi_player as p2 where p2.runs<p1.runs)

-- #41 Find 3rd Highest runs (from start)
-- select
--    cid,
--    first_name,
--    last_name,
--    runs,
--    tid 
-- from
--    cricket_odi_player c1 
-- where
--    3 - 1 = 
--    (
--       select
--          count(distinct runs) 
--       from
--          cricket_odi_player c2 
--       where
--          c2.runs > c1.runs
--    )

-- #42 Find 3rd Lowest runs (from end)
-- select
--    cid,
--    first_name,
--    last_name,
--    runs,
--    tid 
-- from
--    cricket_odi_player c1 
-- where
--    3 - 1 = 
--    (
--       select
--          count(distinct runs) 
--       from
--          cricket_odi_player c2 
--       where
--          c2.runs < c1.runs
--    )

-- # MySQL : Find top 3 highest record scorer
-- select * from cricket_odi_player order by runs desc Limit 0,3 

-- #43 Find highest run scored in each team (without join)
-- select
--    p.tid,
--    max(runs) as max_runs 
-- from
--    cricket_odi_player p 
-- group by
--    tid 
-- order by
--    tid

-- #44 Find highest runs scored in each team and print their team name as well
-- select
--    t.tid,
--    t.team,
--    max(p.runs) as max_runs 
-- from
--    cricket_odi_player p 
--    left join
--       cricket_odi_team t 
--       on p.tid = t.tid 
-- group by
--    t.tid,
--    t.team
-- order by
--     team

-- #45 Find highest run scorer in each team and print tid and max_runs (with join)
-- select
--    p.tid,
--    max(runs) as max_runs 
-- from
--    cricket_odi_player p 
--    inner join
--       cricket_odi_team t 
--       on p.tid = t.tid 
-- group by
--    p.tid
-- order by
--    p.tid

-- #46 Find highest run scorer in each team with print first name and last name, max_runs and tid
-- select
--    s1.tid,
--    p2.first_name,
--    p2.last_name,
--    s1.max_runs 
-- from
--    (
--       select
--          p1.tid,
--          max(runs) as max_runs 
--       from
--          cricket_odi_player p1
--          inner join
--             cricket_odi_team t1 
--             on p1.tid = t1.tid 
--       group by
--          p1.tid 
--    )
--    as s1 
--    inner join
--       cricket_odi_player p2
--       on s1.tid = p2.tid 
--       and p2.runs = s1.max_runs

-- #47 Find highest run scorer in each team with print first_name, last_name, max_runs, team, tid
-- select
--    s1.tid,
--    s1.team,
--    p2.first_name,
--    p2.last_name,
--    s1.max_runs 
-- from
--    (
--       select
--          p1.tid,
--          t1.team,
--          max(runs) as max_runs 
--       from
--          cricket_odi_player p1
--          inner join
--             cricket_odi_team t1 
--             on p1.tid = t1.tid 
--       group by
--          p1.tid,t1.team 
--    )
--    as s1 
--    inner join
--       cricket_odi_player p2
--       on s1.tid = p2.tid 
--       and p2.runs = s1.max_runs

-- #48 Find highest run scorer overall
-- select * from cricket_odi_player where runs = (select max(runs) from cricket_odi_player)

-- #49 Find details of player with highest runs in each team
-- select
--    * 
-- from
--    cricket_odi_player t1 
-- where
--    runs in 
--    (
--       select
--          max(runs) as max_runs_in_team
--       from
--          cricket_odi_player
--       group by
--          tid 
--    )
-- 	
--         

--   select 
-- 	tid,
--     max(runs) as max_runs_in_team
--          from cricket_odi_player 
--       group by
--          tid

-- #50 Find details of player with lowest runs in each team
-- select
--    * 
-- from
--    cricket_odi_player t1 
-- where
--    runs in 
--    (
--       select
--          max(p.runs) as max_runs 
--       from
--          cricket_odi_player p 
--       group by
--          tid 
--    )

-- #51 Find second highest run scorer in each team
-- select
--    max(runs),
--    e1.tid 
-- from
--    cricket_odi_player e1,
--    (
--       select
--          max(runs) as max_runs,
--          tid 
--       from
--          cricket_odi_player 
--       group by
--          tid
--    )
--    e2 
-- where
--    e1.runs < e2.max_runs 
--    and e1.tid = e2.tid 
-- group by
--    e1.tid

-- #52 Find highest and second highest runs overall
-- select
--    max(runs) 
-- from
--    cricket_odi_player 
-- where
--    runs = 
--    (
--       select
--          max(runs) 
--       from
--          cricket_odi_player
--    )
-- UNION
-- select
--    max(runs) 
-- from
--    (
--       select
--          * 
--       from
--          cricket_odi_player 
--       where
--          runs < (
--          select
--             max(runs) 
--          from
--             cricket_odi_player) 
--    )
--    as t1

-- #53 Find todays date
-- select getdate()

-- #54 Find highest and lowest run scorer in each team


-- #55 List of all cricketers top 10 in detail
-- select
--    * 
-- from
--    cricket_odi_player p 
--    join
--       cricket_odi_team t 
--       on p.tid = t.tid 
-- order by
--    runs desc

-- #56 List of all cricketers who have score more than 12000 runs
-- select
--    * 
-- from
--    cricket_odi_player p 
--    join
--       cricket_odi_team t 
--       on p.tid = t.tid 
-- where runs > 12000
-- order by
--    runs desc

-- #57 Count of number of teams for top 10 run scorers
-- select
--    t.team,
--    count(*) as team_count 
-- from
--    cricket_odi_player p 
--    join
--       cricket_odi_team t 
--       on p.tid = t.tid 
-- group by team