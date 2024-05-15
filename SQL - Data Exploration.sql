
Covid 19 Data Exploration 2023

--------------------------------------------------------------------------------------------------------------------------


select *
from coviddeaths_csv 
where continent is not null 
order by 3, 4

select location , total_cases , new_cases , total_deaths , population 
from coviddeaths_csv 
order by 1 ,2

--------------------------------------------------------------------------------------------------------------------------


/*Looking at Total Cases vs Total Deaths*/

select location , `date` ,total_cases , total_deaths , 
	(total_cases/population)*100 as death_percentage
from coviddeaths_csv 
where location = 'Afghanistan'
order by 1 ,2

--------------------------------------------------------------------------------------------------------------------------


/*Looking at Total Cases vs Population*/

select location , `date` , population ,total_cases , total_deaths , (total_cases/population)*100 as death_percentage
from coviddeaths_csv 
where location = 'Africa'
order by 1 ,2

--------------------------------------------------------------------------------------------------------------------------


/*Looking at Countries with Highest Infection rate compared to Population*/

select location , population , max(total_cases) , 
		max(total_cases/population)*100 as percent_population_infected
from coviddeaths_csv 
group by location, population 
order by percent_population_infected desc 

--------------------------------------------------------------------------------------------------------------------------

*Showing Countries with Highest Death Count per Population*

select location , sum(total_deaths) as total_death_count
from coviddeaths_csv 
where continent  is not null 
group by location 
order by total_death_count desc 

--------------------------------------------------------------------------------------------------------------------------


/*BREAKING THINGS DOWN BY CONTINENT

Showing contintents with the highest death count per population*/

Select continent, MAX(cast(Total_deaths as int)) as total_death_count
From coviddeaths_csv
Where continent is not null 
Group by continent
order by total_death_count desc

--------------------------------------------------------------------------------------------------------------------------


*GLOBAL NUMBERS*

select `date` , sum(new_cases) as total_cases , sum(new_deaths) total_deaths ,
	sum(new_deaths)/sum(new_cases)*100 as new_death_percentage
from coviddeaths_csv 
where continent is not null  
group by `date` 

--------------------------------------------------------------------------------------------------------------------------


*Looking at Total Population vs Vaccination

select cd.continent , cd.location , cd.`date` , cd.population, cv.new_vaccinations 
from coviddeaths_csv cd 
join covidvacinations_csv cv
	on cd.location = cv.location 
		and cd.`date` = cv.`date` 
where cv.new_vaccinations is not null 

--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------

