function p = oneperm(dims)

e = speye(dims);
p = e(randperm(dims),:)';