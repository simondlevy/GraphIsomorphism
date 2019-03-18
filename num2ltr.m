function c = num2ltr(i, n, o)
if nargin < 3
    o = 0;
end
len = ceil(n/26);
c = '';
for j=1:len
    c = [c char('A' + o + mod(i - 1, 26))];
end
