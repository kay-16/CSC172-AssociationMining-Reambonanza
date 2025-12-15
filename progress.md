# CSC172 Association Mining Project Progress Report
**Student:** Kyla Reambonanza, 2022-1465  
**Date:** December 16, 2025  
**Repository:** https://github.com/kay-16/CSC172-AssociationMining-Reambonanza.git

## 📊 Current Status
This table tracks the progress through the Association Rule Mining (ARM) pipeline.

| Milestone | Status | Notes |
| :--- | :--- | :--- |
| Data Loading & Cleaning | ✅ Completed | Missing values handled (documented in Preprocessing Notebook). |
| Data Preprocessing | ✅ Completed | Binning/Discretization of numerical features completed for BMI, PhysicalHealth, MentalHealth, and SleepTime columns. |
| Transactional Conversion | ✅ Completed | Final One-Hot Encoding and conversion to sparse matrix format. |
| Apriori Execution | ✅ Completed | Ready to run the algorithm once the transactional file is complete. |
| Rule Evaluation & Filtering | ✅ On-going | Planned to start after generating the initial ruleset. |

## 1. Dataset Progress
* **Source Dataset:** Heart Disease Dataset (Kaggle)
* **Total Records (Transactions):** 319,795 records
* **Total Items (Features) Before Encoding:** 18 original columns
* **Total Items (Features) After Encoding & Data Pruning:** 61 total binary items (columns)
* **Key Items Implemented:** `Discretization of continuous health variables for association rule mining.`, `Construction of a transactional sparse matrix using one-hot encoding`
* **Preprocessing Applied:**
    * Missing values imputed/dropped (documented in preprocessing notebook).
    * Discretization (Binning) applied to **BMI, PhysicalHealth, MentalHealth and SleepTime**.
    * Categorical features converted via **Discretization and One-Hot Encoding**.

### Data Preview

* <p><b>Item Frequency</b></p>
<img width="600" height="600" alt="item_freq_distribution" src="https://github.com/user-attachments/assets/0f13fa02-07a7-43a1-9ec0-fb17d0758286" />

## 2. Rule Mining Progress
This section tracks the metrics used to tune the Apriori algorithm.

**Current Parameters Tested:**
| Parameter          | Value 1    | Value 2    |
| :----------------- | :--------- | :--------- |
| **Min Support**    | 0.10 (10%) | 0.05 (5%)  |
| **Min Confidence** | 0.70 (70%) | 0.60 (60%) |
| **Min Lift**       | 1.0        | 1.2        |


**Sample Rule Metrics (Top 5 High-Lift Rules):** 
| Antecedents                     | Consequents                           | Support  | Confidence | Lift    |
|---------------------------------|---------------------------------------|---------|------------|--------|
| (GenHealth_Excellent)           | (PhysicalHealth_cat_None, Diabetic_No) | 0.17692 | 0.84644    | 1.3716 |
| (GenHealth_Excellent)           | (PhysicalHealth_cat_None, PhysicalActivity_Yes) | 0.16475 | 0.78820 | 1.3628 |
| (GenHealth_Excellent)           | (PhysicalHealth_cat_None, DiffWalking_No) | 0.18207 | 0.87110 | 1.3241 |
| (GenHealth_Excellent)           | (HeartDisease_No, PhysicalHealth_cat_None) | 0.18147 | 0.86820 | 1.3086 |
| (GenHealth_Excellent)           | (MentalHealth_cat_None, Diabetic_No) | 0.14707 | 0.70363 | 1.3015 |


**Visualization:**
* <p><b>Co-occurrence matrix for features that appear together frequently</b></p>
<img width="800" height="600" alt="co_occurrence_heatmaps" src="https://github.com/user-attachments/assets/ce9af723-7be2-42b2-a1df-f9b4b375ddce" />

## 3. Challenges Encountered & Solutions
| Issue | Status | Resolution |
| :--- | :--- | :--- |
| Bin boundary selection | ✅ Fixed | Justified the use of standard medical cutoffs (e.g., BMI $>31$ for Obese) after researching medical guidelines. |
| Github declines too large CSV file for preprocessed data | ✅ Fixed | Removed all large file in commit history then,added the CSV file to gitignore file; Use alternative storage to store the file (i.e., Google Drive) |
| Generating too many rules / memory limitations with Apriori | ✅ Fixed | Switched to FPGrowth to reduce memory usage; post-filtered itemsets and rules (e.g., removed trivial 1-itemsets, applied Lift $\ge 1.2$) before reporting. |
| Preprocessing: too many features / high dimensionality | ✅ Fixed | Applied **pruning** during preprocessing by removing irrelevant or redundant columns to reduce dimensionality before mining. |

## 4. Next Steps (Before Final Submission)
- [✓] Complete final One-Hot Encoding and transactional file creation.
- [✓] Execute Apriori algorithm and generate initial ruleset.
- [✓] Calculate all required metrics: Support, Confidence, Lift, Conviction, and Leverage.
- [ ] **Critical:** Filter rules to only show those where the consequent is `Outcome: Disease` or `Outcome: No Disease`.
- [✓] Prepare final visualizations (Rule Network Graph, Heatmaps).
- [ ] Write complete README.md with metric interpretation and actionable insights.
- [ ] Record the 5-min demonstration video.
