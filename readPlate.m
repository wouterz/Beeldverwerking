function [ plate_text ] = readPlate( plate )
%UNTITLED2 Read the characters of numberplate 'plate'
%characters
A=imread('characters\A.bmp');B=imread('characters\B.bmp');
C=imread('characters\C.bmp');D=imread('characters\D.bmp');
E=imread('characters\E.bmp');F=imread('characters\F.bmp');
G=imread('characters\G.bmp');H=imread('characters\H.bmp');
I=imread('characters\I.bmp');J=imread('characters\J.bmp');
K=imread('characters\K.bmp');L=imread('characters\L.bmp');
M=imread('characters\M.bmp');N=imread('characters\N.bmp');
O=imread('characters\O.bmp');P=imread('characters\P.bmp');
Q=imread('characters\Q.bmp');R=imread('characters\R.bmp');
S=imread('characters\S.bmp');T=imread('characters\T.bmp');
U=imread('characters\U.bmp');V=imread('characters\V.bmp');
W=imread('characters\W.bmp');X=imread('characters\X.bmp');
Y=imread('characters\Y.bmp');Z=imread('characters\Z.bmp');
one=imread('characters\1.bmp');  two=imread('characters\2.bmp');
three=imread('characters\3.bmp');four=imread('characters\4.bmp');
five=imread('characters\5.bmp'); six=imread('characters\6.bmp');
seven=imread('characters\7.bmp');eight=imread('characters\8.bmp');
nine=imread('characters\9.bmp'); zero=imread('characters\0.bmp');
dash = imread('characters\dash');
characters = zeros(42,24,37);
characters(:,:,1) = A; characters(:,:,2) = B; characters(:,:,3) = C;
characters(:,:,4) = D; characters(:,:,5) = E; characters(:,:,6) = F;
characters(:,:,7) = G; characters(:,:,8) = H; characters(:,:,9) = I;
characters(:,:,10) = J; characters(:,:,11) = K; characters(:,:,12) = L;
characters(:,:,13) = M; characters(:,:,14) = N; characters(:,:,15) = O;
characters(:,:,16) = P; characters(:,:,17) = Q; characters(:,:,18) = R;
characters(:,:,19) = S; characters(:,:,20) = T; characters(:,:,21) = U;
characters(:,:,22) = V; characters(:,:,23) = W; characters(:,:,24) = X;
characters(:,:,25) = Y; characters(:,:,26) = Z; 
characters(:,:,27) = one; characters(:,:,28) = two; 
characters(:,:,29) = three; characters(:,:,30) = four;
characters(:,:,31) = five; characters(:,:,32) = six;
characters(:,:,33) = seven; characters(:,:,34) = eight;
characters(:,:,35) = nine; characters(:,:,36) = zero;
characters(:,:,37) = dash;

%imagesc(plate)
%treshold komt beetje laag uit?
treshold = graythresh(plate);
image = ~im2bw(plate, 0.5);
%image = bwareaopen(image,100);
%imagesc(image)

%clip empty space around plate
%[f c]=find(image);
%image=image(min(f):max(f),min(c):max(c));

%storage for plate
plate_text = [];
%amount of letters (connected components)
[L CC] = bwlabel(image);

for n=1:CC
        %get nonzero rows and col (non zero have chars)
        [r,c] = find(L==n);
        % get letter
        letter=image(min(r):max(r),min(c):max(c));  
        % resize to compare with
        letter_resize=imresize(letter,[42 24]);
        %show seperated letters
        %figure
        %imshow(letter_resize);pause(1);

        % letter/number image to text
        comp = zeros(1, 37);
        for c=1:37
            compareLetter = characters(:,:,c);
            cor = corr2(compareLetter,letter_resize);
            %c = max(cor(:));
            comp(c) = cor;
        end
        %c=find(comp==max(comp));
        [Y, c] = max(comp);
        
        if (Y > 0.5)
        
        if c==1
            letter_t='A';
        elseif c==2
            letter_t='B';
        elseif c==3
            letter_t='C';
        elseif c==4
            letter_t='D';
        elseif c==5
            letter_t='E';
        elseif c==6
            letter_t='F';
        elseif c==7
            letter_t='G';
        elseif c==8
            letter_t='H';
        elseif c==9
            letter_t='I';
        elseif c==10
            letter_t='J';
        elseif c==11
            letter_t='K';
        elseif c==12
            letter_t='L';
        elseif c==13
            letter_t='M';
        elseif c==14
            letter_t='N';
        elseif c==15
            letter_t='O';
        elseif c==16
            letter_t='P';
        elseif c==17
            letter_t='Q';
        elseif c==18
            letter_t='R';
        elseif c==19
            letter_t='S';
        elseif c==20
            letter_t='T';
        elseif c==21
            letter_t='U';
        elseif c==22
            letter_t='V';
        elseif c==23
            letter_t='W';
        elseif c==24
            letter_t='X';
        elseif c==25
            letter_t='Y';
        elseif c==26
            letter_t='Z';
        %*-*-*-*-*
        elseif c==27
            letter_t='1';
        elseif c==28
            letter_t='2';
        elseif c==29
            letter_t='3';
        elseif c==30
            letter_t='4';
        elseif c==31
            letter_t='5';
        elseif c==32
            letter_t='6';
        elseif c==33
            letter_t='7';
        elseif c==34
            letter_t='8';
        elseif c==35
            letter_t='9';
        else
            letter_t='0';
        end

        % add letter
        plate_text = [plate_text, letter_t];
        end
        
end

