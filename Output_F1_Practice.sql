select 
    name
    ,forename
    ,surname
    ,max(fastestlapspeed)
    ,wins


from races as rc

join results as re
    on rc.raceid=re.raceid

join drivers as dr
    on re.driverid=dr.driverid

    inner join (SELECT driverid
    ,count(position) as wins
        from races as rc
        
        join results as re
            on rc.raceid=re.raceid
        
        where name like '%Monaco%'
            and position = 1
        group by
        driverid) as all_wins
        on all_wins.driverid = re.driverid

where name like '%Monaco%'
    and rc.year = 2021

Group by
     name
    ,forename
    ,surname
    ,wins

    
limit 42


        


    



    
