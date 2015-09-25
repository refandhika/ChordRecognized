function r = silent_removal(s)

n = length(s);
j = 0;

for i=1:n
    if (s(i) > 0.05)
        j = j + 1;
        M(j) = s(i);
    end
end
r = M';