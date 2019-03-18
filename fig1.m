function a = fig1
% A = FIG1 returns adjacency matrix from Figure 1 of Pelillo (1999).

a = zeros(4);

a(2,3) = 1;
a(2,4) = 1;

a = triu(a);

a = a | a';