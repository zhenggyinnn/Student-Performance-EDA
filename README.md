---

## 📊 Project Overview
This project examines student performance in math and Portuguese courses using two separate datasets and a merged dataset for students who are enrolled in both courses. The analysis involves investigating relationships between key factors such as health, family relationships, study time, and final grades.

### Goals:
1. Explore and visualize the distributions of key variables.
2. Identify patterns and relationships between variables.
3. Summarize key findings and provide recommendations based on the analysis.

---

## 📄 Datasets
### 1. **Math Course Dataset (`student-math.csv`)**
   - Contains information on students enrolled in the math course, including demographic data, family background, and academic performance.

### 2. **Portuguese Course Dataset (`student-por.csv`)**
   - Contains similar information as the math dataset but for students enrolled in the Portuguese course.

### 3. **Merged Dataset (`student-merged.csv`)**
   - Students who are enrolled in **both** math and Portuguese courses.
   - Used for cross-course analysis to uncover insights about shared students.

---

## ⚙️ Analysis
The EDA process was conducted using **R** and includes the following steps:
1. Data Cleaning: Checking for missing or erroneous values.
2. Descriptive Statistics: Calculating key metrics like mean, median, and standard deviation.
3. Visualization: Creating plots such as violin plots, box plots, mosaic plots, and histograms.
4. Relationships Analysis: Investigating relationships between variables (e.g., family relationships, health levels, study time).

The full R script can be found in `student-merge.R`.

---

## 📑 Report
The findings and recommendations from the EDA are summarized in the final report (`report/eda_report.pdf`). It includes:
- Key insights into the data.
- Observed trends and patterns.
- Recommendations for improving student performance based on the analysis.

---

## 🛠️ Getting Started
To run the analysis or explore the datasets:
1. Clone this repository: 
   ```bash
   git clone https://github.com/zhenggyinnn/Student-Performance-EDA.git
