# Lemes-2022-digestate-NH3
Ammonia loss from field-applied digestate measured by wind tunnel.
This repo is for data analysis related to the manuscript.

# Maintainer
Yolanda Maria Lemes Perschke <https://pure.au.dk/portal/en/persons/yolanda-maria-lemes-perschke(fbcac929-5f57-4fcc-9d52-3cdc8cf05566).html>

# Directory structure
. . .

## `data`
Data files for producing plots and comparing slurry sources.
Several files show up as both Excel (`.xlsx`) and comma-separated text files (`.csv`).
Excel files are used for corrections and tracking data versions (see `ChangeLog` sheet) and then to produce the csv files, which are used by the R scripts for speed and to reduce the use of add-on packages. 

* `NH3_measurements` Measured cumulative ammonia loss over the complete duration of the emission measurement periods (18 or 30 hours).
* `OAV_2h_measurements` Average?? odor activity value (sum??) over the first two hours after slurry application.
* `SOAV_measurements` Sum (total) odor activity value over the entire measurement periods (18 or 30 hours)???
