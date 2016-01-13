function [ er2 ] = SobelTest2( frame )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%gray = 0.114*frame(:,:,1) + 0.587*frame(:,:,2) + 0.299*frame(:,:,3);
gray = rgb2gray(frame);
%imshow(gray);

%make shapes
SEvert = strel('line', 3, 90);
SEhor = strel('line', 5, 0);
SEd = strel('diamond', 3);

ed = edge(gray, 'sobel');
% figure
% image(ed*255)
% title('sobel')


dil = imdilate(ed, SEvert);
% figure
% image(dil*255)
% title('vertical dilation')

dil2 = imdilate(dil, SEhor);
% figure
% image(dil2*255)
% title('horizontal dilation')

dil2 = bwareaopen(dil2, 100);
% dil2(:,1) = true;
% dil2(:,end) = true;
% dil2(1,:) = true;
% dil2(end,:) = true;

dil2 = imclearborder(dil2);
dil2 = double(bclosing(dil2, 2));
fill = imfill(dil2, 'holes');

% figure
% image(fill*255)
% title('filled')

% figure
% subplot(2,2,1);
% imshow(ed);
%
% figure
% subplot(2,2,2);
% imshow(dil);
% subplot(2,2,3);
% imshow(dil2);
% subplot(2,2,4);
% imshow(fill);

er2 = imclearborder(fill);
er2 = bwareaopen(er2, 2500);

%label objects
c = label(er2);

%Measure perimeter of objects
per = measure(c,gray,{'Perimeter'},[],Inf,0,0);

area = measure(c,gray,{'size'},[],Inf,0,0);

%Make a blank image
res = gray&0;

%loop through the data
% n = length(per);
% for i=1:1:n
%     %If the perimeter is below the threshold
%     if(double(per(i))/double(area(i)) < 0.1)
% %         mm = gray&0 | c == i;
% %         bb = getfield(regionprops(double(mm), 'BoundingBox'), 'BoundingBox');
% %         
% %         if(double(area(i))/ (bb(2)*bb(3)) < 0.7)
%             %Add the object to te result
%             res = res | c == i;
% %         end
%     end
% end

% er = c(border, SEd);
% er2 = imerode(er, SEd);

%er2 = double(bclosing(border, 1));

end
