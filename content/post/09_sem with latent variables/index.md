---
title: "SEM (notes for myself)"
authors: 
  - admin
tags: [R, stats]
date: "2025-07-02"
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

# p.21

## Covariance Derivation

The covariance between two random variables $X_1$ and $X_2$ is defined
as:

$$
\text{Cov}(X_1, X_2) = \mathbb{E}\left[(X_1 - \mathbb{E}(X_1))(X_2 - \mathbb{E}(X_2))\right]
$$

### Step 1: Expanding the expression

First, expand the product inside the expectation:

$$
(X_1 - \mathbb{E}(X_1))(X_2 - \mathbb{E}(X_2)) = X_1X_2 - X_1\mathbb{E}(X_2) - \mathbb{E}(X_1)X_2 + \mathbb{E}(X_1)\mathbb{E}(X_2)
$$

### Step 2: Taking the expectation

Now, take the expectation of both sides:

$$
\mathbb{E}\left[(X_1 - \mathbb{E}(X_1))(X_2 - \mathbb{E}(X_2))\right] = \mathbb{E}(X_1X_2) - \mathbb{E}(X_1)\mathbb{E}(X_2) - \mathbb{E}(X_1)\mathbb{E}(X_2) + \mathbb{E}(X_1)\mathbb{E}(X_2)
$$

### Step 3: Simplifying the result

Notice that the terms $\mathbb{E}(X_1)\mathbb{E}(X_2)$ cancel out:

$$
\mathbb{E}(X_1X_2) - \mathbb{E}(X_1)\mathbb{E}(X_2)
$$

Thus, we arrive at the final formula for the covariance:

$$
\text{Cov}(X_1, X_2) = \mathbb{E}(X_1X_2) - \mathbb{E}(X_1)\mathbb{E}(X_2)
$$

------------------------------------------------------------------------

# p.22

## Covariance Derivation in Confirmatory Factor Analysis

We start with the observed variables $x_1$ and $x_2$:

$$
x_1 = \lambda_1 \xi_1 + \delta_1
$$ $$
x_2 = \lambda_2 \xi_1 + \delta_2
$$

We want to find $\text{Cov}(x_1, x_2)$:

$$
\text{Cov}(x_1, x_2) = \text{Cov}(\lambda_1 \xi_1 + \delta_1, \lambda_2 \xi_1 + \delta_2)
$$

Using bilinearity of covariance:

$$
= \lambda_1 \lambda_2 \text{Cov}(\xi_1, \xi_1) + \lambda_1 \text{Cov}(\xi_1, \delta_2) + \lambda_2 \text{Cov}(\delta_1, \xi_1) + \text{Cov}(\delta_1, \delta_2)
$$

Assuming:  
- $\text{Cov}(\xi_1, \delta_2) = 0$  
- $\text{Cov}(\delta_1, \xi_1) = 0$  
- $\text{Cov}(\delta_1, \delta_2) = 0$  
- $\text{Var}(\xi_1) = \phi_{11}$  

Then:

$$
\text{Cov}(x_1, x_2) = \lambda_1 \lambda_2 \phi_{11}
$$

------------------------------------------------------------------------

# p.23

## 1. Derivation: Cov(x, c′) = 0

Let $\mathbf{x}$ be a random vector and $\mathbf{c}$ a constant vector.

$$
\text{Cov}(\mathbf{x}, \mathbf{c}^\top) = \mathbb{E} \left[ (\mathbf{x} - \mathbb{E}[\mathbf{x}])(\mathbf{c}^\top - \mathbb{E}[\mathbf{c}^\top]) \right]
$$

But since $\mathbf{c}^\top$ is constant,
$\mathbb{E}[\mathbf{c}^\top] = \mathbf{c}^\top$, so:

$$
\mathbf{c}^\top - \mathbb{E}[\mathbf{c}^\top] = \mathbf{0}
$$

Hence:

$$
\text{Cov}(\mathbf{x}, \mathbf{c}^\top) = \mathbb{E} \left[ (\mathbf{x} - \mathbb{E}[\mathbf{x}]) \cdot \mathbf{0} \right] = \mathbf{0}
$$

## 2. Derivation: Var(x) = Cov(x, x′) = Σ

By definition:

$$
\text{Var}(\mathbf{x}) = \text{Cov}(\mathbf{x}, \mathbf{x}^\top) = \mathbb{E} \left[ (\mathbf{x} - \mathbb{E}[\mathbf{x}])(\mathbf{x} - \mathbb{E}[\mathbf{x}])^\top \right]
$$

This is the population covariance matrix, denoted as:

$$
\boldsymbol{\Sigma}
$$

## 3. Numerical Example in R

``` r
# Set seed and generate data
set.seed(123)

# Simulate random vector x (5 observations, 3 variables)
x <- matrix(c(1, 2, 3, 4, 5,
              2, 3, 4, 5, 6,
              5, 4, 3, 2, 1), ncol = 3)

x
```

    ##      [,1] [,2] [,3]
    ## [1,]    1    2    5
    ## [2,]    2    3    4
    ## [3,]    3    4    3
    ## [4,]    4    5    2
    ## [5,]    5    6    1

``` r
# Check: Cov(x, c') should be 0
x_centered <- scale(x, center = TRUE, scale = FALSE)
x_centered
```

    ##      [,1] [,2] [,3]
    ## [1,]   -2   -2    2
    ## [2,]   -1   -1    1
    ## [3,]    0    0    0
    ## [4,]    1    1   -1
    ## [5,]    2    2   -2
    ## attr(,"scaled:center")
    ## [1] 3 4 3

## 4. Confirm Var(x) = Cov(x, x′)

``` r
# Compute covariance matrix of x manually
# population covariance matrix
Sigma_manual_p <- t(x_centered) %*% x_centered / (nrow(x))
Sigma_manual_p
```

    ##      [,1] [,2] [,3]
    ## [1,]    2    2   -2
    ## [2,]    2    2   -2
    ## [3,]   -2   -2    2

``` r
# sample covariance matrix
Sigma_manual_s <- t(x_centered) %*% x_centered / (nrow(x) - 1)
Sigma_manual_s
```

    ##      [,1] [,2] [,3]
    ## [1,]  2.5  2.5 -2.5
    ## [2,]  2.5  2.5 -2.5
    ## [3,] -2.5 -2.5  2.5

``` r
# Compare with built-in cov()
# sample covariance matrix
Sigma_builtin <- cov(x)
Sigma_builtin
```

    ##      [,1] [,2] [,3]
    ## [1,]  2.5  2.5 -2.5
    ## [2,]  2.5  2.5 -2.5
    ## [3,] -2.5 -2.5  2.5
