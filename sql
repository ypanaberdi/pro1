WITH x AS (SELECT n FROM (VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) v(n)),
numbers as (SELECT ones.n + 10*tens.n + 100*hundreds.n +1 as n
FROM x ones,     x tens,      x hundreds
)
select STRING_AGG(prime,'&') prime from (
    select n.n as prime
    from numbers n, numbers ndiv
    where n.n>=ndiv.n
    group by n.n
    having sum(case when n.n%ndiv.n = 0 then 1 else 0 end )=2
) t3
