%setImageZoomLevel Set image zoom level
%
%   setImageZoomLevel(level) sets the zoom level of the image in the
%   current axes in the current figure. Most commonly, the zoom level is
%   set as a scalar, specified as a percentage, that applies in both the
%   horizontal and vertical directions. A zoom level of 100 means the image
%   pixel is the same size as a screen pixel. The level can also be a
%   two-element vector, [level_x level_y], that specifies the zoom level
%   independently for the horizontal and vertical directions.
%
%   setImageZoomLevel(level,im) sets the zoom level of the specified
%   graphics image object.
%
%   NOTE: if the axes DataAspectRatioMode is 'manual', then setting the
%   zoom level so that the ratio between the horizontal and vertical zoom
%   levels changes is not possible, and an error message will result.
%
%   See also getImageZoomLevel

function setImageZoomLevel(new_level,im)
    arguments
        new_level (1,2) double {mustBeReal, mustBeFinite}
        im    (1,1) matlab.graphics.primitive.Image = imzm.internal.currentImage
    end

    current_level = getImageZoomLevel(im);
    ax = ancestor(im,"axes");

    if ax.DataAspectRatioMode == "manual"
        current_level_ratio = current_level(1) / current_level(2);
        new_level_ratio = new_level(1) / new_level(2);
        if ~almostEqual(current_level_ratio,new_level_ratio)
            error("imzm:InvalidRatioChange",...
                "Cannot change the x/y ratio of the zoom level when " + ...
                "the axes DataAspectRatioMode is ""manual"".")
        end
    end
    
    s = current_level ./ new_level;

    c = getAxesCenterXY(ax);

    ax.XLim = s(1) * (ax.XLim - c(1)) + c(1);
    ax.YLim = s(2) * (ax.YLim - c(2)) + c(2);
end

function tf = almostEqual(a,b)
    tol = eps(class(a))^0.75;
    tf = abs(a - b) <= tol*max(abs(a),abs(b));
end

% Steve Eddins
