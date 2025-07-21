---
title: "Missing Value (notes for myself)"
authors: 
  - admin
tags: [R, stats]
date: "2025-07-19"
categories: 
  - R
output:
  md_document:
    variant: gfm
    preserve_yaml: true
    toc: false
    toc_depth: 2
math: true
draft: false
---

# p.16-17

## Introduction

This part explains the detailed steps of calculating Little’s test
statistic to check for the **Missing Completely at Random (MCAR)**
assumption, as described in the provided example. The test is based on
comparing the means of observed and missing data patterns, with the
computation of the test statistic $T_L$ and its interpretation.

### Step 1: Define the Grand Means and Covariance Matrix

From the given example, the maximum likelihood estimates of the grand
means $\mu$ and the variance-covariance matrix $\Sigma$ are as follows:

$$
\hat{\mu} = \begin{bmatrix} 20.31 \\ 14.29 \end{bmatrix}, \quad
\hat{\Sigma} = \begin{bmatrix} 27.27 & -13.80 \\ -13.80 & 36.15 \end{bmatrix}
$$

- **20.31** is the mean of the first variable (denoted as $v_1$), i.e.,
  the average value for the first variable across all observations.

- **14.29** is the mean of the second variable (denoted as $v_2$), i.e.,
  the average value for the second variable across all observations.

- **27.27** is the variance of the first variable ($v_1$), representing
  the spread of values for the first variable.

- **36.15** is the variance of the second variable ($v_2$), representing
  the spread of values for the second variable.

- **-13.80** is the covariance between the first and second variables.
  This tells us how the two variables vary together. A negative value
  indicates that as one variable increases, the other tends to decrease.

These are the benchmarks against which we compare the pattern-specific
means for the observed data.

### Step 2: Define the Pattern-Specific Means

There are two missing data patterns in the dataset, represented by the
two groups. For this example, the two groups have the following
arithmetic means:

Group 1 (for $v_1 = 2, v_2 = 1$):

$$
\mathbf{\overline{Y}}_1 = \begin{bmatrix} 
23.27 \\ 
12.79 
\end{bmatrix}
$$

Group 2 (for $v_1 = 2, v_2 = 0$):

$$
\mathbf{\overline{Y}}_2 = \begin{bmatrix} 
17.19 \\   
{NA} 
\end{bmatrix}
$$

### Step 3: Compute the Test Statistic

The formula for the test statistic $T_L$ is as follows:

$$
T_L = \sum_{g=1}^{G} n_g \left( \mathbf{Y}_g - \mu_g \right)^\top \Sigma^{-1} \left( \mathbf{Y}_g - \mu_g \right)
$$

Where:

- $n_g$ is the number of cases in group $g$,
- $\mathbf{Y}_g$ is the group-specific mean,
- $\mu_g$ is the grand mean for the variable,
- $\Sigma^{-1}$ is the inverse of the covariance matrix.

#### For Group 1:

The difference between Group 1’s mean and the grand mean is:

$$
\mathbf{Y}_1 - \mu = \begin{bmatrix} 23.27 \\ 12.79 \end{bmatrix} - \begin{bmatrix} 20.31 \\ 14.29 \end{bmatrix} = \begin{bmatrix} 2.96 \\ -1.50 \end{bmatrix}
$$

$$
\left( \mathbf{Y}_1 - \mu \right)^\top = \begin{bmatrix} 2.96 & -1.50 \end{bmatrix}
$$ $$
\Sigma = \begin{bmatrix} 
27.27 & -13.80 \\
-13.80 & 36.15 
\end{bmatrix}
$$ For any 2x2 matrix:

$$
A = \begin{bmatrix} 
a & b \\
c & d 
\end{bmatrix}
$$

The inverse of this matrix $A^{-1}$ is given by:

$$
A^{-1} = \frac{1}{\text{det}(A)} \begin{bmatrix} 
d & -b \\
-c & a 
\end{bmatrix}
$$

Where $\text{det}(A)$ is the **determinant** of the matrix, and it is
calculated as:

