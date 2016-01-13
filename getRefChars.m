function [ characters ] = getRefChars( )
%UNTITLED get matrix of all chars that occur in license plates
%   read and save all images in a matrix, return matrix


%characters
%A=imread('characters\A.bmp');
B=imread('characters\B.bmp');
C=imread('characters\C.bmp');D=imread('characters\D.bmp');
%E=imread('characters\E.bmp');
F=imread('characters\F.bmp');
G=imread('characters\G.bmp');H=imread('characters\H.bmp');
%I=imread('characters\I.bmp');
J=imread('characters\J.bmp');
K=imread('characters\K.bmp');L=imread('characters\L.bmp');
M=imread('characters\M.bmp');N=imread('characters\N.bmp');
%O=imread('characters\O.bmp');
P=imread('characters\P.bmp');
Q=imread('characters\Q.bmp');R=imread('characters\R.bmp');
S=imread('characters\S.bmp');T=imread('characters\T.bmp');
%U=imread('characters\U.bmp');
V=imread('characters\V.bmp');
W=imread('characters\W.bmp');X=imread('characters\X.bmp');
Y=imread('characters\Y.bmp');Z=imread('characters\Z.bmp');
one=imread('characters\1.bmp');  two=imread('characters\2.bmp');
three=imread('characters\3.bmp');four=imread('characters\4.bmp');
five=imread('characters\5.bmp'); six=imread('characters\6.bmp');
seven=imread('characters\7.bmp');eight=imread('characters\8.bmp');
nine=imread('characters\9.bmp'); zero=imread('characters\0.bmp');
%dash = imread('characters\dash');
dash = ones(42,24);
dash(1,:) = 0;
dash(42,:) = 0;
characters = zeros(42,24,32);
%characters(:,:,1) = A;
characters(:,:,1) = B; characters(:,:,2) = C;
characters(:,:,3) = D;% characters(:,:,5) = E;
characters(:,:,4) = F;
characters(:,:,5) = G; characters(:,:,6) = H;% characters(:,:,9) = I;
characters(:,:,7) = J; characters(:,:,8) = K; characters(:,:,9) = L;
characters(:,:,10) = M; characters(:,:,11) = N;% characters(:,:,15) = O;
characters(:,:,12) = P; characters(:,:,13) = Q; characters(:,:,14) = R;
characters(:,:,15) = S; characters(:,:,16) = T;% characters(:,:,21) = U;
characters(:,:,17) = V; characters(:,:,18) = W; characters(:,:,19) = X;
characters(:,:,20) = Y; characters(:,:,21) = Z; 
characters(:,:,22) = one; characters(:,:,23) = two; 
characters(:,:,24) = three; characters(:,:,25) = four;
characters(:,:,26) = five; characters(:,:,27) = six;
characters(:,:,28) = seven; characters(:,:,29) = eight;
characters(:,:,30) = nine; characters(:,:,31) = zero;
characters(:,:,32) = dash;

end

