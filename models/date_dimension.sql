with cte as (
    select 
        --STARTED_AT,
        TO_TIMESTAMP(STARTED_AT) as STARTED_AT,
        DATE(TO_TIMESTAMP(STARTED_AT)) as DATE_STARTED_AT,
        HOUR(TO_TIMESTAMP(STARTED_AT)) as HOUR_STARTED_AT,

        case
        when dayname(DATE(TO_TIMESTAMP(STARTED_AT))) in ('Sat', 'Sun') then 'weekend'
        else 'businessday'
        end as day_type


    from {{ source('demo', 'bike') }}
    where STARTED_AT != 'started_at'
)

select *
from cte


/*
dbt run --select date_dimension
*/