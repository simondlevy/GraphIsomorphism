function [V1,V2,W,x,c] = init(n, N)

% vector size
DIMS = 20000;

% permutation dictionary size
PDSIZE = 50;

% Perturbation coefficient
PERTURB = .05;

% Vertices are random vectors
V1 = noise(n, DIMS);
V2 = noise(n, DIMS);

% Create list of edge mappings for cleanup
e = zeros(N, DIMS);
for i = 1:N
    [k, j] = ind2sub([n n], i);
    e(i,:) = V1(j,:) .* V2(k,:);
end

% Build permutation dictionary from edge mappings
c.pd = permdict(e, PDSIZE);

% Build cleanup memory from edge mappings
c.cd = cleandict(e);

% Perturb mappings for initial state vector (necessary only for n = 2)
for i = 1:N
    e(i,:) = e(i,:) + PERTURB*randn;
end

% State vector is sum over edge mappings
x = sum(e);

% Start in box
x = normalize(x);

% Weights (evidence) vector
W = zeros(1, DIMS);