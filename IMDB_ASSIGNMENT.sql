use new_chem ;
select *
from imdb_top_1000
limit 10 ;
-- 1 get tha all information about all filmes which the director Peter Jackson work as
select *
from imdb_top_1000
where Director ="Peter Jackson";

-- 2 get the maximum gross
select max(Gross) as max_Gross
from imdb_top_1000 ;

-- 3 get the all information about the most 6 movies that have thea largest runtime

select *
from imdb_top_1000 
where Runtime >=150
order by Runtime desc
limit 6 ;
-- 4 : get the  Genre, Gross , IMDB_Rating which made by the director Damien Chazelle
select Genre, Gross , IMDB_Rating
from imdb_top_1000 
where Director ="Damien Chazelle" ;

-- 5 : get the Certificate for two rang of the runtim (Runtime between 120 and 130 )
-- & rang of Released_Year (Released_Year between 1999 and 2003)
select Certificate
from imdb_top_1000 
where (Runtime between 120 and 130 ) and (Released_Year between 1999 and 2003);

-- 6 : get the Genre , Gross , Director for  the largest 10 gross 
-- which happend in Released_Year between 1999 and 2003 
select Genre , Gross , Director
from imdb_top_1000 
where Released_Year between 1999 and 2003 
order by Gross desc 
limit 10 ;

-- 7: get the averag of the gross , number_of_films 
-- which happend in Released_Year between 2000 and 2005 ;
select avg(Gross) ,count(Gross) as number_of_films
from imdb_top_1000 
where Released_Year between 2000 and 2005 ;
-- 8 : get the director_name , director_total_gross for Robert Zemeckis
select Director as director_name,sum(Gross) as director_total_gross
from imdb_top_1000 
where Director ="Robert Zemeckis" ;

-- 9: get the minimum_runtime , Genre ,IMDB_Rating for each Genre 
-- which order by Runtime descending 

select min(Runtime) as minimum_runtime , Genre ,IMDB_Rating 
from imdb_top_1000 
GROUP BY Genre 
order by Runtime desc ;

-- 10: get(tha most fail movie) Released_Year, max(Meta_score) , Gross , Director , 
-- Star1 ,Star2 ,Star3 ,Star4 

select Released_Year, max(Meta_score) , Gross , Director , Star1 ,Star2 ,Star3 ,Star4 
from imdb_top_1000 
where Released_Year between 2000 and 2005 ;

-- 11 : get(tha most successfull movie ) Released_Year, max(IMDB_Rating) , Gross , Director , Star1 ,
-- Star2 ,Star3 ,Star4 which that movie happend between 2003 and 2007 ;

select Released_Year, max(IMDB_Rating) , Gross , Director , Star1 ,Star2 ,Star3 ,Star4 
from imdb_top_1000 
where Released_Year between 2003 and 2007 ;

-- 12 get Released_Year, Overview ,Gener, Director , IMDB_Rating , Gross 10 of them
-- which has tha smallest rating in each year

select Released_Year, Overview ,Genre, Director , IMDB_Rating , Gross
from imdb_top_1000 
group by Released_Year
order by IMDB_Rating asc, Released_Year asc
limit 10 ;

-- 13 : get Released_Year, Poster_Link , Genre , Gross which have 
-- the largest gross value for the last 5 years 
select Released_Year, Poster_Link , Genre , Gross 
from imdb_top_1000 
group by Released_Year
order by Released_Year desc , Gross desc
limit 5 ;

-- 14: it a query show Series_Title ,Poster_Link for a group whith a special 
-- constrain that if the IMDB_Rating >=9 thats mean its very good movie
-- IMDB_Rating < 9 and IMDB_Rating >7.7 thats mean its good movie
-- less than all of thes rang it will be "its bad movie"
select Series_Title ,Poster_Link ,
case 
	when (IMDB_Rating >=9 ) then "its very good movie"
    when (IMDB_Rating < 9 and IMDB_Rating >7.7) then "its good movie"
	else "its bad movie"
end 
from imdb_top_1000 
group by IMDB_Rating



