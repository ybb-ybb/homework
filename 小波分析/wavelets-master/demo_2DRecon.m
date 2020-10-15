cam = im2double(imread('cameraman.tif'));
trans = TwoDHaarTransform(cam);

dirRec = TwoDHaarReconstruction(trans);
dirRec = round(dirRec*10^4)/10^4;

error = 5;
compress = TwoDHaarCompress(trans, error);

% new_compress
rec = TwoDHaarReconstruction(compress);
rec = round(rec*10^4)/10^4;
figure, subplot(2, 3, 1), imshow(cam), title('Input Image');
subplot(2, 3, 2), imshow(trans, []), title('2-D Haar Transformation');
subplot(2, 3, 3), imshow(dirRec, []), title('Direct Reconstruction');
subplot(2, 3, 4), imshow(cam), title('Input Image');
subplot(2, 3, 5), imshow(compress, []), title(['Compressed Transformation';' with Error threshold = ' num2str(error)]);
subplot(2, 3, 6), imshow(rec, []), title({'Reconstructed Compressed';' Transformed Image'});

