function [alocf, alocH] = ignmxmndif(alocf, alocf1, alocH, alocH1, c)

b = {};
for j = 1:c
    a = [];
    for i = 1:length(alocf{j})
            if (alocH{j}(i)-alocH1{j}(i) < 3)
                a = [a i];
            end
    end
    b{j} = a;
end

cc = {};
for j = 1:c
    d = [];
    tmp = length(alocf1{j});
    for i = length(alocf{j}):-1:1
            if (alocH{j}(i)-alocH1{j}(tmp) < 3)
                d = [d i];
            end
            tmp = tmp-1;
    end
    cc{j} = d;
end

for i = 1:length(b)
    aaa{i} = [b{i} cc{i}];
    aaa{i} = unique(aaa{i});
end

for j = 1:length(aaa)
    for i = length(aaa{j}):-1:1
        alocH{j}(aaa{j}(i)) = [];
        alocf{j}(aaa{j}(i)) = [];
    end
end
end