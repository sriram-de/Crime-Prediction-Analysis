SELECT count(*) FROM crime_schema.crime_chicago_data;

SELECT DISTINCT(PRIMARY_TYPE) from crime_schema.crime_chicago_data WHERE LOCATION_DESCRIPTION ='STREET' ; 

SELECT DISTINCT(Location_Description), Month FROM crime_schema.crime_chicago_data GROUP BY Month; 

SELECT Location_Description, count(Location_Description) as No_of_Crimes FROM crime_schema.crime_chicago_data where PRIMARY_TYPE = 'THEFT' GROUP BY Location_Description ORDER BY count(Location_Description) DESC;

SELECT Day, count(Day) as No_of_crimes FROM crime_schema.crime_chicago_data GROUP BY Day ORDER BY count(Day) DESC;

SELECT COUNT(*) as No_of_Arrest_True FROM crime_schema.crime_chicago_data WHERE arrest = 'TRUE';
SELECT COUNT(*) as No_of_Arrest_False FROM crime_schema.crime_chicago_data WHERE arrest = 'FALSE';