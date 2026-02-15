{% macro get_season(x) %}

case
when month(DATE(TO_TIMESTAMP({{x}}))) in (12,1,2) then 'winter'
when month(DATE(TO_TIMESTAMP({{x}}))) in (3,4,5) then 'spring'
when month(DATE(TO_TIMESTAMP({{x}}))) in (6,7,8) then 'summer'
when month(DATE(TO_TIMESTAMP({{x}}))) in (9,10,11) then 'autumn'
end 

{% endmacro %}

{%  macro get_daytype(x) %}

case
        when dayname(DATE(TO_TIMESTAMP({{x}}))) in ('Sat', 'Sun') then 'weekend'
        else 'businessday'
        end 

{% endmacro %}