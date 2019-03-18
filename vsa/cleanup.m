function y = cleanup(x, c)
% Y = CLEANUP(X, C) where C is a cleanup memory


if size(c, 1) ~= size(c, 2)
    
    % XXX localist cheat
    y = zeros(size(x));
    for k = 1:size(c, 1)
        ck = c(k,:);
        s = simil(x, ck);
        y = y + s * ck;
    end
else
    
    % auto-associative cleanup
    y = (x * c) / length(x);
    
end




