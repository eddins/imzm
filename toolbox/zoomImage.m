%zoomImage Zoom image in or out
%
%   zoomImage(factor) zooms in (magnifies) the image in the current axes if
%   factor is greater than 1, or it zooms out (minifies) an image if factor
%   is less than 1. For example, zoomImage(2) magnifies the image by a
%   factor of 2.
%
%   zoomImage(factor,im) zooms the specified graphics image object.
%
%   See also getImageZoomLevel, setImageZoomLevel

function zoomImage(zoom_factor,im)
    arguments
        zoom_factor (1,1) {mustBePositive, mustBeFinite}
        im    (1,1) matlab.graphics.primitive.Image = imzm.internal.currentImage
    end

    setImageZoomLevel(zoom_factor * getImageZoomLevel(im), im);
end