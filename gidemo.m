function gidemo(a1, a2, seed)
%
% GIDEMO Demonstration of Graph Isomorphism solution by replicator
% equations
%
%   GIDEMO(A1, A2) runs the graph isomorphism demo on adjacency matrices A1
%   and A2.  Typically these will be the same matrix.
%
%   GIDEMO(A1, A2, SEED) supports random-number-generator seed for
%   reproducibility.
%
%   For original localist version:
%
%       >> addpath localist
%
%   For VSA version:
%
%       >> addpath vsa
%
%   Example:
%
%       >> gidemo(fig1, fig1)
%
%   Based on 
%
%     @Article{Pelillo1999,
%       author =  {Marcello Pelillo},
%       title =   {Replicator Equations, Maximal Cliques, and Graph
%                  Isomorphism},
%       journal = {Neural Computation},
%       year = 	  {1999},
%       volume =  {11},
%       pages =   {1933-1955}
% }

% Distance between L2 norms of successive solutions for convergence
EPSILON = 1e-4; % 1e-17 in Pelillo (1999)

% noise floor
ZERO = 0.1;

% Bozo filters

if any(size(a1) ~= size(a2))
    error('Matrices must be same size')
end

if any(diag(a1) | diag(a2))
    error('Self-connections prohibited')
end

% Seed random-number generator if indicated
if nargin > 2
    rand('state', seed)    
    randn('state', seed)
end

% "Little n" is size of adjacency matrix
n = length(a1);

% "Big N" is size of compatability matrix
N = n^2;

% initial vertices, weights, state, and cleanup
[V1,V2,W,x,c] = init(n, N);

% Fill weights matrix with evidence
for ih = 1:N
    [h, i] = ind2sub([n n], ih);
    for jk = 1:N
        [k, j] = ind2sub([n n], jk);
        if i ~= j && h ~= k
            if  1 - (a1(i,j)-a2(h,k))^2
                W = setWeight(W, V1, V2, ih, jk, i, j, h, k);
            end
        end
    end
end

% State history
h = [];

% Previous state, for convergence check
xprev = x;

% Run till convergence
i = 1;
while true
    
    % maintain state history
    h(:,end+1) = probs(x, c);
    
    % propagate evidence to get payoff
    p = propagate(W, x);
    
    % multiply previous state by payoff to get new state (Eq. 3.2)
    x = intersect(xprev, p, c);
    
    % keep state vector in reasonable bounds
    x = squash(x);
    
    % get distance between successive state vectors
    d = sqrt(sum((x-xprev).^2));
    
    % check convergence
    if  d < EPSILON
        break
    end
    
    % report convergence and number of unique state values
    fprintf('%3d: %f [%d]\n', i, d, length(unique(x)))
    
    % update
    xprev = x;
    i = i + 1;
    
end

% Find nonzero solutions
win = find(probs(x, c) > ZERO);

hold on

% Plot histories of winners in color
plot(h(win,:)')

% Plot losers in black
plot(h(setdiff(1:N, win),:)', 'k')

% Label axes
xlabel('t')
ylabel('x_t')


% Legend shows winning vertex mappings
key = {};
for i = 1:length(win)
    [k,j] = ind2sub([n n], win(i));
    key{i} = sprintf('%s%s', num2ltr(j, n), num2ltr(k, n, 15));
end
legend(key);














