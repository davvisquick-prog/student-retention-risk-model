/*
Question 1: Which student and academic factors most strongly predict dropout risk?

Side Note 1: This does not show the results to Q1 just yet but makes the baseline
*/

SELECT target, COUNT(*) AS students,
       ROUND(100.0*COUNT(*)/(SELECT COUNT(*) FROM student_retention),1) AS percentage
FROM student_retention
GROUP BY target;

/*
Question 2: How much does first semester academic performace signal dropout risk?

Answer 2: Answer: Students who passed zero curricular units in both the 1st and 2nd semester
   dropped out at 80.8%, versus 23.3% for everyone else. 
*/
SELECT
  CASE WHEN "Curricular units 1st sem (approved)" = 0
        AND "Curricular units 2nd sem (approved)" = 0
       THEN 'Zero units approved both semesters'
       ELSE 'At least one unit approved' END AS segment,
  COUNT(*) AS students,
  ROUND(100.0*SUM(CASE WHEN target='Dropout' THEN 1 ELSE 0 END)/COUNT(*),1) AS dropout_rate_pct
FROM student_retention
GROUP BY segment;

/*
Question 3: Do financial factors (tuition, debtor, scholarship) meaningfully affect dropout risk?

Answer 3: Yes since all three show large gaps. Students behind on tuition dropped out at
   86.6% vs 24.7% current. Debtors dropped out at 62.0% vs 28.3% non-debtors. Scholarship holders dropped out at just 12.2% vs 38.7% without a scholarship. */


-- Tuition Status
SELECT
  CASE WHEN "Tuition fees up to date" = 1 THEN 'Current on tuition' ELSE 'Behind on tuition' END AS segment,
  COUNT(*) AS students,
  ROUND(100.0*SUM(CASE WHEN target='Dropout' THEN 1 ELSE 0 END)/COUNT(*),1) AS dropout_rate_pct
FROM students
GROUP BY segment;

-- Debtor Status
SELECT
  CASE WHEN Debtor = 1 THEN 'Debtor' ELSE 'Not a debtor' END AS segment,
  COUNT(*) AS students,
  ROUND(100.0*SUM(CASE WHEN target='Dropout' THEN 1 ELSE 0 END)/COUNT(*),1) AS dropout_rate_pct
FROM students
GROUP BY segment;

-- Scholarship Status
SELECT
  CASE WHEN Scholarship_holder = 1 THEN 'Scholarship holder' ELSE 'No scholarship' END AS segment,
  COUNT(*) AS students,
  ROUND(100.0*SUM(CASE WHEN target='Dropout' THEN 1 ELSE 0 END)/COUNT(*),1) AS dropout_rate_pct
FROM students
GROUP BY segment;

/* Question 4: How does age at enrollment relate to dropout risk?
   Answer 4: Dropout risk rises steadily with age, from 21.0% for 16-19 year olds
   up to 58.0% for 27-35 year olds, nearly a 3x increase across the age range. */

SELECT
  CASE
    WHEN "Age at enrollment" BETWEEN 16 AND 19 THEN '16-19'
    WHEN "Age at enrollment" BETWEEN 20 AND 22 THEN '20-22'
    WHEN "Age at enrollment" BETWEEN 23 AND 26 THEN '23-26'
    WHEN "Age at enrollment" BETWEEN 27 AND 35 THEN '27-35'
    ELSE '36+'
  END AS age_band,
  COUNT(*) AS students,
  ROUND(100.0*SUM(CASE WHEN target='Dropout' THEN 1 ELSE 0 END)/COUNT(*),1) AS dropout_rate_pct
FROM students
GROUP BY age_band
ORDER BY age_band;