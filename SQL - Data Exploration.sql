
Covid 19 Data Exploration 2023

--------------------------------------------------------------------------------------------------------------------------


select *
from coviddeaths_csv 
where continent is not null 
order by 3, 4
--------------------------------------------------------------------------------------------------------------------------
Total Cases vs Total Deaths*/

select location , `date` ,total_cases , total_deaths , 
	(total_cases/population)*100 as death_percentage
from coviddeaths_csv 
where location = 'Italy'
order by 1 ,2

--------------------------------------------------------------------------------------------------------------------------
 Countries with Highest Infection rate compared to Population

select location , population , max(total_cases) , 
		max(total_cases/population)*100 as percent_population_infected
from coviddeaths_csv 
group by location, population 
order by percent_population_infected desc 

--------------------------------------------------------------------------------------------------------------------------

 Countries with Highest Death Count per Population*

select location , sum(total_deaths) as total_death_count
from coviddeaths_csv 
where continent  is not null 
group by location 
order by total_death_count desc 

--------------------------------------------------------------------------------------------------------------------------


Total GLOBAL NUMBERS

select `date` , sum(new_cases) as total_cases , sum(new_deaths) total_deaths ,
	sum(new_deaths)/sum(new_cases)*100 as new_death_percentage
from coviddeaths_csv 
where continent is not null  
group by `date` 


