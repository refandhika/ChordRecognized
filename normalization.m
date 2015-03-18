function nor = nmzt(s)

Xmax = max(max(s));
Xmin = min(min(s));
[a,b] = size(s);
X = s;

for i=1:a
    for j=1:b
        s(i,j) = (X(i,j) - Xmin) / (Xmax - Xmin);
    end
end

nor = s;