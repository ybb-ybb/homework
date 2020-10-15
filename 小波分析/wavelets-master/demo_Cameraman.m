im = imread('cameraman.tif');
inputImage = im2double(im);
transformedImage = TwoDHaarTransform(inputImage);
ReconstructedImage = TwoDHaarReconstruction(transformedImage);
ReconstructedImage = round(ReconstructedImage*10^4)/10^4;

figure, subplot(1, 3, 1), imshow(inputImage), title('Input Image');
subplot(1, 3, 2), imshow(transformedImage(2:size(inputImage, 1), 1:size(inputImage, 2)), []), title('Transformed Image');
subplot(1, 3, 3), imshow(ReconstructedImage), title('Reconstructed Image');