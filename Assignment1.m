img1 = imread('img1.jpg');
img2 = imread('img2.jpg');

a = 6;
b = 80;
imgsz = a*b;

img1 = imresize(img1, [imgsz,imgsz]);
img2 = imresize(img2, [imgsz,imgsz]);

img1 = rgb2gray(img1);
img2 = rgb2gray(img2);

figure;
imshow(img1);
title('Image 1');
figure;
imshow(img2);
title('Image 2');

mergedImage = uint8(zeros(imgsz,imgsz));
for i = 2 : 2 : a
    mergedImage( b * (i - 2)+1 : b * (i-1),:) = img1(b * (i - 2)+1 : b * (i-1),:);
    mergedImage( b * (i - 1)+1 : b * i,:) = img2(b * (i - 1)+1 : b * i,:);
end

figure;
imshow(mergedImage);
imwrite(mergedImage, 'output.jpg');
title('Merged Image ');

[height, width] = size(mergedImage);

img_rotate = uint8(zeros(width, height));

for i = 1:height
    for j = 1:width
        img_rotate(width - j + 1, i) = mergedImage(i, j);
    end
end

figure;
imshow(rotatedImage);
title('Rotated');

