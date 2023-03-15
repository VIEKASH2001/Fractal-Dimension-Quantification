path = 'F:\2. UG\ACADEMICS\SEM 8\1. Project\Codes\Sample Data\sample.jpg';
test_image = imread(path);
resized_image = imresize(test_image, [584 565]); 
converted_image = im2double(resized_image);
% lab_image = rgb2lab(converted_image); 
fill = cat(3, 1, 0, 0);
filled_image = bsxfun(@times, fill, converted_image);
reshaped_lab_image = reshape(filled_image, [], 3);
[C, S] = pca(reshaped_lab_image);    %finding the coefficients of the pca
S = reshape(S, size(lab_image));
% S = S(:, :, 1);
% gray_image = (S-min(S(:)))./(max(S(:)));    %converting image S into a grayscale
% enhanced_image = adapthisteq(gray_image, 'numTiles', [8 8], 'nBins', 128);     %enhancing the contrast
% avg_filter = special('average', [9 9]);    %filtering the image
% filtered_image = imfilter(enhanced_image, avg_filter);
% figure, imshow(filtered_image)             %showing the resulting image
% title('filtered image')                    %adding the title
% subtracted_image = imsubtract(filtered_image, enhanced_image);
% function level = Threshold_level(image);
% image = im2uint8(image(:));     %converting the image to uint8
% [Histogram_count, Bin_number] = imhist(image);    %calculating the histogram count and beam number
% i = 1;     % Initializing the variable
% cumulative_sum = cumsum(Histogram_count);    %calculating the cumulative sum
% T(i) = (sum(Bin_number.*Histogram_count))/cumulative_sum(end);  %calculating the ratio of the sum of the multiplication of bin number and the histogram count to the cumulative sum indexed at the end.
% T(i) = round(T(i));    %Rounding the T(i)
% cumulative_sum_2 = cumsum(Histogram_count(1:T(i)));         %finding the cumulative sum at the second index.
% MBT = sum(Bin_number(T(i)).*Histogram_count(1:T(i)))/cumulative_sum_2(end); %finding the MBT 
% cumulative_sum_3 = cumsum(Histogram_count(T(i):end));      %finding the cumulative sum at the second index.
% MAT = sum(Bin_number(T(i):end).*Histogram_count(T(i):end))/cumulative_sum_3(end);    %finding the MBT 
% i = i+1;
% T(i) = round((MAT+MBT)/2);      %Finding the average of MBT and MAT
% while abs(T(i)-T(i-1))>=1
% cumulative_sum_2 = cumsum(Histogram_count(1:T(i)));    %finding the histogram count at the second index
% MBT = sum(Bin_number(T(i)).*Histogram_count(1:T(i)))/cumulative_sum_2(end);  %finding the histogram count at MBT
% cumulative_sum_3 = cumsum(Histogram_count(T(i):end));    %finding the histogram count at the third index
% MAT = sum(Bin_number(T(i):end).*Histogram_count(T(i):end))/cumulative_sum_3(end);
% i = i+1;                      %looping i
% T(i) = round((MAT+MBT)/2);    %rounding off the average mat and mbt.
% Threshold = T(i);             % making T(i) the threshold
% end
% level = (Threshold-1)/(Bin_number(end)-1);
% end
% level = Threshold_level(subtracted_image);
% binary_image = im2bw(subtracted_image, level-0.008);    %converting to binary
% figure, imshow(binary_image)
% title('binary image')

