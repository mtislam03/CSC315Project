#CHEAT SHEET
#Simply copy and paste the query to run it
#All examples use Mercer as the default county and 2020 as the default year
#To change the default county and year locate them in the WHERE section of the query and change it

#Total EVs owned in Mercer in 2020
SELECT EVsOwned
FROM EVs
WHERE County = 'Mercer' AND Year = 2020;

#Total emmisions in Mercer in 2020
SELECT totalEmis
FROM GHG_Emissions
WHERE County = 'Mercer' AND Year = 2020;

#Total population in Mercer in 2020
SELECT Amount
FROM Population
WHERE County = 'Mercer' AND Year = 2020;

#Total emissions and population from Mercer in 2020
SELECT totalEmis, Amount
FROM Population, GHG_Emissions
WHERE GHG_Emissions.County = 'Mercer' AND GHG_Emissions.Year = 2020 AND Population.County = 'Mercer' AND Population.Year = 2020; 

#Total emissions and EVs owned from Mercer in 2020
SELECT totalEmis, EvsOwned
FROM EVs, GHG_Emissions
WHERE GHG_Emissions.County = 'Mercer' AND GHG_Emissions.Year = 2020 AND EVs.County = 'Mercer' AND EVs.Year = 2020;

#Total EVs owned and population from Mercer in 2020
SELECT EVsOwned, Amount
FROM Population, EVs
WHERE EVs.County = 'Mercer' AND EVs.Year = 2020 AND Population.County = 'Mercer' AND Population.Year = 2020; 

#Total population, EVs owned, and emmisions from Mercer in 2020
SELECT Amount, EvsOwned, totalEmis
FROM Population, EVs, GHG_Emissions
WHERE GHG_Emissions.County = 'Mercer' AND Population.County = 'Mercer' AND EVs.County = 'Mercer' AND GHG_Emissions.Year = 2020 AND Population.Year = 2020 AND Evs.Year = 2020; 
