CREATE TABLE GHG_Emissions (
County char(15) NOT NULL,
Year integer NOT NULL,
totalEmis integer,
Primary key (County, Year));

CREATE TABLE Population (
County char(15) NOT NULL,
Year integer NOT NULL,
Amount integer,
Primary key (County, Year)
Foreign key(County, Year)
References GHG_Emissions(County, Year));

CREATE TABLE EVs (
County char(15) NOT NULL,
Year integer NOT NULL,
EVsOwned integer,
Primary key (County, Year)
Foreign key(County, Year)
References GHG_Emissions(County, Year));
