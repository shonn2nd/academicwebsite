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
