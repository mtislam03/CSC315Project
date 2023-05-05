#! /usr/bin/python3

"""
This is an example Flask | Python | Psycopg2 | PostgreSQL
application that connects to the 7dbs database from Chapter 2 of
_Seven Databases in Seven Weeks Second Edition_
by Luc Perkins with Eric Redmond and Jim R. Wilson.
The CSC 315 Virtual Machine is assumed.

John DeGood
degoodj@tcnj.edu
The College of New Jersey
Spring 2020

----

One-Time Installation

You must perform this one-time installation in the CSC 315 VM:

# install python pip and psycopg2 packages
sudo pacman -Syu
sudo pacman -S python-pip python-psycopg2

# install flask
pip install flask

----

Usage

To run the Flask application, simply execute:

export FLASK_APP=app.py 
flask run
# then browse to http://127.0.0.1:5000/

----

References

Flask documentation:  
https://flask.palletsprojects.com/  

Psycopg documentation:
https://www.psycopg.org/

This example code is derived from:
https://www.postgresqltutorial.com/postgresql-python/
https://scoutapm.com/blog/python-flask-tutorial-getting-started-with-flask
https://www.geeksforgeeks.org/python-using-for-loop-in-flask/
"""

import psycopg2
from config import config
from flask import Flask, render_template, request

# Connect to the PostgreSQL database server
def connect(query):
    conn = None
    try:
        # read connection parameters
        params = config()
 
        # connect to the PostgreSQL server
        print('Connecting to the %s database...' % (params['database']))
        conn = psycopg2.connect(**params)
        print('Connected.')
      
        # create a cursor
        cur = conn.cursor()
        
        # execute a query using fetchall()
        cur.execute(query)
        rows = cur.fetchall()

        # close the communication with the PostgreSQL
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.')
    # return the query result from fetchall()
    return rows
 
# app.py
app = Flask(__name__)


# serve form web page
@app.route("/")
def form():
    return render_template('my-form.html')

# handle venue POST and serve result web page
@app.route('/countysearch', methods=['POST'])
def countysearch():
    if request.form['options'] == 'GHG_Emissions':
        rows = connect('SELECT totalEmis, Year FROM GHG_Emissions WHERE County = ' + request.form['county'] + ';')
        heads = ['totalEmis', 'Year']
    elif request.form['options'] == 'Population':
        rows = connect('SELECT Amount, Year FROM Population WHERE County = ' + request.form['county'] + ';')
        heads = ['Population', 'Year']
    elif request.form['options'] == 'EVs':
        rows = connect('SELECT EVsOwned, Year FROM EVs WHERE County = ' + request.form['county'] + ';')
        heads = ['EVsOwned', 'Year']
    else:
        rows = []
        heads = []

    return render_template('my-result.html', rows=rows, heads=heads)

@app.route('/selectsearch', methods=['POST'])
def selectsearch():
    rows = connect('SELECT * FROM ' + request.form['options'] + ' WHERE County = ' + request.form['county'] + ' AND Year = ' + request.form['year'] + ';')
    if request.form['options'] == 'GHG_Emissions':
        heads = ['county', 'year', 'emissions']
    elif request.form['options'] == 'Population':
        heads = ['county', 'year', 'population']
    elif request.form['options'] == 'EVs':
        heads = ['county', 'year', 'EVsOwned']
    else:
        heads = []
    return render_template('my-result.html', rows=rows, heads=heads)

if __name__ == '__main__':
    app.run(debug = True)
