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
    arguments
        ax (1,1) matlab.graphics.axis.Axes
    end

    original_units = ax.Units;
    unit_restorer = onCleanup(@() setAxesUnits(ax,original_units));
    ax.Units = "pixels";
    pixel_position = tightPosition(ax);
    extent = pixel_position(3:4);
end

function setAxesUnits(ax,units)
    ax.Units = units;
end

% Copyright (c) 2024 Steven L. Eddins
