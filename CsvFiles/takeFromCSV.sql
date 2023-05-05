CREATE TABLE GHG_Emissions (
County char(15),
Year integer,
totalEmis integer,
Primary key (County, Year));

CREATE TABLE Population (
County char(15),
Year integer,
Amount integer,
Primary key (County, Year),
Foreign key(County, Year)
References GHG_Emissions(County, Year));

CREATE TABLE EVs (
County char(15),
Year integer,
EVsOwned integer,
Primary key (County, Year),
Foreign key(County, Year)
References GHG_Emissions(County, Year));

\Copy GHG_Emissions From 'emissions.csv' DELIMITER ',';
\Copy Population From 'census.csv' DELIMITER ',';
\Copy EVs From 'evs.csv' DELIMITER ',';
