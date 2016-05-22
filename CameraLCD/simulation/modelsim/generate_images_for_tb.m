%% Process image

s = imread('shark.jpg');
r = reshape(s(:, :, 1), 800*480, 1);
g = reshape(s(:, :, 2), 800*480, 1);
b = reshape(s(:, :, 3), 800*480, 1);


f = fopen('shark_red.txt', 'w');
fprintf(f, '%d\n', r);
fclose(f);

f = fopen('shark_green.txt', 'w');
fprintf(f, '%d\n', g);
fclose(f);

f = fopen('shark_blue.txt', 'w');
fprintf(f, '%d\n', b);
fclose(f);
