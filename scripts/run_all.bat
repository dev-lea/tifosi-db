@echo off
mysql -u root -p < sql\01_schema.sql
mysql -u root -p tifosi < sql\02_insertion.sql
mysql -u root -p tifosi < sql\03_requetes.sql
pause
