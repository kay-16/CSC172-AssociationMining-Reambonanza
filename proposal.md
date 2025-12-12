
# CSC172 Association Mining Project Proposal
**Student:** Kyla Reambonanza, 2022-1465  
**Date:** December 11, 2025

## 1. Project Title 
Association Rule Mining for Cardiovascular Comorbidity and Risk Factor Assessment

## 2. Problem Statement
According to the World Health Organisation (WHO), cardivascular diseases (CVDs) are the leading cause of death worldwide in fact, an estimated 19.8 million (~32%) people died from CVD in 2022 alone. However, risk factors rarely occur independently, and their combined presence could intensify the overall risk. Healthcare systems frequently depends on traditional statistical models that concentrate on single predictors instead of explicit, quantitative modelling of various and complex interactions. 

Therefore, this project addresses this challenge by employing Association Rule Mining (ARM) and investigate hidden rules (comorbidities) that relates to combinations of symptoms and risk factors (e.g., Age, Cholesterol) relating to heart disease. The resulting rules will then represent as a data-driven tool to aid medical experts determine high-risk patient profiles and patient-specific treatment plans.

## 3. Objectives
- Implement the Apriori Algorithm to effectively determine frequent itemsets and generate strong association rules for comorbidity patterns.

- Implement complete training pipeline including data preprocessing, model training, validation, and evaluation.

## 4. Dataset Plan
- Source: UCI Machine Learning Repository. https://doi.org/10.24432/C52P4X.

- Expected size: ~303 instances using the standard subset of 13 features

- Classes: 

- Acquisition: Download the Cleveland databas subset from UCI repository

## 5. Technical Approach
- Architecture sketch


| Step | Action | Description |
| :---: | :--- | :--- |
| 1 | Input Data | Raw patient records from the Cleveland dataset. |
| ↓ | | |
| 2 | Preprocessing | Discretization (e.g., Age into bins, Cholesterol into High/Normal) and One-Hot Encoding to create a binary transactional format. |
| ↓ | | |
| 3 | Transactional Data | Output: Sparse DataFrame (each column is a specific medical feature/risk level). |
| ↓ | | |
| 4 | Apriori Algorithm | Find Frequent Itemsets using a tuned minimum Support threshold. |
| ↓ | | |
| 5 | Rule Generation | Generate rules (A $\implies$ B) based on a minimum Confidence threshold. |
| ↓ | | |
| 6 | Evaluation & Filtering | Calculate Lift, Conviction, and Leverage. Filter for rules where Lift $>$ 1.0 (positive correlation). |
| ↓ | | |
| 7 | Final Output | Ranked list of comorbidity rules and network graph visualization. |

- Model: Apriori Algorithm
- Framework: Python (libraries to be used: Pandas, mixtend for ARM, Matplotlib/Seaborn/networkx for EDA/visualisation)
- Hardware: Jupyter Notebook

## 6. Expected Challenges & Mitigations
- Challenge: Discretization Bias. The choice of bin boundaries for continuous variables (Age, Cholesterol) can heavily influence the resulting rules.

- Solution: Iterative Binning. Test multiple discretization strategies (e.g., equal-width vs. medical cutoffs for cholesterol: >200 mg/dL is high) and justify the final choice based on medical relevance and resulting rule strength.

- Challenge: High-Dimensional Rule Explosion. The large number of features could generate too many redundant or trivial rules.

- Solution: Pre-pruning and Post-filtering. Pre-prune infrequent items (features) during preprocessing. Then, strictly filter final rules by imposing high thresholds for Confidence (e.g., >70) and Lift (e.g., >1.2) to focus only on strong, actionable rules.

## References
- World Health Organization (WHO), 2025. From: https://www.who.int/news-room/fact-sheets/detail/cardiovascular-diseases-(cvds)

- Janosi, A., Steinbrunn, W., Pfisterer, M., & Detrano, R. (1989). Heart Disease [Dataset]. UCI Machine Learning Repository. https://doi.org/10.24432/C52P4X.
