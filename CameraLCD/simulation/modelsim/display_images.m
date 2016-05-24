%%
subplot(1, 2, 1);
image_data = dlmread('shark_color.txt');
image =reshape(image_data, 800, 480, 3);
imshow(uint8(image));
title('Color image');

subplot(1, 2, 2);
image_data = dlmread('shark_grayed.txt');
image = reshape(image_data, 800, 480, 3);
imshow(uint8(image));
title('Grayed');

figure; 
subplot(1, 2, 1);
image_data = dlmread('shark_thresholded.txt');
image = reshape(image_data, 800, 480, 3);
imshow(image);
title('Thresholded');

subplot(1, 2, 2);
image_data = dlmread('shark_histogrammed.txt');
image = reshape(image_data, 800, 480, 3);
imshow(image);
title('Histogrammed');

figure;
subplot(1, 2, 1);
image_data = dlmread('shark_cumulated.txt');
image = reshape(image_data, 800, 480, 3);
imshow(image);
title('Cumulated');

subplot(1, 2, 2);
image_data = dlmread('shark_block_threshold.txt');
image = reshape(image_data, 800, 480, 3);
imshow(image);
title('Cumulated');

figure;

image_data = dlmread('shark_smooth_threshold.txt');
image = reshape(image_data, 800, 480, 3);
imshow(image);
title('Cumulated');
%%
figure;
subplot(3, 1, 1);
file = fopen('shark_hist_displayed.txt', 'r');
image_data = fscanf(file, '%d\n');
fclose(file);
image = reshape(image_data, 800, 480);
imshow(image);
title('Histogram From HistogramDisplay.v');

subplot(3,1,2);
file = fopen('shark_hist.txt', 'r');
data = fscanf(file, '%d\n');
fclose(file);
bar(data);
title('Histogram from Histogram.v');

subplot(3, 1, 3);
image = rgb2gray(imread('shark.jpg'));
p = reshape(image, 800*480, 1);
hist(double(p), 255);
h = hist(double(p), 255);
title('Histogram generated by Matlab');

%%
figure;
subplot(2,1,1);
file = fopen('shark_cumhist.txt', 'r');
data = fscanf(file, '%d\n');
fclose(file);
bar(data);
title('Cumulative Histogram from CumulativeHistogram.v');

subplot(2,1,2);
ch = cumsum(h);
bar(ch);
title('Cumulative Histogram generated by Matlab');

%%
figure;
subplot(2, 1, 1);
file = fopen('shark_total_hist.txt', 'r');
data = fscanf(file, '%d\n');
fclose(file);
bar(data);
title('Histogram from Total\_Histogram.v');

subplot(2,1,2);
file = fopen('shark_total_cumhist.txt', 'r');
data = fscanf(file, '%d\n');
fclose(file);
bar(data);
title('Cumulative Histogram from Total\_Histogram.v');
