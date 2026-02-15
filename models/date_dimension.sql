with cte as (
    select 
        --STARTED_AT,
        TO_TIMESTAMP(STARTED_AT) as STARTED_AT,
        DATE(TO_TIMESTAMP(STARTED_AT)) as DATE_STARTED_AT,
        HOUR(TO_TIMESTAMP(STARTED_AT)) as HOUR_STARTED_AT,

        -- case
        -- when dayname(DATE(TO_TIMESTAMP(STARTED_AT))) in ('Sat', 'Sun') then 'weekend'
        -- else 'businessday'
        -- end as day_type,

        -- case
        -- when month(DATE(TO_TIMESTAMP(STARTED_AT))) in (12,1,2) then 'winter'
        -- when month(DATE(TO_TIMESTAMP(STARTED_AT))) in (3,4,5) then 'spring'
        -- when month(DATE(TO_TIMESTAMP(STARTED_AT))) in (6,7,8) then 'summer'
        -- when month(DATE(TO_TIMESTAMP(STARTED_AT))) in (9,10,11) then 'autumn'
        -- end as season

        {{get_daytype('STARTED_AT')}} as day_type,

        {{get_season('STARTED_AT')}} as season


    from {{ source('demo', 'bike') }}
    where STARTED_AT != 'started_at'
)

select *
from cte


/*
dbt run --select date_dimension
*/