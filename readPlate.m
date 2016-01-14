function [ plate_text ] = readPlate( plate, characters )
%UNTITLED2 Read the characters of numberplate 'plate'

%imagesc(plate)
%TODO: threshold tweaken
threshold = 0.4;
%threshold = graythresh(plate);
image = ~im2bw(plate, threshold);
%image = bwareaopen(image,10);
%imagesc(image)
%pause(1);

%clip empty space around plate
%[f c]=find(image);
%image=image(min(f):max(f),min(c):max(c));
% figure;
% imagesc(image)

%storage for plate
plate_text = [];
%amount of letters (connected components) normally 6/8
[L CC] = bwlabel(image);
%imagesc(L);
%pause(10);

% if CC < 6 (8 met dashes) fail sws
CC
if (CC < 8)
    CC
end

minr = [];
maxr = [];
for n=2:CC
    %get nonzero rows and col (non zero have chars)
    [r,c] = find(L==n);
    % get char
    minr = [minr min(r)];
    maxr = [maxr max(r)];
end
min_r = ceil(median(minr));
max_r = ceil(median(maxr));


for n=1:CC
    %get nonzero rows and col (non zero have chars)
    [r,c] = find(L==n);
    % get char
    if (min(r) < min_r)
        minr = min(r);
    else
        minr = min_r;
    end
    if (max(r) > max_r)
        maxr = max(r);
    else
        maxr = max_r;
    end
    
    letter=image(minr:maxr,min(c):max(c));
    
    % make same size as reference letter
    letter_resize=imresize(letter,[42 24]);
    imshow(letter);
    pause(0.5);
    % letter/number image to text
    comp = zeros(1, 32);
    for c=1:32
        
        compareLetter = characters(:,:,c);
        cor = corr2(compareLetter,letter_resize);
        %c = max(cor(:));
%         if (c == 32)
%             cor
%         end
        
        comp(c) = cor;
    end
    %index of max value
    [Y, c] = max(comp);
    
     if (Y > 0.3)
    if c==1
        letter_t='B';
    elseif c==2
        letter_t='C';
    elseif c==3
        letter_t='D';
    elseif c==4
        letter_t='F';
    elseif c==5
        letter_t='G';
    elseif c==6
        letter_t='H';
    elseif c==7
        letter_t='J';
    elseif c==8
        letter_t='K';
    elseif c==9
        letter_t='L';
    elseif c==10
        letter_t='M';
    elseif c==11
        letter_t='N';
    elseif c==12
        letter_t='P';
    elseif c==13
        letter_t='Q';
    elseif c==14
        letter_t='R';
    elseif c==15
        letter_t='S';
    elseif c==16
        letter_t='T';
    elseif c==17
        letter_t='V';
    elseif c==18
        letter_t='W';
    elseif c==19
        letter_t='X';
    elseif c==20
        letter_t='Y';
    elseif c==21
        letter_t='Z';
        %*-*-*-*-*
    elseif c==22
        letter_t='1';
    elseif c==23
        letter_t='2';
    elseif c==24
        letter_t='3';
    elseif c==25
        letter_t='4';
    elseif c==26
        letter_t='5';
    elseif c==27
        letter_t='6';
    elseif c==28
        letter_t='7';
    elseif c==29
        letter_t='8';
    elseif c==30
        letter_t='9';
    elseif c==31
        letter_t='0';
    else
        letter_t='-';
    end
    % add letter
    plate_text = [plate_text, letter_t];
    end
end

end
%if (length(plate_text) ~= 6)
%    plate_text = [];
%end

