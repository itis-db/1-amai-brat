with recursive cte as (
    select ac.*, con.areaid, 1 as level, name as path
    from activity ac
             left join contract con
                       on ac.activityid = con.contractid
    where activitytypeid = 4
    union
    select ac.*, cte.areaid, level + 1,
           case
               when level = 2 then ac.name || '->' || (select name from area where cte.areaid = area.areaid) || '->' || cte.path
               else ac.name || '->' || cte.path
               end
    from activity ac
             left join contract con
                       on ac.activityid = con.contractid
             join cte
                  on ac.activityid = cte.parentid
)
select path
from cte
where level = 4;