%[text] # Live Editor Interactive Test Script for Image Zoom and Pan Tools
%[text] 1. Clear all output.
%[text] 2. Run the whole script. Verify the graphics and numerical outputs in each section. 
%[text] 3. In a couple of sections, change something in the code and re-run just that section. Verify the section's outputs, and check that other section outputs were not affected.
%[text] 4. Close the script without saving the file. \
%%
im = imshow("peppers.png")
getImageZoomLevel(im)
getAxesCenterXY
%%
setImageZoomLevel(50,im)
getImageZoomLevel(im)
getAxesCenterXY
%%
setImageZoomLevel(400,im)
getImageZoomLevel(im)
getAxesCenterXY
%%
setImageZoomLevel(20)
getImageZoomLevel
getAxesCenterXY
%%
setImageZoomLevel("fit",im)
getImageZoomLevel
getAxesCenterXY
%%
ax = im.Parent;
setAxesCenterXY([50 50],ax)
getAxesCenterXY(ax)
getImageZoomLevel

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
