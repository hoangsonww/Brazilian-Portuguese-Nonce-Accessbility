# Brazilian Portuguese Nonce Word Acceptability Study

An R-based analysis investigating whether word structure (syllable length and initial segment type) influences acceptability judgments among native Brazilian Portuguese speakers, using a nonce-word forced-choice task.

## Table of Contents

1. [Project Overview](#project-overview)  
2. [Hypotheses](#hypotheses)  
3. [Data](#data)  
4. [Analysis & Outputs](#analysis--outputs)  
5. [Prerequisites](#prerequisites)  
6. [Installation](#installation)  
7. [Usage](#usage)  
8. [Script Breakdown](#script-breakdown)  
9. [Interpretation of Results](#interpretation-of-results)  
10. [Extending & Customizing](#extending--customizing)  
11. [Data Source](#data-source)  
12. [License](#license)  

---

## Project Overview

We analyze acceptability judgments for nonce words varying by:

- **Length**: number of syllables (e.g., monosyllabic vs. disyllabic)  
- **Initial segment**: type of onset (e.g., stop vs. fricative)  

Responses are binary (`accept` vs. `reject`). We visualize the contingency with mosaic plots and test for associations using chi-square tests.

---

## Hypotheses

- **Null hypothesis (H₀)**: Word structure (length & initial segment) does **not** influence acceptability judgments.  
- **Alternative hypothesis (H₁)**: Word structure **does** influence acceptability judgments.

---

## Data

- File: `bp-nonce.csv`  
- Columns:
  - `response`: `"accept"` or `"reject"`  
  - `length`: e.g. `"1"` (monosyllabic) or `"2"` (disyllabic)  
  - `initial`: initial segment category, e.g. `"stop"`, `"fricative"`, etc.  

---

## Analysis & Outputs

1. **Contingency table** of `response` × `length` × `initial`.  
2. **Mosaic plot** faceted by `length` and `initial`.  
3. **Chi-square test** of `response` vs. `initial`.  
   - p ≈ 0.59 → fail to reject H₀ at α = 0.05.  
4. **Chi-square test** of `length` vs. `initial`.  
   - p = 1.00 → no association (as expected).

---

## Prerequisites

- **R** ≥ 4.0  
- **RStudio** (optional)  
- Internet access (to install any missing packages)

### R Packages

- `ggplot2`  
- `ggmosaic`  

The script will install missing packages automatically.

---

## Installation

1. **Clone** the repository:
   ```bash
   git clone https://github.com/yourusername/bp-nonce-acceptability.git
   cd bp-nonce-acceptability
   ```

2. Place `bp-nonce.csv` in the project root.

---

## Usage

Run the analysis script:

```r
# In R or RStudio, set working directory and source:
setwd("path/to/bp-nonce-acceptability")
source("bp_nonce_analysis.R")
```

This will:

* Print the contingency tables
* Display the mosaic plot
* Print chi-square test results

---

## Script Breakdown

* **Load libraries** (`ggplot2`, `ggmosaic`)
* **Read data** from `bp-nonce.csv`
* **Summarize** with `xtabs(~ response + length + initial)`
* **Mosaic plot**:

  ```r
  ggplot(bp) +
    geom_mosaic(aes(weight=1, x=product(response), fill=response)) +
    facet_grid(length ~ initial) + …
  ```
* **Chi-square tests**:

  * `chisq.test(xtabs(~ response + initial, data=bp))`
  * `chisq.test(xtabs(~ length + initial,  data=bp))`

---

## Interpretation of Results

* **Response vs. Initial**: p = 0.59 → no significant association → fail to reject H₀.
* **Length vs. Initial**: p = 1.00 → variables are independent (by design).

Conclusion: No evidence that initial segment type influences acceptability. Word structure does **not** appear to affect judgments in this dataset.

---

## Extending & Customizing

* Test `response` vs. `length` directly.
* Add other predictors: stress pattern, coda type, etc.
* Use logistic regression (`glm(response ~ length + initial, family="binomial")`).
* Refine visualization colors, labels, or facet layouts.

---

## Data Source

* **Brazilian Portuguese nonce-word experiment**: collected via \[describe methodology or link here].
* **Dataset**: `bp-nonce.csv` (private dataset, see project repository).

---

## License

This project is licensed under the **MIT License**. See [LICENSE](LICENSE) for details.
