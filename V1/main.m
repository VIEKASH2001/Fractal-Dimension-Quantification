path = 'F:\2. UG\ACADEMICS\ARCHIVED\SEM 8\1. Project\Codes\Dataset\Myopia\SL_Myopia\';
jpegFiles = dir(path); % 'clear' is the name of directory in which all the images are kept
numfiles = length(jpegFiles); % stores number of images in that folder
for i = 3:numfiles
    filename = string(path)+string(jpegFiles(i).name);
    filename
%     img =imread(filename);
%     Test_image = cat(3, img, img, img);
%     Resized_Image =imresize(Test_image,[584 565]);
%     Converted_Image=im2double(Resized_Image);
%     Lab_Image=rgb2lab(Converted_Image);
%     fill=cat(3,1,0,0);
%     Filled_Image=bsxfun(@times,fill,Lab_Image);
%     
%     Reshaped_Lab_Image=reshape(Filled_Image,[],3);
%     [C, S]=pca(Reshaped_Lab_Image);
%     
%     S=reshape(S,size(Lab_Image));
%     S=S(:,:,1);
%     Gray_Image=(S-min(S(:)))./(max(S(:))-min(S(:)));
%     a = 7;
%     b = 20;
%     t = 70;
%     level = 0.007;
%     
%     Enhanced_Image=adapthisteq(Gray_Image,'NumTiles',[a a],'nbins',t);
%     Avg_Filter=fspecial('average',[b b]);
%     Filtered_Image=imfilter(Enhanced_Image,Avg_Filter);
%     substracted_Image=imsubtract(Filtered_Image,Enhanced_Image);
%     level=Threshold_Level(substracted_Image);
%     level = 0.07;%level-0.00008;
%     Binary_Image=im2bw(substracted_Image,level);
%     
%     Clean_Image=bwareaopen(Binary_Image,100);
%     Complemented_Image=imcomplement(Clean_Image);
% 
%     subplot(231), imshow(Enhanced_Image)
%     title('Enhanced Image')
%     
%     subplot(232), imshow(Filtered_Image)
%     title('Filtered Image')
%     
%     subplot(233), imshow(substracted_Image)
%     title('substracted Image')
%     
%     subplot(234),imshow(Binary_Image)
%     title('Binary Image')
%     
%     subplot(235),imshow(Clean_Image)
%     title('clean image')
%     
%     subplot(236),imshow(Complemented_Image)
%     title('Complemented image')

end


