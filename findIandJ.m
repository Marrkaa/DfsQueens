% Suranda nurodytus virsunes eilute ir stulpeli
function [i, j] = findIandJ(k, row, col)
    i = ceil(k / col);
    j = mod((k - 1), row) + 1;
end