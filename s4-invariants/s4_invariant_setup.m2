-- Load required package
needsPackage "InvariantRing";

-- Define the polynomial ring with 8 variables (4 pairs of x,y coordinates)
R = QQ[x1, y1, x2, y2, x3, y3, x4, y4];
print "Polynomial ring:";
print R;

-- Create generators for S4 using lists of pairs for transpositions
L = {
    matrix {{0,1,0,0}, {1,0,0,0}, {0,0,1,0}, {0,0,0,1}}, -- (1 2)
    matrix {{1,0,0,0}, {0,0,1,0}, {0,1,0,0}, {0,0,0,1}}, -- (2 3)
    matrix {{1,0,0,0}, {0,1,0,0}, {0,0,0,1}, {0,0,1,0}}  -- (3 4)
};
print "Generator matrices:";
print L;

-- Create the block diagonal matrices that act on pairs of coordinates
blockL = apply(L, M -> (
    matrix apply(8, i -> apply(8, j -> (
        if odd i and odd j then M_(i//2,j//2) else
        if even i and even j then M_(i//2,j//2) else
        0
    )))
));
print "Block matrices:";
print blockL;

-- Create the group action
G = finiteAction(blockL, R);
print "Group action:";
print G;

-- Compute and display the invariant ring
invR = invariantRing G;
print "Invariant ring:";
print invR;
print "Invariant ring generators:";
print generators invR;
print "Number of generators:";
print length generators invR;

-- Create a new ring with variables for each generator
n = length generators invR;
S = QQ[z_1..z_n];
genList = generators invR;

-- Create the map between rings
f = map(R, S, genList);

-- Compute the kernel (relations)
relations = kernel f;
print "Relations between generators:";
print relations;
