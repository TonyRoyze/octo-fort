n = 3;
w = 'FX';
ruleF = 'FF';
ruleX = '[+FX][-FX]';

for i = 1:n
    new_w = '';
    j = 1;
    while j<=length(w)
        if w(j) =='F';
            new_w = strcat(new_w, ruleF);
        elseif w(j) =='X';
            new_w = strcat(new_w, ruleX);
        else
            new_w = strcat(new_w, w(j));
        end
        j = j+1;
    end
    w = new_w;
end
