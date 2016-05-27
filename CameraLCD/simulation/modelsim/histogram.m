function h = histogram(data, bins)

h = zeros(bins, 1);
for i = 1:size(data) 
    h(data(i)+1) = h(data(i)+1) + 1;
end

end