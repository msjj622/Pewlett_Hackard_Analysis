# Pewlett_Hackard_Analysis
## Overview of the analysis:
Creating charts for Pewlett-Hackard's company plan for retirement mentorship programs since the rates of retirements are going up in this company. I determined the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. Helped Bobby’s manager for the “silver tsunami” as many current employees reach retirement age and can find who is eiligible for the criteria.

## Results:
Created the Retirement Titles table with emp_no, first_name and last_name columns from Employees table and Filtered the employees who are born between January 1, 1952 and December 31, 1955.
![retirement_titles_image](https://github.com/msjj622/Pewlett_Hackard_Analysis/blob/main/Results/retirement_titles_image.png)

Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause. Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e., to_date) of the most recent title.
![unique_titles_image](https://github.com/msjj622/Pewlett_Hackard_Analysis/blob/main/Results/%20unique_titles_image.png)

Create a Retiring Titles table to hold the required information and grouped the table by title, then sort the count column in descending order.
![retiring_titles_image](https://github.com/msjj622/Pewlett_Hackard_Analysis/blob/main/Results/retiring_titles_image.png)

Using the ERD you created in this module as a reference and your knowledge of SQL queries, created a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965.
![mentorship_eligibilty_image](https://github.com/msjj622/Pewlett_Hackard_Analysis/blob/main/Results/mentorship_eligibilty_image.png)

## Summary
- How many roles will need to be filled as the "silver tsunami" begins to make an impact?
Total of 72,458 employees are eligible for retirement according to the birth date and 7 jon titles are holded.

- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees? No. only 1,549 are eligible for retirement.
