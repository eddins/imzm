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
%   Alternatively, level can be the string "fit". In this case, the axes
%   limits (XLim and YLim properties) are set to show the entire image.
%
%   setImageZoomLevel(level,im) sets the zoom level of the specified
%   graphics image object.
%
%   NOTE: The function setImageZoomLevel works by setting the axes XLim and
%   YLim properties, which has the side effect of setting the axes XLimMode
%   and YLimMode properties to "manual". The function does not change the
%   axes or figure position, and it does not change the axes
%   DataAspectRatio or DataAspectRatioMode.
%
%   NOTE: if the axes DataAspectRatioMode is 'manual', then setting the
%   zoom level so that the ratio between the horizontal and vertical zoom
%   levels changes is not possible, and an error message will result.
%
%   See also getImageZoomLevel

function setImageZoomLevel(new_level,im)
    arguments
        new_level {mustBePlausibleZoomLevel}
        im    (1,1) matlab.graphics.primitive.Image = imzm.internal.currentImage
    end

    if isnumeric(new_level)
        new_level = checkNumericLevel(new_level);
    else
        new_level = checkTextLevel(new_level);
    end

    ax = ancestor(im,"axes");

    isfit = isa(new_level,"imzm.internal.ZoomLevelOptions") && ...
        (new_level == "fit");

    if isfit
        fitImage(ax,im);
        return
    end

    current_level = getImageZoomLevel(im);

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

function out = checkNumericLevel(in)
    arguments
        in (1,2) double {mustBeReal, mustBeFinite}
    end

    out = in;
end

function out = checkTextLevel(in)
    arguments
        in (1,1) imzm.internal.ZoomLevelOptions
    end
    out = in;
end

function mustBePlausibleZoomLevel(level)
    good_type = isnumeric(level) || isstring(level) || ischar(level);
    if ~good_type
        error("imzm:InvalidLevelType",...
            "Zoom level must be a number, a vector of two numbers, " + ...
            "or the string ""fit"".")
    end
end

function fitImage(ax,im)
    M = size(im.CData,1);
    N = size(im.CData,2);
    pixel_width = extent(N,im.XData);
    pixel_height = extent(M,im.YData);

    ax.XLim = [im.XData(1) - (pixel_width/2), im.XData(end) + (pixel_width/2)];
    ax.YLim = [im.YData(1) - (pixel_height/2), im.YData(end) + (pixel_height/2)];
end

function ext = extent(N,data)
    if (N == 1)
        ext = 1;
    else
        ext = (data(end) - data(1)) / (N - 1);
    end
end

function tf = almostEqual(a,b)
    tol = eps(class(a))^0.75;
    tf = abs(a - b) <= tol*max(abs(a),abs(b));
end

% Steve Eddins
