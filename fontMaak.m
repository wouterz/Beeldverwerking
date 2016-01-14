[L, CC] = bwlabel(out);
folder = 'C:\Users\Shane\git\Beeldverwerking\font\';
bmp = '.bmp';

for n=1:CC
        %get nonzero rows and col (non zero have chars)
        [r,c] = find(L==n);
        % get letter
        letter=out(min(r):max(r),min(c):max(c));
        letter = imresize(letter, [51, 62]);
        % resize to compare with
        %letter_resize=imresize(letter,[42 24]);
        
        name = [folder num2str(n) bmp];
        
        imwrite(letter, name);
end;