$$
\text{det}(A) = ad - bc
$$

The determinant of $\Sigma$, denoted $\text{det}(\Sigma)$, is calculated
as:

$$
\text{det}(\Sigma) = (27.27)(36.15) - (-13.80)(-13.80)
$$

$$
\text{det}(\Sigma) = 985.8105 - 190.44 = 795.3705
$$

$$
\Sigma^{-1} = \frac{1}{795.3705} \begin{bmatrix} 
36.15 & 13.80 \\
13.80 & 27.27 
\end{bmatrix}
$$

$$
\Sigma^{-1} = \begin{bmatrix} 
\frac{36.15}{795.3705} & \frac{13.80}{795.3705} \\
\frac{13.80}{795.3705} & \frac{27.27}{795.3705} 
\end{bmatrix}
$$

$$
\Sigma^{-1} = \begin{bmatrix} 
0.04545052 & 0.0173504 \\
0.0173504 & 0.03428591 
\end{bmatrix}
$$ $$
\text{First, multiply:} \quad \begin{bmatrix} 2.96 & -1.50 \end{bmatrix} \times \begin{bmatrix} 
0.04545052 & 0.0173504 \\
0.0173504 & 0.03428591
\end{bmatrix}
$$ $$
\begin{bmatrix} 
(2.96)(0.04545052) + (-1.50)(0.0173504) & (2.96)(0.0173504) + (-1.50)(0.03428591) 
\end{bmatrix}
= \begin{bmatrix} 
0.1085079 & −0.000071681
\end{bmatrix}
$$

$$
\text{Then:} \begin{bmatrix} 
0.1085079 & −0.000071681
\end{bmatrix}
\quad \times \begin{bmatrix} 2.96 \\ -1.50 \end{bmatrix}
$$

$$
(0.1085079)(2.96) + (−0.000071681)(-1.50) = 0.3211834 + 0.0001075215 = 0.3212909
$$

This is the squared difference for Group 1. By multiplying this by
$n_1 = 141$, you get $45.30202$.

#### For Group 2:

The difference between Group 2’s mean and the grand mean is:

$$
\mathbf{Y}_2 - \mu = \begin{bmatrix} 17.19 \\ \text{NA} \end{bmatrix} - \begin{bmatrix} 20.31 \\ 14.29 \end{bmatrix} = \begin{bmatrix} -3.12 \\ \text{NA} \end{bmatrix}
$$

$$
\left( \mathbf{Y}_2 - \mu \right)^\top = \begin{bmatrix} -3.12 & NA \end{bmatrix}
$$

For missing data, we can’t compute the full Mahalanobis distance, but
for the observed part, we compute:

$$
\frac{(Y_{\text{obs}} - \mu_{\text{obs}})^2}{\text{Var}_{\text{obs}}}
$$ Which here becomes:

$$
\frac{(17.19 - 20.31)^2}{27.27}
$$

$$
134 \times \frac{(17.19 - 20.31)^2}{27.27} = 47.8331353136
$$

For this example:

$$
T_L = \left( \mathbf{Y}_1 - \mu \right)^\top \Sigma^{-1} \left( \mathbf{Y}_1 - \mu \right) + \left( \mathbf{Y}_2 - \mu \right)^\top \Sigma^{-1} \left( \mathbf{Y}_2 - \mu \right)
$$

Substituting the values:

$$
T_L = 45.30202 + 47.8331353136 = 93.13516
$$

### Step 4: Interpretation of the Result

The computed test statistic $T_L$ is **93.13516**, which is compared
against a chi-square distribution with degrees of freedom
$u = (2 + 1) - 2 = 1$.

Given that this test statistic is statistically significant (with
$p < 0.001$), we can conclude that the missing data is not **Missing
Completely at Random (MCAR)**.

------------------------------------------------------------------------

## Conclusion

This computation demonstrates the process of using Little’s test to
evaluate the MCAR assumption in a dataset. The test statistic value
indicates that the missing data in this example is **not MCAR**.
