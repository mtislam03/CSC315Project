#!/bin/bash
dropdb CAB5
createdb CAB5
psql CAB5 -c '\i takeFromCSV.sql'
psql -c '\q'
