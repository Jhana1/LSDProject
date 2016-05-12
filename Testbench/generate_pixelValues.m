function generate_pixelValues

directory = 'C:\Users\dboland\Google Drive\ece4063 2014\';

% Convert 512x512 image into 32*32
pixel_values = imresize(imread(strcat(directory, 'lenna.png')),0.0625);
fileIDR = fopen(strcat(directory, 'lennaRed.txt'),'w');
fileIDG = fopen(strcat(directory, 'lennaGreen.txt'),'w');
fileIDB = fopen(strcat(directory, 'lennaBlue.txt'),'w');
fileIDgrey = fopen(strcat(directory, 'lennaGrey.txt'),'w');
% Convert to grey in software
grey = rgb2gray(pixel_values);
%hist = imhist(grey); % Compute greyscale histogram
for i=1:length(pixel_values)
for j=1:length(pixel_values)
fprintf(fileIDR,'%s\n',dec2hex(pixel_values(i,j,1),3));
fprintf(fileIDG,'%s\n',dec2hex(pixel_values(i,j,2),3));
fprintf(fileIDB,'%s\n',dec2hex(pixel_values(i,j,3),3));
fprintf(fileIDgrey,'%s\n',dec2hex(grey(i,j),3));
end
end
fclose(fileIDR);
fclose(fileIDG);
fclose(fileIDB);
fclose(fileIDgrey);