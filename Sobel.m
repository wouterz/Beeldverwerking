function [res] = Sobel( frame )

%make grayscale image
gray = rgb2gray(frame);

%make shapes for dilation
SEvert = strel('line', 3, 90);
SEhor = strel('line', 5, 0);
SEd = strel('diamond', 3);

%sobel edge detection
ed = edge(gray, 'sobel');

%vertical dilation
dil = imdilate(ed, SEvert);

%horizontal dilation
dil2 = imdilate(dil, SEhor);

%remove objects smaller than 100 pixels
dil2 = bwareaopen(dil2, 100);

%clear the border
dil2 = imclearborder(dil2);

%closing
dil2 = double(bclosing(dil2, 2));

%fill in the holes
fill = imfill(dil2, 'holes');

%clear border
er2 = imclearborder(fill);

%remove objects smaller than 2500 pixels
er2 = bwareaopen(er2, 2500);

%label objects
c = label(er2);

%Measure perimeter of objects
per = measure(c,gray,{'Perimeter'},[],Inf,0,0);

%Meausure area of objects
area = measure(c,gray,{'size'},[],Inf,0,0);

%Make a blank image
res = gray&0;

%loop through the data
n = length(per);
for i=1:1:n
    %If the perimeter is below the threshold
    if(double(per(i))/double(area(i)) < 0.2)
        mm = gray&0 | c == i;
        bb = getfield(regionprops(double(mm), 'BoundingBox'), 'BoundingBox');
        
        if(double(area(i))/ (bb(2)*bb(3)) < 0.85)
            %Add the object to te result
            res = res | c == i;
        end
    end
end

res = imdilate(double(res), SEd);

end
