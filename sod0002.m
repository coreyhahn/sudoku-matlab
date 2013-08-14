function x = sod0001()
% row first
x = zeros(9,9);
c = [1 1 2 2 2 3 4 4 4 4 5 5 6 6 6 7 7 7 8 8 8 9 9];
r = [2 8 5 7 9 8 1 5 6 7 3 5 2 3 6 1 2 9 3 6 7 5 6];
n = [7 9 5 4 2 3 6 1 3 2 9 8 3 1 6 4 6 1 8 4 6 3 5];

for m = 1:length(n);
    x(r(m),c(m)) = n(m);
end

