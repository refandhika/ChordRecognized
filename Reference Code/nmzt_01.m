function nor = nmzt(s)

% 0 - 1 normalization

[a,b] = size(s);
X = abs(s);
Xmax = max(max(s));
Xmin = min(min(s));

for i=1:a
    for j=1:b
        s(i,j) = X(i,j) / (Xmax);
    end
end

nor = s;