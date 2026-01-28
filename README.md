**Moneyball Project**

**Overview**

A data analysis project inspired by the Oakland Athletics' 2002 "Moneyball" strategy, using R to find replacement players for three key lost players based on statistical performance and salary constraints.

**Project Description**
This project analyzes baseball statistics to find cost-effective replacements for three players lost by the Oakland Athletics in 2001:
•	Jason Giambi (giambja01)
•	Johnny Damon (damonjo01)
•	Ray Olmedo (saenzol01)


The goal is to identify players who can provide similar offensive production (measured by On-Base Percentage) while staying within budget constraints.

**Key Features**

**Data Processing:**
1.	Data Loading: Batting statistics and salary data from CSV files
2.	Feature Engineering: Calculates key baseball metrics:
o	Batting Average (BA = H/AB)
o	On-Base Percentage (OBP = (H+BB+HBP)/(AB+BB+HBP+SF))
o	Slugging Average (SLG = (1B + 2*2B + 3*3B + 4*HR)/AB)
3.	Data Filtering: Limits analysis to post-1985 data when salary information becomes available
4.	Data Merging: Combines batting statistics with salary data


**Analytical Approach:**
1.	Identify Lost Players: Extracts 2001 statistics for the three players Oakland needs to replace
2.	Establish Constraints:
o	Total AB of lost players: 1469 (≈500 AB per replacement)
o	Salary limit: < $8 million per player
o	Minimum OBP: > 0
3.	Replacement Selection: Finds players meeting criteria and ranks by OBP


**Technical Details**

**Packages Used:**
•	readr: For reading CSV files
•	ggplot2: For data visualization
•	dplyr: For data manipulation and filtering

**Data Sources:**

•	Batting.csv: Historical batting statistics (1871+)
•	Salaries.csv: Player salary data (1985+)


**Core Analysis Steps:**
1.	Calculate Advanced Metrics: BA, OBP, SLG
2.	Filter Data: Keep only 1985+ data for salary compatibility
3.	Merge Datasets: Combine batting and salary data
4.	Identify Lost Players: Extract 2001 stats for Giambi, Damon, Olmedo
5.	Find Replacements: Filter 2001 players by:
o	Salary < $8 million
o	OBP > 0
o	AB ≥ 500
o	Sort by highest OBP

**Key Insights**

**Lost Players Summary (2001):**
•	Total At-Bats: 1469
•	Key metric focus: On-Base Percentage (OBP)
Replacement Strategy:
•	Look for players with high OBP at reasonable salaries
•	Minimum 500 AB to ensure consistent playing time
•	Salary cap of $8 million per player (below market rate for stars)


**Visualization:**
A scatter plot of OBP vs Salary helps identify the optimal value players - those with high OBP at lower salaries.
Results
The analysis identifies the top 10 potential replacement players sorted by OBP, from which the best 2-4 options (excluding Giambi himself) can be selected.


**How to Run**
1.	Install required packages
2.	Set correct file paths for CSV data
3.	Run script sequentially
4.	Review possible dataframe for replacement candidates


**Business Impact**
This analysis demonstrates how data-driven decision making can help sports teams:
•	Maximize limited budgets
•	Identify undervalued talent
•	Make evidence-based personnel decisions
•	Replace star players with cost-effective alternatives
Applications
While built for baseball, the methodology can be adapted to:
•	Player recruitment in other sports
•	Talent acquisition in business
•	Resource optimization problems
•	Value-based hiring decisions
