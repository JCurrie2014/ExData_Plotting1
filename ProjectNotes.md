## Project Note - Exploratory Data Analysis (Project 1)
Date: 1/9/2015
Author: Jerry Currie

The goal of this exercise is to duplicate for plots (defined in README.md) using R and the R Studio. Electrical
usage data is provided where we'll read a subset (Feb 1 & 2 2007) of the data to create these plots.

#Pseudo Code for building the charts</br>
*load libraries
*Get data
*Create Plot Labels
*Create data subsets
*Plot 1 Chart
*Plot 2 Chart
*Plot 3 Chart
*Plot 4 Chart
 
Note: Found that there was no missing data for the time period. Missing data would be shown as "?", rather than
a numeric value. I included code to convert and "?" into "NA", so that I could exclude NAs from the data.frame

Note: Plot 4 shows the column label "Global_reactive_power" as the y-axis label. This label should be "Global 
reactive power", without the "_".  
 
