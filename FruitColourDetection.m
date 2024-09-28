% Load the image
% Allow the user to select an image
[filename, pathname] = uigetfile({'*.png;*.bmp'}, 'Select an image');
img= imread(fullfile(pathname, filename));

% Convert the image to the HSV color space
hsvImage = rgb2hsv(img);

% Define color thresholds for different fruits
bananaLower = [0.12, 0.2, 0.7];
bananaUpper = [0.18, 1, 1];

watermelonLower = [0, 0.3, 0.4];
watermelonUpper = [0.05, 1, 1];

grapesLower = [0.65, 0.2, 0];
grapesUpper = [0.75, 1, 0.6];

orangeLower = [0.05, 0.5, 0.6];
orangeUpper = [0.11, 1, 1];

appleLower = [0, 0.6, 0.3];
appleUpper = [0.1, 1, 1];

strawberryLower = [0.9, 0.2, 0.2];
strawberryUpper = [1,1,1];

greenAppleLower = [0.2, 0.3, 0.3];
greenAppleUpper = [0.3, 1, 1];

% Segment the fruits based on the defined color thresholds
mask_banana = (hsvImage(:,:,1) >= bananaLower(1)) & (hsvImage(:,:,1) <= bananaUpper(1)) ...
              & (hsvImage(:,:,2) >= bananaLower(2)) & (hsvImage(:,:,2) <= bananaUpper(2)) ...
              & (hsvImage(:,:,3) >= bananaLower(3)) & (hsvImage(:,:,3) <= bananaUpper(3));

mask_watermelon = (hsvImage(:,:,1) >= watermelonLower(1)) & (hsvImage(:,:,1) <= watermelonUpper(1)) ...
            & (hsvImage(:,:,2) >= watermelonLower(2)) & (hsvImage(:,:,2) <= watermelonUpper(2)) ...
            & (hsvImage(:,:,3) >= watermelonLower(3)) & (hsvImage(:,:,3) <= watermelonUpper(3));

mask_grapes = (hsvImage(:,:,1) >= grapesLower(1)) & (hsvImage(:,:,1) <= grapesUpper(1)) ...
              & (hsvImage(:,:,2) >= grapesLower(2)) & (hsvImage(:,:,2) <= grapesUpper(2)) ...
              & (hsvImage(:,:,3) >= grapesLower(3)) & (hsvImage(:,:,3) <= grapesUpper(3));

mask_orange = (hsvImage(:,:,1) >= orangeLower(1)) & (hsvImage(:,:,1) <= orangeUpper(1)) ...
              & (hsvImage(:,:,2) >= orangeLower(2)) & (hsvImage(:,:,2) <= orangeUpper(2)) ...
              & (hsvImage(:,:,3) >= orangeLower(3)) & (hsvImage(:,:,3) <= orangeUpper(3));

mask_apple = (hsvImage(:,:,1) >= appleLower(1)) & (hsvImage(:,:,1) <= appleUpper(1)) ...
             & (hsvImage(:,:,2) >= appleLower(2)) & (hsvImage(:,:,2) <= appleUpper(2)) ...
             & (hsvImage(:,:,3) >= appleLower(3)) & (hsvImage(:,:,3) <= appleUpper(3));

mask_strawberry = (hsvImage(:,:,1) >= strawberryLower(1)) & (hsvImage(:,:,1) <= strawberryUpper(1)) ...
                  & (hsvImage(:,:,2) >= strawberryLower(2)) & (hsvImage(:,:,2) <= strawberryUpper(2)) ...
                  & (hsvImage(:,:,3) >= strawberryLower(3)) & (hsvImage(:,:,3) <= strawberryUpper(3));



mask_greenApple = (hsvImage(:,:,1) >= greenAppleLower(1)) & (hsvImage(:,:,1) <= greenAppleUpper(1)) ...
                  & (hsvImage(:,:,2) >= greenAppleLower(2)) & (hsvImage(:,:,2) <= greenAppleUpper(2)) ...
                  & (hsvImage(:,:,3) >= greenAppleLower(3)) & (hsvImage(:,:,3) <= greenAppleUpper(3));

% Calculate the area of the segmented regions
banana_area = sum(mask_banana(:));
watermelon_area = sum(mask_watermelon(:));
grapes_area = sum(mask_grapes(:));
orange_area = sum(mask_orange(:));
apple_area = sum(mask_apple(:));
strawberry_area = sum(mask_strawberry(:));
greenApple_area = sum(mask_greenApple(:));

% Determine the fruit based on the area of the segmented regions
fruits = {'Banana', 'watermelon', 'Grapes', 'Orange', 'Apple', 'Strawberry', 'Green Apple'};
area_list = [banana_area, watermelon_area, grapes_area, orange_area, apple_area, strawberry_area,greenApple_area];
[~, idx] = max(area_list);
fruit_name = fruits{idx};

% Display the result
imshow(img);
title(['Detected Fruit: ', fruit_name]);
