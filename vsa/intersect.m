function z = intersect(x, y, c)

pd = c.pd;

w  = pd.w;
p1 = pd.p1;
p2 = pd.p2;

z = zeros(size(x));

for k = 1:size(w, 1)
    z = z + x(p1(k,:)) .* y(p2(k,:)) .* w(k,:);
end

z = z / size(w, 1);

z = cleanup(z, c.cd);
    






