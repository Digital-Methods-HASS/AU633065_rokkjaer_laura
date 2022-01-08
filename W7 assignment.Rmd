---
title: "W7 assignment"
author: "Laura"
date: "15/10/2021"
output: html_document
---
  

library(tidyverse)
library(gganimate)
library(gifski)
library(av)
library(gapminder)

TASK1
#I start of by defining the function calcGDP where country and year is its arguments
#The functions comes with a few if-statements that will subset the data by year if the column is not empty as well as subset the result by country if country is not empty

calcGDP <- function(data, year=NULL, country=NULL) {
  if(!is.null(year)) {
    data <- data[data$year %in% year,]
  }
  if (!is.null(country)) {
    data <- data[data$country %in% country,]
  }
  
  #The following variable gdp will then be the calculation of population * GDPpercapita 
  GDP <- data$pop * data$gdpPercap
  
  #At last I will add GDP as a new column
  new <- cbind(data, GDP=GDP)
  return(new)
}

#The calcGDP function is now to be used to calculate the GDP in the given years
years <- c(1967,1977,1987,1997,2007,2017)
calcGDP(gapminder, year = years, country = "Denmark")
#The results is an extraction of the dataset with the years given and the new column of the GDP of Denmark in those years 



TASK2
#For this task i start of by printing all of the countries that starts with the letter B
#Next step is to define the message that needs to be printed 
Countries <- grep("^B", unique(gapminder$country), value = TRUE)
for (BCountries in Countries) {
  print(BCountries)
}
for(BCountries in Countries) {
  lifeExp <- (gapminder)[4]
  if (lifeExp >= 70) {
    print("lifeExp is higer than 70 years")
  } else if (lifeExp > 50) {
    print("lifeExp is between 50 and 70 years")
  } else {
    print("lifeExp is lower than 50 years")
  }
  
}



