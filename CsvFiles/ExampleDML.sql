SELECT totalEmis, Amount
FROM Population, GHG_Emissions
WHERE GHG_Emissions.County = 'Hudson' AND GHG_Emissions.Year = 2015; 

SELECT EVsOwned
FROM EVs
WHERE County = 'Ocean' AND Year = 2020; 

SELECT Amount, EvsOwned, totalEmis
FROM Population, EVs, GHG_Emissions
WHERE GHG_Emissions.County = 'Bergen' AND Population.County = 'Bergen' AND EVs.County = 'Bergen' AND GHG_Emissions.Year = 2020 AND Population.Year = 2020 AND Evs.Year = 2020; 
