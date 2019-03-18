function W = setWeight(W, V1, V2, ih, jk, i, j, h, k)

W = W + V1(i,:) .* V1(j,:) .* V2(h,:) .* V2(k,:);