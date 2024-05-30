%imageUnclippedExtentPixels Image unclipped extent in pixel units
%
%   extent = imageUnclippedExtentPixels(im) returns the unclipped extent of
%   the graphics image object in pixel units. The output, extent, is a
%   two-element vector containing the horizontal and vertical extent.
%
%   This is an internal function that is not intended as a public
%   interface.

function extent = imageUnclippedExtentPixels(im)
    arguments
        im (1,1) matlab.graphics.primitive.Image
    end

    ax = ancestor(im,"axes");
    extent = (imzm.internal.imageUnclippedExtentXY(im) ./ ...
        imzm.internal.axesPlotAreaExtentXY(ax)) .* ...
        imzm.internal.axesPlotAreaExtentPixels(ax);
end

% Steve Eddins
