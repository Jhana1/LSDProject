file = fopen('shark_thresholded.txt', 'r');
image_data = fscanf(file, '%d\n');
fclose(file);
image = reshape(image_data, 800, 480);
imshow(image);
title('Thresholded');

file = fopen('shark_histogrammed.txt', 'r');
image_data = fscanf(file, '%d\n');
fclose(file);
image = reshape(image_data, 800, 480);
figure;
imshow(image);
title('Histogrammed');

file = fopen('shark_cumulated.txt', 'r');
image_data = fscanf(file, '%d\n');
fclose(file);
image = reshape(image_data, 800, 480);
figure;
imshow(image);
title('Cumulated');