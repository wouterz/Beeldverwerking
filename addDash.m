plate = 'XXX99X';
N = ['0' '1' '2' '3' '4' '5' '6' '7' '8' '9'];
res = [];

countL = 0;
countN = 0;
%eerste letter of cijfer
for n=1:10
    if (plate(1) == N(n))
        countN = 1;
        break
    end
end
if (countN == 0)
    countL = 1;
end

dash = [];
for i=2:6
    flag = 0;
    for n=1:length(N)
        %char i is een nummer
        if (plate(i) == N(n))
            flag = 1;
            %vorige was GEEN nummer
            if (countN == 0)
                dash = [dash i];
                %disp(['dash voor index ' num2str(i)])
                countN = 1;
                countL = 0;
                break
            %vorige was wel een nummer
            else
                %doortellen
                countN = countN + 1;
                %als het er 4 zijn sws 2x2
                if (countN == 4)
                    res = [plate(1:2) '-' plate(3:4) '-' plate(5:6)];
                    return
                end
                break
            end
        end
    end

        if (flag == 0)
            if (countL == 0)
                dash = [dash i];
                %disp(['dash voor index ' num2str(i)])
                countL = 1;
                countN = 0;
            %vorige was wel een nummer
            else
                %doortellen
                countL = countL + 1;
                %als het er 4 zijn sws 2x2
                if (countL == 4)
                    res = [plate(1:2) '-' plate(3:4) '-' plate(5:6)];
                    return
                end
            end
        end      
end
res = [plate(1:dash(1)-1) '-'  plate(dash(1):dash(2)-1) '-' plate(dash(2):length(plate))]
