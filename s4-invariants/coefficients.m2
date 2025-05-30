-- Load required package
needsPackage "InvariantRing";

-- First define the polynomial ring and group action (copied from test.m2)
R = QQ[x1,y1,x2,y2,x3,y3,x4,y4];

-- Create generators for S4 using lists of pairs for transpositions
L = {
    matrix {{0,1,0,0}, {1,0,0,0}, {0,0,1,0}, {0,0,0,1}}, -- (1 2)
    matrix {{1,0,0,0}, {0,0,1,0}, {0,1,0,0}, {0,0,0,1}}, -- (2 3)
    matrix {{1,0,0,0}, {0,1,0,0}, {0,0,0,1}, {0,0,1,0}}  -- (3 4)
};

-- Create the block diagonal matrices
blockL = apply(L, M -> (
    matrix apply(8, i -> apply(8, j -> (
        if odd i and odd j then M_(i//2,j//2) else
        if even i and even j then M_(i//2,j//2) else
        0
    )))
));

-- Create the group action
G = finiteAction(blockL, R);

-- Compute invariant ring
invR = invariantRing G;

-- Now define the coefficient ring
T = QQ[
    c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14
];

-- Define the coefficient map components
coeffMap = map(R, T, {
    x1*x2*x3*x4,                                                              -- c1: a^4
    y1*x2*x3*x4 + x1*y2*x3*x4 + x1*x2*y3*x4 + x1*x2*x3*y4,                  -- c2: a^3b
    y1*y2*x3*x4 + y1*x2*y3*x4 + x1*y2*y3*x4 + y1*x2*x3*y4 + x1*y2*x3*y4 + x1*x2*y3*y4,  -- c3: a^2b^2
    y1*y2*y3*x4 + y1*y2*x3*y4 + y1*x2*y3*y4 + x1*y2*y3*y4,                 -- c4: ab^3
    y1*y2*y3*y4,                                                             -- c5: b^4
    x1*x2*x3 + x1*x2*x4 + x1*x3*x4 + x2*x3*x4,                             -- c6: a^3c
    y1*x2*x3 + x1*y2*x3 + x1*x2*y3 + y1*x2*x4 + x1*y2*x4 + y1*x3*x4 + y2*x3*x4 + x1*y3*x4 + x2*y3*x4 + x1*x2*y4 + x1*x3*y4 + x2*x3*y4,  -- c7: a^2bc
    y1*y2*x3 + y1*x2*y3 + x1*y2*y3 + y1*y2*x4 + y1*y3*x4 + y2*y3*x4 + y1*x2*y4 + x1*y2*y4 + y1*x3*y4 + y2*x3*y4 + x1*y3*y4 + x2*y3*y4,  -- c8: ab^2c
    y1*y2*y3 + y1*y2*y4 + y1*y3*y4 + y2*y3*y4,                             -- c9: b^3c
    x1*x2 + x1*x3 + x2*x3 + x1*x4 + x2*x4 + x3*x4,                         -- c10: a^2c^2
    y1*x2 + x1*y2 + y1*x3 + y2*x3 + x1*y3 + x2*y3 + y1*x4 + y2*x4 + y3*x4 + x1*y4 + x2*y4 + x3*y4,  -- c11: abc^2
    y1*y2 + y1*y3 + y2*y3 + y1*y4 + y2*y4 + y3*y4,                         -- c12: b^2c^2
    x1 + x2 + x3 + x4,                                                       -- c13: ac^3
    y1 + y2 + y3 + y4                                                        -- c14: bc^3
});

-- Get the coefficients as ring elements
coeffList = {
    x1*x2*x3*x4,                                                              -- c1: a^4
    y1*x2*x3*x4 + x1*y2*x3*x4 + x1*x2*y3*x4 + x1*x2*x3*y4,                  -- c2: a^3b
    y1*y2*x3*x4 + y1*x2*y3*x4 + x1*y2*y3*x4 + y1*x2*x3*y4 + x1*y2*x3*y4 + x1*x2*y3*y4,  -- c3: a^2b^2
    y1*y2*y3*x4 + y1*y2*x3*y4 + y1*x2*y3*y4 + x1*y2*y3*y4,                 -- c4: ab^3
    y1*y2*y3*y4,                                                             -- c5: b^4
    x1*x2*x3 + x1*x2*x4 + x1*x3*x4 + x2*x3*x4,                             -- c6: a^3c
    y1*x2*x3 + x1*y2*x3 + x1*x2*y3 + y1*x2*x4 + x1*y2*x4 + y1*x3*x4 + y2*x3*x4 + x1*y3*x4 + x2*y3*x4 + x1*x2*y4 + x1*x3*y4 + x2*x3*y4,  -- c7: a^2bc
    y1*y2*x3 + y1*x2*y3 + x1*y2*y3 + y1*y2*x4 + y1*y3*x4 + y2*y3*x4 + y1*x2*y4 + x1*y2*y4 + y1*x3*y4 + y2*x3*y4 + x1*y3*y4 + x2*y3*y4,  -- c8: ab^2c
    y1*y2*y3 + y1*y2*y4 + y1*y3*y4 + y2*y3*y4,                             -- c9: b^3c
    x1*x2 + x1*x3 + x2*x3 + x1*x4 + x2*x4 + x3*x4,                         -- c10: a^2c^2
    y1*x2 + x1*y2 + y1*x3 + y2*x3 + x1*y3 + x2*y3 + y1*x4 + y2*x4 + y3*x4 + x1*y4 + x2*y4 + x3*y4,  -- c11: abc^2
    y1*y2 + y1*y3 + y2*y3 + y1*y4 + y2*y4 + y3*y4,                         -- c12: b^2c^2
    x1 + x2 + x3 + x4,                                                       -- c13: ac^3
    y1 + y2 + y3 + y4                                                        -- c14: bc^3
};

-- Create the ideals
I = ideal coeffList;
J = ideal(generators invR);

-- Print the ideals to inspect them
print "Coefficient ideal:";
print I;
print "Invariant ring ideal:";
print J;

-- Check containment
print "Is I contained in J?";
print isSubset(I,J);
print "Is J contained in I?";
print isSubset(J,I); 