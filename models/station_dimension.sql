with bike as (
    select 
        -- *
        distinct
        start_statio_id as station_id,
        start_station_name as station_name,
        start_lat,
        start_lng
        -- *
    -- from {{ source('demo', 'bike') }}
    from {{ ref('stg_bike') }}

    where ride_id != 'ride_id'
    limit 10
)

select *
from bike

/*
dbt run --select station_dimension
*/