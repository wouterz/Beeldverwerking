function [ characters_cell ] = getRefChars( )
%UNTITLED get matrix of all chars that occur in license plates
%   read and save all images in a matrix, return matrix
folder = 'font';

%characters
%A=imread([folder '\A.bmp']);
B=imread([folder '\B.bmp']);
C=imread([folder '\C.bmp']);D=imread([folder '\D.bmp']);
%E=imread([folder '\E.bmp']);
F=imread([folder '\F.bmp']);
G=imread([folder '\G.bmp']);H=imread([folder '\H.bmp']);
%I=imread([folder '\I.bmp']);
J=imread([folder '\J.bmp']);
K=imread([folder '\K.bmp']);L=imread([folder '\L.bmp']);
M=imread([folder '\M.bmp']);N=imread([folder '\N.bmp']);
%O=imread([folder '\O.bmp']);
P=imread([folder '\P.bmp']);
Q=imread([folder '\Q.bmp']);R=imread([folder '\R.bmp']);
S=imread([folder '\S.bmp']);T=imread([folder '\T.bmp']);
%U=imread([folder '\U.bmp']);
V=imread([folder '\V.bmp']);
W=imread([folder '\W.bmp']);X=imread([folder '\X.bmp']);
Y=imread([folder '\Y.bmp']);Z=imread([folder '\Z.bmp']);
one=imread([folder '\1.bmp']);  two=imread([folder '\2.bmp']);
three=imread([folder '\3.bmp']);four=imread([folder '\4.bmp']);
five=imread([folder '\5.bmp']); six=imread([folder '\6.bmp']);
seven=imread([folder '\7.bmp']);eight=imread([folder '\8.bmp']);
nine=imread([folder '\9.bmp']); zero=imread([folder '\0.bmp']);
dash = imread([folder '\dash2.bmp']);
blank = imread([folder '\blank.bmp']);
characters_cell = cell(1,33);
characters_cell{1, 1} = B;
characters_cell{1, 2} = C;
characters_cell{1, 3} = D;
characters_cell{1, 4} = F;
characters_cell{1, 5} = G;
characters_cell{1, 6} = H;
characters_cell{1, 7} = J;
characters_cell{1, 8} = K;
characters_cell{1, 9} = L;
characters_cell{1, 10} = M;
characters_cell{1, 11} = N;
characters_cell{1, 12} = P;
characters_cell{1, 13} = Q;
characters_cell{1, 14} = R;
characters_cell{1, 15} = S;
characters_cell{1, 16} = T;
characters_cell{1, 17} = V;
characters_cell{1, 18} = W;
characters_cell{1, 19} = X;
characters_cell{1, 20} = Y;
characters_cell{1, 21} = Z;
characters_cell{1, 22} = one;
characters_cell{1, 23} = two;
characters_cell{1, 24} = three;
characters_cell{1, 25} = four;
characters_cell{1, 26} = five;
characters_cell{1, 27} = six;
characters_cell{1, 28} = seven;
characters_cell{1, 29} = eight;
characters_cell{1, 30} = nine;
characters_cell{1, 31} = zero;
characters_cell{1, 32} = dash;
characters_cell{1, 33} = blank;
% characters = zeros(51,62,32);
% %characters(:,:,1) = A;
% characters(:,:,1) = B; characters(:,:,2) = C;
% characters(:,:,3) = D;% characters(:,:,5) = E;
% characters(:,:,4) = F;
% characters(:,:,5) = G; characters(:,:,6) = H;% characters(:,:,9) = I;
% characters(:,:,7) = J; characters(:,:,8) = K; characters(:,:,9) = L;
% characters(:,:,10) = M; characters(:,:,11) = N;% characters(:,:,15) = O;
% characters(:,:,12) = P; characters(:,:,13) = Q; characters(:,:,14) = R;
% characters(:,:,15) = S; characters(:,:,16) = T;% characters(:,:,21) = U;
% characters(:,:,17) = V; characters(:,:,18) = W; characters(:,:,19) = X;
% characters(:,:,20) = Y; characters(:,:,21) = Z; 
% characters(:,:,22) = one; characters(:,:,23) = two; 
% characters(:,:,24) = three; characters(:,:,25) = four;
% characters(:,:,26) = five; characters(:,:,27) = six;
% characters(:,:,28) = seven; characters(:,:,29) = eight;
% characters(:,:,30) = nine; characters(:,:,31) = zero;
% characters(:,:,32) = dash;

end

