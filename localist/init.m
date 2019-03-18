function [V1,V2,W,x,c] = init(n, N)

% Perturbation coefficient
PERTURB = 1e-2;

% Characteristic (solution) vector starts at barycenter of simplex.
% Ross calls this the mapping vector M.
x = normalize(ones(N,1));

% We perturb at the beginning, unlike Pelillo, who converges, perturbs,
% and re-converges.
x = normalize(x + PERTURB * randn(size(x)));

% Adjacency matrix of N-vertex association graph.  Ross calls this C.
W = zeros(N);

% Vertices do not need to be explicitly represented for localist version
V1 = [];
V2 = [];

% No cleanup for localist version
c = [];



