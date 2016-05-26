%% Process image
file = 'lenna';
ext = '.jpg';

s = imread([file, ext]);
r = reshape(s(:, :, 1), 800*480, 1);
g = reshape(s(:, :, 2), 800*480, 1);
b = reshape(s(:, :, 3), 800*480, 1);


f = fopen([file, '_red.txt'], 'w');
fprintf(f, '%d\n', r);
fclose(f);

f = fopen([file, '_green.txt'], 'w');
fprintf(f, '%d\n', g);
fclose(f);

f = fopen([file, '_blue.txt'], 'w');
fprintf(f, '%d\n', b);
fclose(f);

g = rgb2gray(s);
g = reshape(g, 800*480, 1);
f = fopen([file, '.txt'], 'w');
fprintf(f, '%d\n', g);
fclose(f);