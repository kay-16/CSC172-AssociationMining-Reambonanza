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
| **Transactional Conversion** | ✅ Completed | Final One-Hot Encoding and conversion to sparse matrix format. |
| **Apriori Execution** | ✅ Completed | Ready to run the algorithm once the transactional file is complete. |
| Rule Evaluation & Filtering | ⏳ Not Started | Planned to start after generating the initial ruleset. |

## 1. Dataset Progress
* **Source Dataset:** Heart Disease Dataset (Kaggle)
* **Total Records (Transactions):** 319,795 records
* **Total Items (Features) Before Encoding:** 18 original columns
* **Total Items (Features) After Encoding:** 61 total binary items (columns)
* **Key Items Implemented:** `Discretization of continuous health variables for association rule mining.`, `Construction of a transactional sparse matrix using one-hot encoding`
* **Preprocessing Applied:**
    * Missing values imputed/dropped (documented in preprocessing notebook).
    * Discretization (Binning) applied to **BMI, PhysicalHealth, MentalHealth and SleepTime**.
    * Categorical features converted via **Discretization and One-Hot Encoding**.

### Data Preview (Item Frequency)
*Replace the placeholder below with your actual plot image, saved in your repository.*
![Item Frequency Bar Chart Placeholder](images/item_frequency.png)

## 2. Rule Mining Progress
This section tracks the metrics used to tune the Apriori algorithm.

**Current Parameters Tested:**
| Parameter          | Value 1    | Value 2    |
| :----------------- | :--------- | :--------- |
| **Min Support**    | 0.10 (10%) | 0.05 (5%)  |
| **Min Confidence** | 0.70 (70%) | 0.60 (60%) |
| **Min Lift**       | 1.0        | 1.2        |


**Sample Rule Metrics (Top 5 High-Lift Rules using Parameter Value 1):**
| Rule (Antecedent => Consequent) | Support | Confidence | Lift |
|---------------------------------|---------|------------|------|
| GenHealth\_Excellent => Diabetic\_No, PhysicalHealth\_cat\_None | 0.177 | 0.846 | 1.372 |
| GenHealth\_Excellent => PhysicalActivity\_Yes, PhysicalHealth\_cat\_None | 0.165 | 0.788 | 1.363 |
| GenHealth\_Excellent => DiffWalking\_No, PhysicalHealth\_cat\_None | 0.182 | 0.871 | 1.324 |
| GenHealth\_Excellent => HeartDisease\_No, PhysicalHealth\_cat\_None | 0.181 | 0.868 | 1.309 |
| GenHealth\_Excellent => Diabetic\_No, MentalHealth\_cat\_None | 0.147 | 0.704 | 1.301 |

**Visualization (Required for Deliverable 3):**
*Replace the placeholder below with your actual plot image, saved in your repository.*
![Co-occurrence Heatmap Placeholder](images/co-occurrence_heatmap.png)

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
- [ ] Calculate all required metrics: Support, Confidence, Lift, Conviction, and Leverage.
- [ ] **Critical:** Filter rules to only show those where the consequent is `Outcome: Disease` or `Outcome: No Disease`.
- [ ] Prepare final visualizations (Rule Network Graph, Heatmaps).
- [ ] Write complete README.md with metric interpretation and actionable insights.
- [ ] Record the 5-min demonstration video.