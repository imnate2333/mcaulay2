# S4 Invariant Ring Computations

This module contains Macaulay2 scripts for computing and analyzing invariant rings of the symmetric group S4, specifically focusing on the action on coordinates and their relations.

## Prerequisites

- [Macaulay2](http://www2.macaulay2.com/Macaulay2/) must be installed on your system
- The `InvariantRing` package must be available in your Macaulay2 installation

## Scripts

### 1. s4_invariant_setup.m2
Sets up the basic S4 invariant ring computation:
- Defines the polynomial ring with 8 variables (4 pairs of x,y coordinates)
- Creates S4 group generators using transpositions
- Computes the invariant ring and its generators
- Calculates relations between generators

To run:
```bash
M2 s4-invariants/s4_invariant_setup.m2
```

### 2. coefficients.m2
Analyzes the coefficient relationships:
- Sets up the coefficient ring and mapping
- Computes ideals and checks containment
- Verifies relationships between coefficients and invariants

To run:
```bash
M2 s4-invariants/coefficients.m2
```

## Mathematical Background

These scripts work with the action of S4 on four points in the plane, represented by their x and y coordinates. The computations focus on:
- Finding invariant polynomials under the S4 action
- Computing relations between generators
- Analyzing coefficient structures and ideal containments

## Invariant Structure: Monomial Basis Decomposition

The invariants decompose into the following terms with their corresponding monomial labels:

### Degree 4 Terms
- `x1x2x3x4` (a⁴)
- `y1x2x3x4 + x1y2x3x4 + x1x2y3x4 + x1x2x3y4` (a³b)
- `y1y2x3x4 + y1x2y3x4 + x1y2y3x4 + y1x2x3y4 + x1y2x3y4 + x1x2y3y4` (a²b²)
- `y1y2y3x4 + y1y2x3y4 + y1x2y3y4 + x1y2y3y4` (ab³)
- `y1y2y3y4` (b⁴)

### Degree 3 Terms
- `x1x2x3 + x1x2x4 + x1x3x4 + x2x3x4` (a³c)
- `y1x2x3 + x1y2x3 + x1x2y3 + y1x2x4 + x1y2x4 + y1x3x4 + y2x3x4 + x1y3x4 + x2y3x4 + x1x2y4 + x1x3y4 + x2x3y4` (a²bc)
- `y1y2x3 + y1x2y3 + x1y2y3 + y1y2x4 + y1y3x4 + y2y3x4 + y1x2y4 + x1y2y4 + y1x3y4 + y2x3y4 + x1y3y4 + x2y3y4` (ab²c)
- `y1y2y3 + y1y2y4 + y1y3y4 + y2y3y4` (b³c)

### Degree 2 Terms
- `x1x2 + x1x3 + x2x3 + x1x4 + x2x4 + x3x4` (a²c²)
- `y1x2 + x1y2 + y1x3 + y2x3 + x1y3 + x2y3 + y1x4 + y2x4 + y3x4 + x1y4 + x2y4 + x3y4` (abc²)
- `y1y2 + y1y3 + y2y3 + y1y4 + y2y4 + y3y4` (b²c²)

### Degree 1 Terms
- `x1 + x2 + x3 + x4` (ac³)
- `y1 + y2 + y3 + y4` (bc³)

### Constant Term
- 1 (c⁴) 