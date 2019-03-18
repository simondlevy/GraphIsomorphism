function v = probs(x, c)

c = c.cd;

N = size(c,1);

v = zeros(1,N);

for k = 1:N
    v(k) = dot(x, c(k,:)) / length(x);
end

v  = normalize(v)';

