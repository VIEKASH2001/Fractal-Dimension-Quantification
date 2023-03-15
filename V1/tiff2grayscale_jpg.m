path = 'F:\2. UG\ACADEMICS\ARCHIVED\SEM 8\1. Project\Codes\Dataset\Myopia\SL_Myopia\';
jpegFiles = dir(path); % 'clear' is the name of directory in which all the images are kept
numfiles = length(jpegFiles); % stores number of images in that folder
for i = 3:numfiles
    filename = string(path)+string(jpegFiles(i).name);
    img =imread(filename);
    imgsp = img(:,:,1); % Red channel
    a = split(filename,".");
    newp = string(a{1}) + '.' + string(a{2})+ '.' + string(a{3}) + '.' + string(a{4}) + '.' + 'jpg';%this part keeps changing according to the number of dots
    imwrite(imgsp, newp);
end