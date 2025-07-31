 # Olympics Medal Analysis

 ## Table of Contents
- [Project Overview](#project-overview)
- [Dataset Description](#dataset-description)
- [Data Source](#data-source)
- [Data Cleaning & Preparation](#data-cleaning--preparation)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [SQL Queries](#sql-queries)
- [Results and Findings](#results-and-findings)
  

 
###  Project Overview
This project focuses on uncovering key insights from historical Olympic Games data using SQL. By analyzing athlete performances, team achievements, and medal trends from both summer and winter Olympics, this analysis highlights standout players, landmark wins, and consistent excellence over the years.

The dataset includes:

**1-Athletes** table : It has information about all the players who have participated in the olympics

**2-Athlete_events** table : It has information about all the events that have happened over the year.(athlete id refers to the id column in athlete table)


### Data source
The primary datasets used for this analysis is the "athletes.csv" and "athlete_events.csv" containing information about the 120 years of olympic history

### Data Cleaning & Preparation

In the initial data preparation phase,the following tasks were performed

1. Data loading and inspection

2. Data cleaning and formatting (name column in athlete table)

### Exploratory Data Analysis
Before diving into SQL queries, the dataset was explored to understand the structure and types of information present.

Olympic Games span Summer and Winter events from the 1890s to 2016.

Medal types include Gold, Silver, and Bronze.

Players can win multiple medals in the same year or across years.

### SQL Queries

All SQL queries used in this project are available in [`queries.sql`](https://github.com/aseelmuk/olympics_data_sql_analysis/blob/main/queries.sql).


### Results and Findings

**Team with Maximum Gold Medals:**
Identified the most successful team across all Olympic events in terms of gold medal wins.

**Top Pure Gold Medalist:**
Found the athlete who won the most golds without ever winning a silver or bronze — showcasing peak excellence without variability.

**Silver Medal Trends by Team:**
For each team, calculated total silver medals and the year in which they won the highest number of silvers.

**Top Gold Medalist Each Year:**
Listed the athlete(s) with the highest number of golds each year, handling ties by returning comma-separated names.

**India’s First Medal Wins:**
Identified the event and year where India won its first gold, silver, and bronze — providing a timeline of breakthrough moments.

**Dual-Season Gold Winners:**
Listed players who have achieved gold medals in both the Summer and Winter Olympics, a rare achievement.

**All-Round Medalists in One Year:**
Found players who managed to win gold, silver, and bronze in a single Olympic edition, demonstrating unmatched versatility.

**3-Consecutive Summer Olympic Golds (Post-2000):**
Detected athletes who won gold medals in three consecutive Summer Olympics from the year 2000 onward in the same event — proving long-term dominance.
