# CAB Project Group 5

This is Group 5's CAB project for CSC 315.
The file to populate our tables is our takefromCSV.sql file. The site uses flask to run and our data used are ghg emissions, population, and EVs owned in all counties in NJ in the years 2015 and 2020.
Our GUI has two types of query searches. First one is to find the total GHG emmisions, population, or EVs owned of any NJ county for years 2015 and 2020. The second query will find the specified GHG emmisions, population, or EVs owned for a given county and year

## GETTING STARTED
Clone or download the repository. From there through the terminal move to where the files are downloaded to with the "cd" command in terminal. Then move into the CSV folder.
For example if they are in the Downloads folder:
```

cd Downloads
cd cab-project-5
cd CsvFiles

```

Run the following commands:

```
./builddb.sh
(If an error appears where you cannot run the file please execute this command and try again: chmod 555 builddb.sh)

cd -

export FLASK_APP=app.py

flask run
```

Then go to the link shown in the returned output.

## GUI
Main page
![UI Screenshot](https://user-images.githubusercontent.com/94715022/235547567-ae49d304-1b62-4c56-b7ee-3381f636eba9.png)

Example output 1
![UI Input 1](https://user-images.githubusercontent.com/94715022/235547573-3eac8761-44ca-429b-b869-e9a3c2be6c2d.png)

Example output 2
![UI Input 2](https://user-images.githubusercontent.com/94715022/235547576-a8c95aff-38da-4b24-a66a-e0683ec5a97a.png)
