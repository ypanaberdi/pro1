with t1 as (
    select f1.x as x1, f1.y as y1, f2.x as x2, f2.y as y2, case when (f1.x = f2.y and f1.y = f2.x) then 1 else 0 end as flag
    from functions f1
     join functions f2
      on f1.x = f2.y and f1.y = f2.x 
    where f1.x <> f2.x and f1.y <> f2.y
    ) 

select * from (
    select  x1 as x, y1 as y, flag
    from t1
) t8
order by x asc
