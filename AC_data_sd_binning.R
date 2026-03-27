#### Load Packages
library(readxl)
library(dplyr)
library(writexl)

#### Import Data
ac_data_omit <- read_excel("ac_data_omit.xlsx")

#### Plot Distribution of Squared Flanker Points
hist(ac_data_omit$Squared_Flanker.Points, breaks=40, main="Distribution of Squared Flanker Points", xlab = "Squared Flanker Task Scores")

#### calculate mean and standard deviation 
sd <- sd(ac_data_omit$Squared_Flanker.Points)
mean <- mean(ac_data_omit$Squared_Flanker.Points)
sd_below <- mean - sd
sd_above <- mean + sd

#### plot mean and 1 standard deviations above/below
abline(v=sd_above, col="blue", lwd=2)
abline(v=sd_below, col="blue", lwd=2)
abline(v=mean, col="red", lwd=2)

#### Bin the data into Low, Medium, and High performance groups 
ac_data_omit$Flanker_Group <- ifelse(
  ac_data_omit$Squared_Flanker.Points <= sd_below, "Low",
  ifelse(
    ac_data_omit$Squared_Flanker.Points >= sd_above, "High",
    "Medium"
  )
)

#### Write binned data to an excel spreadsheet for Weka Analysis
write_xlsx(ac_data_omit, "ac_data_omit_bins_final.xlsx")
