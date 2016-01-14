plate = 'XX1234';
L = ['B' 'C' 'D' 'F' 'G' 'H' 'J' 'K' 'L' 'M' 'N' 'P' 'Q' 'R' 'S' 'T' 'V' 'W' 'X' 'Y' 'Z'];

N = ['0' '1' '2' '3' '4' '5' '6' '7' '8' '9'];
res = [];

countL = 0;
countN = 0;
%eerste letter of cijfer
for n=1:size(N)
    if (plate(1) == N(n))
        countN = 1;
        break
    end
end
if (countN == 0)
    countL = 1;
end


for i=2:6
    for n=1:length(N)
        %char i is een nummer
        if (plate(i) == N(n))
            %vorige was GEEN nummer
            if (countN == 0)
                disp(['dash voor index ' num2str(i)])
                countN = 1;
                countL = 0;
                break
            %vorige was wel een nummer
            else
                %doortellen
                countN = countN + 1;
                %als het er 4 zijn sws 2x2
                if (countN == 4)
                    disp([plate(1:2) '-' plate(3:4) '-' plate(5:6)])
                    break
                end
            end
        end  
    end
end
