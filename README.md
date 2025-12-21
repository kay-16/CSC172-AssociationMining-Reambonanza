# Association Rule Mining for Cardiovascular Comorbidity and Risk Factor Assessment
**CSC172 Data Mining Final Project**  
*Mindanao State University - Iligan Institute of Technology*  
**Student:** Kyla Reambonanza, 2022-1465  
**Semester:** AY 2025-2026 Sem 1  
[![Python](https://img.shields.io/badge/Python-3.8+-blue)](https://python.org) [![PyTorch](https://img.shields.io/badge/PyTorch-2.0-orange)](https://pytorch.org)

## Abstract
Understanding comorbidity patterns associated with heart disease is essential for population-level health analysis and preventive decision-making. Cardiovascular disease, specifically diabetes and hypertension, contributes to the complication of risk factor evaluation and management because of interconnected pathophysiological mechanisms. Managing these conditions effectively requiress a combination of medication-based treatments with lifestyle changes to mitigate the increased cardiovascular risk (Mwende, 2024). Moreover, cardiovascular risk factors among patients with chronic diseases are often not adequately investigated and evaluated, leading in poor management (González-Gay & González-Juanatey, 2016).

Hence, this project employs association rule mining to determine meaningful relationships between health conditions, lifestyle factors, and heart disease outcomes using a large-scale public health dataset. The Heart Disease Dataset from Kaggle, consisting of 319,795 records and 18 original features, was used for this project. After preprocessing, including handling missing values,  discretization of continuous variables, specifically, BMI, physical health, mental health, and sleep time, one-hot encoding, and data pruning, the dataset was transformed into 61 binary items suitable for transactional analysis.

For scalability on large datasets, FP-Growth was utilised to determine frequent itemset mining was conducted with a minimum support threshold of 0.1 and a maximum itemset length of three. Association rules were generated using confidence-based filtering and evaluated using support, confidence, and lift metrics, with strong rules defined by confidence ≥ 0.7 and lift ≥ 1.2. The results reveal dominant patterns associated with positive health indicators, such as excellent general health, physical activity, and absence of physical or mental health issues, which strongly correlate with the absence of heart disease. However, due to significant class imbalance favoring healthy individuals, risk-factor-driven rules predicting heart disease presence were limited.

This project demonstrates a complete and reproducible association rule mining pipeline for large-scale health data, highlights the impact of dataset imbalance on unsupervised pattern discovery, and provides interpretable insights into population-level health associations.

## Table of Contents
- [Introduction](#introduction)
- [Related Work](#related-work)
- [Methodology](#methodology)
- [Experimental Findings & Discussions](#experimental-findings-&-discussions)
- [Ethical Considerations](#ethical-considerations)
- [Conclusion](#conclusion)
- [Installation](#installation)
- [References](#references)

## Introduction
### Problem Statement
According to the World Health Organisation (WHO), cardiovascular diseases (CVDs) are the leading cause of death worldwide; in fact, an estimated 19.8 million (~32%) people died from CVD in 2022 alone. However, risk factors rarely occur independently, and their combined presence could intensify the overall risk. Healthcare systems frequently depend on traditional statistical models that concentrate on single predictors instead of explicit, quantitative modelling of various and complex interactions. 

Therefore, this project addresses this challenge by employing Association Rule Mining (ARM) and investigate hidden rules (comorbidities) that relates to combinations of symptoms and risk factors (e.g., AgeCategory, BMI, SleepTime) relating to heart disease. The resulting rules will then represent as a data-driven tool to aid medical experts determine high-risk patient profiles and patient-specific treatment plans.

### Objectives
- Objective 1: Implement the Apriori Algorithm to effectively determine frequent itemsets and generate strong association rules for comorbidity patterns.
- Objective 2: Implement complete association rule mining including data preprocessing, frequent itemset mining, rule generation, parameter tuning, and evaluation.

## Related Work
- [Paper 1: YOLOv8 for real-time detection [1]]
- [Paper 2: Transfer learning on custom datasets [2]]
- [Gap: Your unique approach, e.g., Mindanao-specific waste classes] [web:25]

## Methodology
### Dataset Overview
- Source: Heart Disease Dataset (Kaggle)
    * Link: https://www.kaggle.com/datasets/kamilpytlak/personal-key-indicators-of-heart-disease/

- Original Features: 18 health-related attributes
- Post-Processing Features: 61 binary items after encoding and pruning
- The dataset is **highly imbalanced**, with the majority of individuals labeled as `HeartDisease = No`

### Preprocessing & Transformations
Applied Preprocessing Steps
- Missing values were handled via **imputation/removal**, as documented in the preprocessing notebook

- **Discretization (binning)** was applied to continuous variables:
    * BMI
    * PhysicalHealth
    * MentalHealth
    * SleepTime

- Categorical features were transformed using:
    * Discretization
    * One-Hot Encoding

- Resulting Dataset
    * The final dataset contains entirely of **binary features**, making it applicable for transactional association rule mining.

### Algorithm & Parameters
- Algorithm used:
    * FP-Growth: chosen for scalability on large datasets

- Key Parameters:
    * `min_support = 0.1`
    * `max_len = 3`

These parameters prioritise **frequent and statistically stable patterns**, reducing noise but potentially excluding rare disease-specific combinations.

### Architecture
**Architecture Design**
<img width="1000" height="1000" alt="archictecture diagram" src="https://github.com/user-attachments/assets/208a1009-1214-4403-b435-7c06338566ca" />

| Step | Action | Description |
| :---: | :--- | :--- |
| 1 | Input Data | Raw patient records from the CDC BRFSS heart disease dataset (Kaggle). |
| 2 | Preprocessing | Discretization and one-hot encoding (e.g., AgeCategory, BMI into Obese/Non-Obese, SleepTime into Short/Normal/Long) |
| 3 | Transactional Data | Output: Sparse DataFrame (each column is a specific medical feature/risk level). |
| 4 | Apriori Algorithm | Find Frequent Itemsets using a tuned minimum Support threshold. |
| 5 | Rule Generation | Generate rules (A $\implies$ B) based on a minimum Confidence threshold. |
| 6 | Evaluation & Filtering | Calculate Lift, Conviction, and Leverage. Filter for rules where Lift $>$ 1.0 (positive correlation). |
| 7 | Final Output | Ranked list of comorbidity rules, network graph visualization, item frequency bar charts, transaction length distribution, and co-occurrence heatmap |

### Frequent Itemset Filtering
- To remove trivial patterns, only itemsets consisiting more than one item were retained:

```python
freq_itemsets[
    freq_itemsets['itemsets'].apply(lambda x: len(x) > 1)
].sort_values(by='support', ascending=False)
```
This ensures analysis focuses on **interactions between conditions**, not single-variable dominance

### Association Rule Generation
**Rule Generation Criteria**
- Metric: **Confidence**
- Minimum Confidence Threshold: `0.7`
- Rules sorted by **Lift**
- Strong rules filtered using:
    * `life ≥ 1.2`

```python
rules = association_rules(freq_itemsets, metric='confidence', min_threshold=0.7)
strong_rules = rules[rules['lift'] >= 1.2]
```
**Focus on Heart Disease Outcome**
- Rules containing HeartDisease in the consequent were extracted to analyse outcome-related associations.

## Experimental Findings & Discussions
1. **Dominant Rule Patterns**
The strongest discovered rules consistently describe **protective health patterns**, such as:
- Excellent general health ⇒ No heart disease
- Excellent general health ⇒ No physical or mental health issues
- Excellent general health ⇒ Physical activity participation

Individuals reporting excellent general health are significantly more likely to be free from heart disease and related health issues, with confidence values exceeding 85% and lift values above 1.2.

2. **Why Risk-Factor Rules Were Limited**
An expected pattern such as: 
- {Smoking_Yes, Obese, Diabetes_Yes} ⇒ {HeartDisease_Yes}
was **not strongly represented** in the final rule set.

Explanation:
- The raw dataset is **heavily skewed toward health individuals**. For example, majority of the people have no heart disease compared to the few numbers of people with heart disease.
<img width="500" height="500" alt="output" src="https://github.com/user-attachments/assets/d3158185-0643-46ae-b2d6-f81a387892c7" />

- Heart disease positive cases are relatively rare
- FP-Growth with `min_support = 0.1` naturally prunes:
    * Rare but clinically meaningful disease combinations

This highlights a known limitation of frequent itemset mining applied to **imbalanced medical datasets**.

3. Metric Interpretation

| Metric | Meaning in this Study | 
| :---: | :--- |
| Support | Frequency of health patterns in the population | 
| Confidence | Likelihood of result given the antecedent | 
| Lift | Strength of association beyond random chance | 

- High lift values (>1.2) confirm that discovered patterns are **non-random and meaningful**, even when predicting disease absence.

4. Actionable Insights
- Strong rules consistently highlight **preventive health factors**, emphasizing the role of:
    * Self-reported general health
    * Physical activity
    * Absence of physical and mental health issues

- The findings reinforce public health perpectives that overall wellness indicators greatly correlate with the likelihood of having any heart disease.

5. **Limitations**
- Class imbalance limits discovery of rare disease-specific rules
- High minimum support leans towards dominant population patterns
- The association rule mining captures correlation, not causation

## Demo
![Detection Demo](demo/detection.gif)
[Video: [CSC173_YourLastName_Final.mp4](demo/CSC173_YourLastName_Final.mp4)] [web:41]

## Conclusion
This project successfully applied association rule mining using the FP-Growth algorithm to identify meaningful relationships within the dataset. Through effective data preprocessing and pruning, the model reduced complexity while preserving relevant and interpretable rules. The generated association rules revealed frequent co-occurring attributes, demonstrating the value of association mining in extracting actionable insights from a large dataset. 

Possible future directions relating to this project would to combining association rules with classification or recommendation models to support more advanced implementations. Additionally, further approach includes employing incremental association mining that may allow efficient managing of continuously growing data. Deploying on a lightweight platforms like Raspberry Pi may allow real-time association mining for Iot applications.

## Installation
1. Clone repo: `git clone https://github.com/yourusername/CSC173-DeepCV-YourLastName`
2. Install deps: `pip install -r requirements.txt`
3. Download weights: See `models/` or run `download_weights.sh`

**requirements.txt:**
torch>=2.0
ultralytics
opencv-python
albumentations

## References
[1]   <div class="csl-entry">Mwende, W. G. (2024). Cardiovascular Risk in Patients with Coexisting Diabetes and Hypertension: A Comprehensive Review. <i>IDOSR Journal of Applied Sciences</i>, <i>9</i>(3), 53–57. https://doi.org/10.59298/idosrjas/2024/9.3.535700</div>

[2]  <div class="csl-entry">González-Gay, M. A., &#38; González-Juanatey, C. (2016). 
Cardiovascular risk factor assessment: still an unmet need in chronic inflammatory diseases. <i>Heart</i>, <i>102</i>(24), 1937–1939. https://doi.org/10.1136/HEARTJNL-2016-310292</div>

[3] World Health Organization (WHO), 2025. From: https://www.who.int/news-room/fact-sheets/detail/cardiovascular-diseases-(cvds)

[4] Indicators of Heart Disease (2022 UPDATE) From: https://www.kaggle.com/datasets/kamilpytlak/personal-key-indicators-of-heart-disease/

## GitHub Pages
View this project site: [https://jjmmontemayor.github.io/CSC173-DeepCV-Montemayor/](https://jjmmontemayor.github.io/CSC173-DeepCV-Montemayor/) [web:32]
