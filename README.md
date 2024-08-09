
# Case study: How does a bike-share navigate speedy success?

## Introduction

For this capstone project, which is a part of my Google Data Analytics Professional Certificate, I will be working for a fictional company named Cyclistic. To answer the business questions and objectives, I will be using the six steps of the data analysis process:
* Ask
* Prepare
* Process
* Analyze
* Share 
* Act

Additionally, I will also be using [Rstudio](https://posit.co/) and the R programming language to perform my analysis.

## Scenario

You are a junior data analyst working on the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, your team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve your recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## Ask

Three questions will guide the future marketing program: 
1. How do annual members and casual riders use Cyclistic bikes differently? 
2. Why would casual riders buy Cyclistic annual memberships? 
3. How can Cyclistic use digital media to influence casual riders to become members?
Moreno has assigned you the first question to answer: How do annual members and casual riders use Cyclistic bikes differently?

**Business Task**: To determine the differences in bicycle usage between casual riders and annual members of Cyclistic.

**Key Stakeholders**: Director of Marketing (Lily Moreno) and Cyclistic Executive team

## Prepare

I am going to use Cyclistic historical trip data to analyze and identify trends. This dataset is made public by Motivate International Inc. under the Data License Agreement. Available data can be found [here](https://divvy-tripdata.s3.amazonaws.com/index.html).

**Key tasks**:

* I am utilizing the Divvy Trips 2019 and 2020 datasets, thus after downloading the data, I saved it in the file folder Cyclistic_2019_2020.

* I have identified that data is stored in a .csv file format with column names ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng and member_casual

* This data is reliable and credible as it is made available by Motivate International Inc. under the Data License Agreement.

## Process

**Key tasks**:

* I started the cleaning process in Excel by opening the above-mentioned files and making the specific column names consistent.

* Additionally, I deleted columns between spreadsheets that I was not going to use for my analysis.

* Then I added 2 columns named ride_length and day_of_week to calculate the duration of the ride and the day of the week customers were using bikes.

* Finally, I loaded the datasets into Rstudio for further analysis.

## Analyze

**Key tasks**:

* I started my analysis in R by installing the packages and loading the libraries.
 
* Next, I imported the datasets into R.

* Then, I merged the rows of the datasets.

* After merging, I performed calculations on the new dataset to derive the mean ride length and the max ride length, excluding 0 and NA values.

* I then began studying the annual members of the Cyclistic by filtering them from the merged dataset and deriving their mean ride length, min ride length, and max ride length, excluding 0 and NA values.

* Later, I did the same for casual members of Cyclistic.

* Lastly, I calculated the ride count of annual members and casual riders to see the difference.

## Share

**Key tasks**:

* I will start the sharing process by displaying the difference in ride count by customer type graphically to get a better understanding.

 ![Ride count by Customer Type](https://github.com/parv-raval/Cyclistic_case_study/blob/main/Ride_count_diff.png)

* Now, I will update the day_of_week column from a number to a weekday and change the order of weekdays based on our scenario, which starts on Sunday and ends on Saturday.
 
* For the next step, I will display the ride count by customer type for weedays.
 
 ![Ride Count by Customer Type for weekdays](https://github.com/parv-raval/Cyclistic_case_study/blob/main/weekday_ride_count.png)

* Now, let’s compare the average trip duration by customer type for weekdays.
 
 ![Avg trip duration by Customer Type for weekdays](https://github.com/parv-raval/Cyclistic_case_study/blob/main/avg_trip_duration.png)

**Data Insights**:

* Annual members tend to make more rides than casual members.
* Casual members, on the other hand, tend to make longer rides than annual members.
* On average, casual members spend more time on rides on Sunday.

## Act

Here, I will provide my 3 best recommendations based on my analysis.

* Offer weekend membership to casual riders at a lower price than an annual membership as they tend to spend more time on rides on those days.
* Provide extra discounts to casual riders for rides lasting more than an hour by launching a new membership program as they spend more time on the rides.
* Create marketing campaigns and commercials that highlight the advantages of obtaining an annual membership in order to target casual riders.

## Resources

[Rstudio](https://forum.posit.co/)

[Kaggle](https://www.kaggle.com/discussions?sort=hotness)

[LinkedIn](https://www.linkedin.com/feed/)

Check out my full analysis in R programming by clicking [here](https://rpubs.com/PlotTwist/cyclisticcasestudy).
