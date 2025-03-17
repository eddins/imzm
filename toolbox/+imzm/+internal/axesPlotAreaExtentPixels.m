%axesPlotAreaExtentPixels Axes plot area extent in pixels
%   extent = axesPlotAreaExtentPixels returns the extent of the axes
%   plotting area in pixels. extent is a two-element vector containing the
%   plot area width and height.
%
%   The function tightPosition is used to determine the plot area.
%
%   This is an internal function that is not intended as a public
%   interface.

function extent = axesPlotAreaExtentPixels(ax)
    extent = getObjectPixelSize(ax);
end

function wh = getObjectPixelSize(obj)
    root = groot;

    if (obj == root)
        wh = obj.ScreenSize(3:4);
        return
    end

    if (isa(obj, "matlab.graphics.axis.Axes") || ...
            isa(obj, "matlab.ui.control.UIAxes"))
        pos = tightPosition(obj);
    else
        pos = obj.Position;
    end

    switch obj.Units
        case "normalized"
            wh = pos(3:4) .* ...
                getObjectPixelSize(obj.Parent);

        case "inches"
            wh = pos(3:4) * root.ScreenPixelsPerInch;

        case "centimeters"
            wh = pos(3:4) * root.ScreenPixelsPerInch / 2.54;

        case "characters"
            error("imzm:CharacterUnitsNotSupported",...
                "Character units not supported.")

        case "points"
            wh = pos(3:4) * root.ScreenPixelsPerInch / 72;

        case "pixels"
            wh = pos(3:4);

        otherwise
            error("imzm:UnknownUnits", ...
                "Unknown object units: ""%s""", obj.Units)
    end
end

% Copyright (c) 2024-2025 Steven L. Eddins
