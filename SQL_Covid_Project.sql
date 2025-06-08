SELECT *
FROM coviddeaths;

--The number of people who die by get infected by Covid-19
SELECT 
  location, 
  population, 
  total_cases, 
  total_deaths, 
  (total_deaths * 100.0 / NULLIF(total_cases, 0)) AS deaths_rate_per_cases,
  (total_deaths*100.0/NULLIF(population,0)) AS deaths_rate_per_population
FROM coviddeaths
WHERE 
	total_deaths IS NOT NULL
	
--The continent that has a highest infection rate and highest death rate
SELECT 
	location,  
	MAX(total_cases) AS highest_infection,
	MAX(total_deaths) AS highest_deaths,
	MAX((total_cases*100.0/NULLIF(population, 0))) AS infect_per_population,
	MAX((total_deaths*100.0/NULLIF(population, 0))) AS deaths_per_population
FROM coviddeaths
WHERE 
	total_cases IS NOT NULL
	AND continent IS NULL
	AND location NOT IN('International', 'European Union', 'World')
GROUP BY location
ORDER BY infect_per_population DESC;


--Country with highest infection rate 
SELECT 
	location, 
	population, 
	MAX(total_cases) AS highest_infection,
	MAX((total_cases*100.0/NULLIF(population, 0))) AS infect_per_population
FROM coviddeaths
WHERE 
	total_cases IS NOT NULL
	AND continent IS NOT NULL
GROUP BY location, population
ORDER BY 4 DESC;

--Country that has a highest death per population
SELECT 
	location,
	population,
	MAX(total_deaths) as higest_death,
	MAX((total_deaths*100.0/NULLIF(population, 0))) AS deaths_per_population
FROM coviddeaths
WHERE 
	total_deaths IS NOT NULL
	AND continent IS NOT NULL
GROUP BY location, population
ORDER BY deaths_per_population DESC;

--Global number
SELECT  
	SUM(new_cases) AS total_cases, 
	SUM(new_deaths) AS total_deaths,
	SUM(new_deaths)*100.0/NULLIF(SUM(new_cases),0) AS death_percentage
FROM coviddeaths
WHERE continent IS NOT NULL

--Join 2 table to compare a total population and total vaccination
WITH vaccination_summary AS (
    SELECT 
        dea.continent,
        dea.location,
        dea.date,
        dea.population,
        vac.new_vacinations,
        SUM(vac.new_vacinations) OVER (PARTITION BY dea.location ORDER BY dea.date) AS total_vaccination
    FROM coviddeaths AS dea
    JOIN covidvaccination AS vac
        ON dea.location = vac.location
        AND dea.date = vac.date
    WHERE dea.continent = 'Asia'
)
SELECT *,
       total_vaccination*100.0 / population AS vaccination_rate
FROM vaccination_summary
ORDER BY location, date

--Create view
CREATE VIEW percent_population_vaccinated AS
WITH vaccination_summary AS (
    SELECT 
        dea.continent,
        dea.location,
        dea.date,
        dea.population,
        vac.new_vacinations,
        SUM(vac.new_vacinations) OVER (PARTITION BY dea.location ORDER BY dea.date) AS total_vaccination
    FROM coviddeaths AS dea
    JOIN covidvaccination AS vac
        ON dea.location = vac.location
        AND dea.date = vac.date
    WHERE dea.continent IS NOT NULL
)
SELECT *,
       total_vaccination*100.0 / population AS vaccination_rate
FROM vaccination_summary
ORDER BY location, date

SELECT 
MAX(total_deaths)
FROM coviddeaths
WHERE continent = 'Europe'
	AND total_deaths IS NOT NULL






