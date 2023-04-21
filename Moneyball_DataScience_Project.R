# Moneyball Project

# Use R to open the Batting.csv file 
library(readr)
library(ggplot2)
Batting <- read_csv("C:/Users/User/Desktop/Batting.csv")

# Use head() to check out the batting
head(Batting)

# Use str() to check the structure
str(Batting)

# Call the head() of the first five rows of AB (At Bats) column 
head(Batting$AB)


# Call the head of the doubles (X2B) column 
head(Batting$X2B)

#  Add three more statistics that were used in Moneyball
# Batting average (AVH = H/AB)
Batting$BA <- Batting$H / Batting$AB

# Check the last 5 entries of the BA column of the data frame
tail(Batting$BA,5)

# Adding new column :On Base Percentage (OBP) and  Slugging Average (SLG)
# Creating On Base Percentage
Batting$OBP <- (Batting$H + Batting$BB + Batting$HBP)/(Batting$AB + Batting$BB + Batting$HBP + Batting$SF)

# Creating Slugging Average (SLG)
Batting$SLG <- ((1 * Batting$X1B) + (2 * Batting$X2B) + (3 * Batting$X3B) + (4 * Batting$HR) ) / Batting$AB

# Check the structure of the data frame using str() 
str(Batting)


# Merging Batting data with Salary data
Salaries <- read_csv("C:/Users/User/Desktop/Salaries.csv")

# Use summary to get a summary of the batting data frame and notice the minimum year in the yearID column. 
# Our Batting data goes back to 1871 and Our salary data starts at 1985, we need to remove the Batting data that occured before 1985. 
summary(Batting)

# Use subset() to reassign batting to only contain data from 1985 and onwards 
Batting <- subset(Batting,yearID >= 1985)

# Now use summary again to make sure the subset reassignment worked, the yearID min should be 1985 
summary(Batting)

# Use the merge() function to merge the batting and Salary data frames by c('playerID','yearID')and call the new data frame combo
combo <- merge(Batting,Salaries,by=c('playerID','yearID'))

# Use summary to check the data 
summary(combo)


# Analyzing the lost players 

# Use the subset() function to get a data frame called lost_players from the combo data frame consisting of the 3 players 
# 3 players are  Jason Giambi (giambja01), Johnny Damon (damonjo01) and Rainer Gustavo "Ray" Olmedo ('saenzol01')
lost_players <- subset(combo,playerID %in% c('giambja01','damonjo01','saenzol01') )

lost_players

# Use subset to only grab the rows where the yearID was 2001, 
# 2001 was the year when Oakland lost those players. Limiting data to 2001 and required columns:
lost_players <- subset(lost_players,yearID == 2001)

head(lost_players)


# Replacement Players

# Display only grab available players from year 2001 
library(dplyr)

avail.players <- filter(combo,yearID==2001)

# Make a quick plot to see where I should cut-off for salary in respect to OBP
ggplot(avail.players,aes(x=OBP,y=salary)) + geom_point()

# Getting rid of players with OBP==0
avail.players <- filter(avail.players,salary<8000000,OBP>0)

#  Cut off my available players at 1500/3= 500 AB since the total AB of the lost players is 1469
avail.players <- filter(avail.players,AB >= 500)

# Sort out OBP
possible <- head(arrange(avail.players,desc(OBP)),10)

possible

#  Select other best players (2-4) except giambja 
possible[2:4,]




