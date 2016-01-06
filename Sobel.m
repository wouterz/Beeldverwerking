function [ er2 ] = Sobel( frame )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
gray = 0.114*frame(:,:,1) + 0.587*frame(:,:,2) + 0.299*frame(:,:,3);

SEvert = strel('line', 3, 90);
SEhor = strel('line', 3, 0);
SEd = strel('diamond', 3);

ed = edge(gray, 'sobel');
dil = imdilate(ed, SEvert);
dil2 = imdilate(dil, SEhor);
fill = imfill(dil2, 'holes');
border = imclearborder(fill);
er = imerode(border, SEd);
er2 = imerode(er, SEd);

end
