# Macaulay2 S4 Invariant Ring Computations

This repository contains Macaulay2 scripts for computing and analyzing invariant rings of the symmetric group S4, specifically focusing on the action on coordinates and their relations.

## Prerequisites

- [Macaulay2](http://www2.macaulay2.com/Macaulay2/) must be installed on your system
- The `InvariantRing` package must be available in your Macaulay2 installation

## Scripts

The repository contains two main scripts in the `s4-invariants` directory:

### 1. s4_invariant_setup.m2
This script sets up the basic S4 invariant ring computation:
- Defines the polynomial ring with 8 variables (4 pairs of x,y coordinates)
- Creates S4 group generators using transpositions
- Computes the invariant ring and its generators
- Calculates relations between generators

To run:
```bash
M2 s4-invariants/s4_invariant_setup.m2
```

### 2. coefficients.m2
This script analyzes the coefficient relationships:
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

## Contributing

This repository is part of an ongoing research collaboration. Please contact the repository owner for any questions or contributions.
