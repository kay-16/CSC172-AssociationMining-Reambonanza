# CSC172 Association Mining Project Progress Report
**Student:** Kyla Reambonanza, 2022-1465  
**Date:** [Progress Submission Date]  
**Repository:** https://github.com/kay-16/CSC172-AssociationMining-Reambonanza.git

## 📊 Current Status
This table tracks the progress through the Association Rule Mining (ARM) pipeline.

| Milestone | Status | Notes |
| :--- | :--- | :--- |
| Data Loading & Cleaning | ✅ Completed | Missing values handled (documented in Preprocessing Notebook). |
| Data Preprocessing | ✅ Completed | Binning/Discretization of numerical features completed for BMI, PhysicalHealth, MentalHealth, and SleepTime columns. |
| **Transactional Conversion** | ⏳ On-going | Final One-Hot Encoding and conversion to sparse matrix format. |
| **Apriori Execution** | ⏳ Not Started | Ready to run the algorithm once the transactional file is complete. |
| Rule Evaluation & Filtering | ⏳ Not Started | Planned to start after generating the initial ruleset. |

## 1. Dataset Progress
* **Source Dataset:** Heart Disease Dataset (Kaggle)
* **Total Records (Transactions):** 319795 records
* **Total Items (Features) Before Encoding:** 18 original columns
* **Total Items (Features) After Encoding:** 64 total binary items (columns)
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
| Parameter | Value 1 | Value 2 |
| :--- | :--- | :--- |
| **Min Support** | [e.g., 0.05 (5%)] | [e.g., 0.01 (1%)] |
| **Min Confidence** | [e.g., 0.60 (60%)] | [e.g., 0.75 (75%)] |
| **Min Lift** | [e.g., 1.0] | [e.g., 1.2] |

**Sample Rule Metrics (Top 5 High-Lift Rules):**
| Rule (Antecedent $\implies$ Consequent) | Support | Confidence | **Lift** |
| :--- | :--- | :--- | :--- |
| [e.g., $\{\text{Age\_Senior}\} \implies \{\text{Outcome: Disease}\}$] | [e.g., 0.15] | [e.g., 0.85] | [e.g., 2.15] |
| [e.g., $\{\text{Chol\_High}\} \implies \{\text{Thal\_Fixed Defect}\}$] | [e.g., 0.08] | [e.g., 0.72] | [e.g., 1.88] |
| ... | ... | ... | ... |

**Visualization (Required for Deliverable 3):**
*Replace the placeholder below with your actual plot image, saved in your repository.*
![Co-occurrence Heatmap Placeholder](images/co-occurrence_heatmap.png)

## 3. Challenges Encountered & Solutions
| Issue | Status | Resolution |
| :--- | :--- | :--- |
| Bin boundary selection | ✅ Fixed | Justified the use of standard medical cutoffs (e.g., Cholesterol $>240$ for High) after researching medical guidelines. |
| Sparsity of data | ⏳ Ongoing | Pre-pruning items with a frequency of less than 0.5% (removed rare occupations/features). |
| Generating too many rules | ⏳ Planned | Will implement post-filtering, requiring Lift $\ge 1.2$ before final reporting. |

## 4. Next Steps (Before Final Submission)
- [ ] Complete final One-Hot Encoding and transactional file creation.
- [ ] Execute Apriori algorithm and generate initial ruleset.
- [ ] Calculate all required metrics: Support, Confidence, Lift, Conviction, and Leverage.
- [ ] **Critical:** Filter rules to only show those where the consequent is `Outcome: Disease` or `Outcome: No Disease`.
- [ ] Prepare final visualizations (Rule Network Graph, Heatmaps).
- [ ] Write complete README.md with metric interpretation and actionable insights.
- [ ] Record the 5-min demonstration video.