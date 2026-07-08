# Student Retention Risk Model

Predicting student dropout risk from first-year academic and financial data, so student success teams can intervene before a student is lost.

---

## Overview

Analyzed a public dataset of 4,424 students across 36 demographic, academic, and financial features to understand what drives dropout versus graduation. Used Python (pandas, scikit-learn) to clean and explore the data and build a logistic regression classifier, with SQL used for exploratory querying. The resulting model separates dropouts from graduates with a **0.971 ROC AUC** and **94.1% accuracy** on held-out students.

---

## Main Problem & Objective

Institutions often identify at-risk students only after they've already disengaged, when intervention options are limited. The purpose of this project was to determine which factors most reliably predict dropout, and to build an early warning model that scores students by risk using data available shortly after their first semester, so student success teams can intervene before a student is lost.

---

## Questions Addressed

1. Which student and academic factors most strongly predict dropout risk?
2. How much does first semester academic performance signal ultimate dropout risk?
3. Do financial factors (tuition status, debtor status, scholarship) meaningfully affect dropout likelihood?
4. How does age at enrollment relate to dropout risk?
5. Can a logistic regression model reliably separate graduates from dropouts using data available by the end of the first year?

---

## Key Findings

- Of the 4,424 students, 32.1% dropped out, 49.9% graduated, and 17.9% were still enrolled.
- Students who passed zero curricular units in both the 1st and 2nd semester dropped out at an **80.8%** rate, versus 23.3% for everyone else — the single strongest early signal in the dataset.
- Tuition payment status was the strongest financial predictor: students behind on tuition dropped out at **86.6%**, compared to 24.7% for students current on payments.
- Debtor students dropped out at **62.0%**, more than double the 28.3% rate for non-debtors.
- Dropout risk rose steadily with age at enrollment, from 21.0% for 16–19 year olds up to 58.0% for 26–35 year olds.
- Scholarship holders dropped out at just **12.2%**, versus 38.7% for students without a scholarship.
- A logistic regression model trained on all 36 features achieved a **0.971 AUC** and **94.1% accuracy** on a held-out test set, with 1st and 2nd semester units approved as the two strongest predictors of staying enrolled.

---

## Tools Used

- **Python** (pandas, scikit-learn) — data cleaning, exploratory analysis, logistic regression model, evaluation
- **SQL** — exploratory querying and rate breakdowns
- **Tableau** — dashboard visualization (in progress)

---

## Approach

- **Data Cleaning & Validation** — Started from a pre-cleaned dataset of 4,424 students with 36 features and a three-class target (Dropout, Enrolled, Graduate).
- **Exploratory Analysis** — Broke down dropout rate by tuition status, debtor status, scholarship status, age band, and curricular units approved to identify the strongest single-variable signals.
- **Feature Engineering & Modeling** — Standardized numeric features and trained a logistic regression classifier on a binary Dropout vs. Graduate target, using a 75/25 train-test split.
- **Evaluation** — Assessed the model with ROC AUC and a full classification report on the held-out test set.
- **Visualization & Storytelling** — Tableau dashboard to visualize risk segments and model output (in progress).

---

## Recommendations

- Flag any student with zero approved curricular units after the 1st semester for immediate outreach — that group dropped out at over 80%, the clearest single risk indicator in the data.
- Track tuition payment status as a leading indicator. Students behind on tuition were more than three times as likely to drop out as those current on payments.
- Prioritize outreach to debtor students and enrollees aged 26+, both segments showed dropout rates roughly double the overall average.
- Since scholarship holders showed a meaningfully lower dropout rate, evaluate whether expanding financial aid eligibility to at-risk profiles could reduce attrition.
- Deploy the logistic regression model as a scoring tool immediately after 1st semester grades post, so at-risk students can be flagged before the 2nd semester begins.

---

## Project Structure

```
├── data/          # Dataset(s) (raw/, cleaned/)
├── notebooks/      # Exploratory analysis and modeling notebooks
├── src/           # Reusable data cleaning / modeling scripts
├── sql/           # Exploratory SQL queries
└── README.md
```

---

## Contact

David Quick — davvis_quick@icloud.com
