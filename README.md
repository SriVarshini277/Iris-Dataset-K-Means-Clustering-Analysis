# Iris Dataset K-Means Clustering Analysis
## Overview
This project explores unsupervised learning through k-means clustering on the Iris dataset, comparing different combinations of predictor variables and cluster counts to achieve optimal species prediction without using labeled data during model training.

## Dataset
The Iris dataset contains 150 observations with:
- **4 Predictor Variables:**
  - Sepal Length
  - Sepal Width
  - Petal Length
  - Petal Width
- **3 Species Classes:**
  - Setosa
  - Versicolor
  - Virginica

Dataset source: [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/Iris)

## Methodology

The analysis systematically evaluates multiple clustering configurations:

1. **Feature Combinations:**
   - All four features (sepal + petal measurements)
   - Petal measurements only (length + width)

2. **Cluster Counts (k):**
   - k = 3 (matching the number of species)
   - k = 5
   - k = 7

3. **Evaluation Metric:**
   - Clustering accuracy compared against true species labels

## Results

| Configuration | Features | k | Accuracy |
|--------------|----------|---|----------|
| **Best Model** | **Petal Length + Petal Width** | **3** | **96%** |
| All Features | All 4 measurements | 3 | ~89% |
| All Features | All 4 measurements | 5 | ~67% |
| All Features | All 4 measurements | 7 | ~57% |

### Key Findings

- **Optimal Predictors:** Petal length and petal width provide the best clustering performance
- **Optimal k-value:** k = 3 aligns with the natural structure of three species
- **Best Accuracy:** 96% achieved using only petal measurements with k = 3
- Increasing k beyond 3 reduces accuracy, suggesting over-segmentation

## Requirements

```r
R (version 3.5+)
ggplot2
cluster
datasets (built-in)
```

## Usage

Run the analysis script in R:

```r
source("Iris_solution.R")
```

The script will:
1. Load and explore the Iris dataset
2. Visualize the data distributions
3. Perform k-means clustering with various configurations
4. Generate confusion matrices and accuracy metrics
5. Create cluster visualization plots
6. Identify the optimal model configuration

## Project Structure

```
iris-kmeans-clustering-analysis/
│
├── Iris_solution.R                                        # Main R script with clustering analysis
├── Iris Dataset K-Means Clustering Analysis.pdf           # Detailed solution documentation with output visualization
└── README.md                                              # Project documentation
```

## Key Insights

The superior performance of petal measurements demonstrates that:
- Not all features contribute equally to clustering quality
- Petal characteristics are more discriminative for Iris species than sepal measurements
- Simpler feature sets can outperform more complex ones
- The natural grouping of three species is effectively captured by k = 3
