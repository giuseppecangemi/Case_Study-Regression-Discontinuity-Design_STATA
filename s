const express = require("express");
const app = express();
const port = 3000;

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
reg y x
/********************************************************************************
Program: 				AMmain.do
Purpose: 				Main file for the Adult Mortality Chapter. 
						The main file will call other do files that will produce
						the AM indicators and produce tables.
Data outputs:			coded variables, table output on screen, and in excel tables.  
Author: 				Courtney Allen
Date last modified:		October 06, 2020
********************************************************************************/
set more off

*** User information for internal DHS use. Please disregard and adjust paths to your own. *** 
global user 33697	//change employee id number to personalize path

* change working path
global workingpath "C:/Users//$user//ICF/Analysis - Shared Resources/Code/DHS-Indicators-Stata/Chap16_AM"

* change data path
global datapath "C:/Users//$user//ICF/Analysis - Shared Resources/Data/DHSdata"


cd "$workingpath"

* select your survey

* IR Files
global irdata "ZMIR61FL"
	
* MR Files
global mrdata "ZMMR61FL"
	
* PR Files
global prdata "ZMPR61FL"
