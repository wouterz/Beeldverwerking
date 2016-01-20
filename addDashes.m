function [ dashed ] = addDashes( plate )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if (length(plate) ~= 6)
    dashed = [];
   return
end

N = ['0' '1' '2' '3' '4' '5' '6' '7' '8' '9'];
res = zeros(1,6);

% 1 = nummer
% 2 = letter

for i=1:6
    flag = 0;
    for n=1:length(N)
        if (plate(i) == N(n))
            flag = 1;
            res(i) = 1;
            break
        end
    end
    if (flag == 0)
        res(i) = 2;
    end
end

%validate outcome
if (res == [2 2 1 1 1 1])
    dashed = [plate(1:2) '-' plate(3:4) '-' plate(5:6)];
elseif (res == [1 1 1 1 2 2])
    dashed = [plate(1:2) '-' plate(3:4) '-' plate(5:6)];
elseif (res == [1 1 2 2 1 1])
    dashed = [plate(1:2) '-' plate(3:4) '-' plate(5:6)];
elseif (res == [2 2 1 1 2 2])
    dashed = [plate(1:2) '-' plate(3:4) '-' plate(5:6)];
elseif (res == [2 2 2 2 1 1])
    dashed = [plate(1:2) '-' plate(3:4) '-' plate(5:6)];
elseif (res == [1 1 2 2 2 2])
    dashed = [plate(1:2) '-' plate(3:4) '-' plate(5:6)];
elseif (res == [1 1 2 2 2 1])
    dashed = [plate(1:2) '-' plate(3:5) '-' plate(6)];
elseif (res == [1 2 2 2 1 1])
    dashed = [plate(1) '-' plate(2:4) '-' plate(5:6)];
elseif (res == [2 2 1 1 1 2])
    dashed = [plate(1:2) '-' plate(3:5) '-' plate(6)];
elseif (res == [2 1 1 1 2 2])
    dashed = [plate(1) '-' plate(2:4) '-' plate(5:6)];
elseif (res == [2 2 2 1 1 2])
    dashed = [plate(1:3) '-' plate(4:5) '-' plate(6)];
else
    dashed = 'UNKNOWN PLATE';
end

end

