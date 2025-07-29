--1)  Team that has won the maximum gold medals over the years.



select top 3 team,count(*) as gold_medals from athletes a inner join athlete_events ae on a.id=ae.athlete_id
where medal='gold'
group by team
order by count(*) desc


--2) Total silver medals of each team and year in which they won maximum silver medal

WITH silver_counts AS (
    SELECT 
        a.team, 
        ae.year, 
        COUNT(*) AS silver_count
    FROM 
        athletes a 
    INNER JOIN 
        athlete_events ae ON a.id = ae.athlete_id
    WHERE 
        ae.medal = 'Silver'
    GROUP BY 
        a.team, ae.year)



,cte2 as (select *,rank() over(partition by team order by silver_count desc) as rnk
from silver_counts)



select team,sum(silver_count) over (partition by team) as total_silver_medals,year as year_of_max_silver
from cte2
where rnk=1





--3) player that has won maximum gold medals without winning a silver or bronze medal


with cte as (select name,medal
from athletes a inner join athlete_events ae on a.id=ae.athlete_id
where medal <> 'na'
)

,cte2 as (select name,count(case when medal='gold' then 1 end) as gold_cnt
,count(case when medal='silver' then 1 end) as silver_cnt
,count(case when medal='bronze' then 1 end) as bronze_cnt
from cte
group by name)


select top 1 name,gold_cnt
from cte2
where silver_cnt=0 and bronze_cnt=0
order by gold_cnt desc




--4) Players having maximum gold medal in each year .



with cte as(select name,year,count(medal) as gld_count 
from athletes a inner join athlete_events ae on a.id=ae.athlete_id
where medal='gold'
group by name,year)

,cte2 as (select *, rank() over(partition by year order by gld_count desc) as rnk
from cte)


select year,STRING_AGG(name,',') as names,max(gld_count) as gld_count
from cte2 
where rnk=1
group by year




--5) Year India won its first gold medal,silver medal and bronze medal


select distinct * from (
select medal,year,event,rank() over(partition by medal order by year) rn
from athlete_events ae
inner join athletes a on ae.athlete_id=a.id
where team='India' and medal != 'NA'
) A
where rn=1




--6) players who won gold medal in summer and winter olympics both.



with cte as (select name,season,medal
from athletes a inner join athlete_events ae on a.id=ae.athlete_id
where medal='gold' )

,cte2 as (select name,count(case when season='summer' then 1 end ) as summer_win
,count(case when season='winter' then 1 end ) as winter_win
from cte
group by name)

select name 
from cte2 
where summer_win>0 and winter_win>0


--7) players who won gold, silver and bronze medal in a single olympics along with the year


with cte as (select name,games,year,medal,ROW_NUMBER() over(partition by name,games order by year) as rn
from athletes a inner join athlete_events ae on a.id=ae.athlete_id
where medal<>'na')

select name,games,year,count( distinct medal) as cnt
from cte
group by name,games,year
having count( distinct medal)=3



--8) players who have won gold medals in consecutive 3 summer olympics in the same event since olympics 2000
-- along with the event. 




WITH cte AS (
    SELECT 
        a.name,
        ae.event,
        ae.year,
        RANK() OVER (PARTITION BY a.name, ae.event ORDER BY ae.year) AS rk,
        LAG(ae.year, 1) OVER (PARTITION BY a.name, ae.event ORDER BY ae.year) AS prev_year,
        LAG(ae.year, 2) OVER (PARTITION BY a.name, ae.event ORDER BY ae.year) AS prev2_year
    FROM athletes a
    INNER JOIN athlete_events ae ON a.id = ae.athlete_id
    WHERE ae.medal = 'Gold'
      AND ae.year >= 2000
      AND ae.games LIKE '%Summer%'
)
SELECT DISTINCT name, event
FROM cte
WHERE (year - prev_year = 4 AND prev_year - prev2_year = 4);






