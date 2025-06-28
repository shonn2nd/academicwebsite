---
title: "Why Do We Need to Care About Endogeneity?"
authors: 
  - admin
tags: [R, stats]
date: "2025-06-28"
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

Let’s consider a simple linear regression model:

$$
y = \beta_0 + \beta_1 x + \varepsilon
$$

Where:

- $y$: outcome variable  
- $x$: predictor  
- $\varepsilon$: error term (disturbance or residual)  
- $\beta_0, \beta_1$: parameters to estimate

------------------------------------------------------------------------

## What OLS Assumes

For the OLS (Ordinary Least Squares) estimator to be **unbiased**, one
of the Gauss-Markov assumptions is:

$$
\mathbb{E}[\varepsilon \mid x] = 0 \quad \text{or} \quad \text{Cov}(x, \varepsilon) = 0
$$

This means the error term must **not** be correlated with the predictor
$x$.

------------------------------------------------------------------------

## What If $\text{Cov}(x, \varepsilon) \neq 0$?

Let’s derive the OLS estimate of $\beta_1$:

$$
\hat{\beta}_1 = \frac{\text{Cov}(x, y)}{\text{Var}(x)}
$$

Substitute $y = \beta_0 + \beta_1 x + \varepsilon$:

$$
\text{Cov}(x, y) = \text{Cov}(x, \beta_0 + \beta_1 x + \varepsilon) = \beta_1 \text{Var}(x) + \text{Cov}(x, \varepsilon)
$$

So the estimator becomes:

$$
\hat{\beta}_1 = \frac{\beta_1 \text{Var}(x) + \text{Cov}(x, \varepsilon)}{\text{Var}(x)}
$$

$$
\Rightarrow \hat{\beta}_1 = \beta_1 + \frac{\text{Cov}(x, \varepsilon)}{\text{Var}(x)}
$$

------------------------------------------------------------------------

## Consequence

If $\text{Cov}(x, \varepsilon) \neq 0$, then:

- $\hat{\beta}_1 \neq \beta_1$
- Your estimate is **biased**
- You cannot trust the regression results to reflect a true causal
  relationship

------------------------------------------------------------------------

## Interpretation

Imagine you’re studying the effect of **study hours (**$x$) on **test
scores (**$y$).  
If **motivation** affects both study hours and test scores but is **not
included** in the model, it ends up in the error term $\varepsilon$.  
Since $x$ (study hours) is related to motivation, now $x$ is
**correlated with** $\varepsilon$.  
As a result, your estimate of the effect of study hours on test scores
($\hat{\beta}_1$) will be **biased**.
