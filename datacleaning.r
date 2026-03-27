#### Load Packages
library(readxl)
library(dplyr)
library(janitor)
library(writexl)

#### Import Data
ac_data <- read_excel("AttentionControl_Dataset.xlsx")
names(ac_data_f)

#### Remove demographic information to isolate the attentional control tasks
ac_data_f <- ac_data[-c(5,6,7,8,9,10,11,12,13,14)]

#### Make a list to incluce only the attentional control tasks 
ac_data_s <- ac_data[c(1,2,3,4)]

#### Find those under each attentional control task, to find those which have no scores
which(is.na(ac_data_f[c("Squared_Flanker.Points", "Squared_Flanker.Points", "Squared_Simon.Points")]))
sum(is.na(ac_data_f[c("Squared_Flanker.Points", "Squared_Flanker.Points", "Squared_Simon.Points")]))
is.na(ac_data_f[c("Squared_Flanker.Points")])
print(ac_data_omit$Subject)


ac_data_omit <- na.omit(ac_data_s[c("Subject", "Squared_Stroop.Points", "Squared_Flanker.Points", "Squared_Simon.Points")])
ac_data_omit_f <- na.omit(ac_data_f[c("Squared_Stroop.Points", "Squared_Flanker.Points", "Squared_Simon.Points")])


ac_data_omit_trial <- ac_data[!is.na(ac_data$Squared_Stroop.points), ]
ac_omit <- ac_data_f %>% 
  filter(!is.na("Squared_Stroop.Points")) %>% 
  filter(!is.na("Squared_Flanker.Points")) %>% 
  filter(!is.na("Squared_Simon.Points")) 

ac_data_omit_full <- ac_data_f %>% 
  filter(!is.na(Squared_Stroop.Points)) %>% 
  filter(!is.na(Squared_Flanker.Points)) %>% 
  filter(!is.na(Squared_Simon.Points)) 

ac_data_omit_tria <- ac_data %>% filter(!is.na(Squared_Stroop.points))


#### Write to a new excel sheet those with empty values removed
write_xlsx(ac_data_omit, "ac_data_omit.xlsx")
write_xlsx(ac_data_omit_full, "ac_data_omit_full.xlsx")





