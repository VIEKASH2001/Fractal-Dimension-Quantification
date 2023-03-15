extension = "New_DL_24_2_2022"; %"New_Fundus_images_24_2_2022"; %"New_SL_24_2_2022" "New_DL_24_2_2022" "DL_FAZ" "Fundus_image" "SL_FAZ"
directory = "F:\2. UG\ACADEMICS\SEM 8\1. Project\Codes\Dataset\set 2\" + extension;
jpegFiles = dir(directory); % 'clear' is the name of directory in which all the images are kept
numfiles = length(jpegFiles); % stores number of images in that folder
X = {};
%% Main Loop iterating over multiple images %%
 for i = 3:numfiles % one by one goes to all files
    filename = directory+"\"+jpegFiles(i).name;
    I = imread(filename);
    % Resize image for easier computation
    B = imresize(I, [584 565]);
    % Read image
    im = im2double(B);
    % Convert RGB to Gray via PCA
    lab = rgb2lab(im);
    f = 0;
    wlab = reshape(bsxfun(@times,cat(3,1-f,f/2,f/2),lab),[],3);
    [C,S] = pca(wlab);
    S = reshape(S,size(lab));
    S = S(:,:,1);
    gray = (S-min(S(:)))./(max(S(:))-min(S(:)));
    %% Contrast Enhancment of gray image using CLAHE
    J = adapthisteq(gray,'numTiles',[8 8],'nBins',128);
    
    %% Background Exclusion
    % Apply Average Filter
    h = fspecial('average', [9 9]);
    JF = imfilter(J, h);

    % Take the difference between the gray image and Average Filter
    Z = imsubtract(JF, J);
    %% Threshold using the IsoData Method
    level=isodata(Z); % this is our threshold level
    % level = graythresh(Z);
    %% Convert to Binary
    BW = im2bw(Z, level-.008);
    %% Remove small pixels
    BW2 = bwareaopen(BW, 100);
    %% Overlay
    BW2 = imcomplement(BW2);
    out = imoverlay(B, BW2, [0 0 0]);
    %% Image Binarization
    outBW = im2bw(out,level);
%     figure, imshow(outBW)
    imwrite(outBW, "F:\2. UG\ACADEMICS\SEM 8\1. Project\Codes\Dataset\set 2\SEGMENTED\" + extension+"\"+jpegFiles(i).name);
    %% Fractal Estimation
    Fr = hausDim(outBW);
    %% Export to Excel
%     Y=[{jpegFiles(i).name, Fr}];
%     X = [X;Y];
 end
% xlswrite(extension+'.xlsx',X)
    
    
    
    
    

