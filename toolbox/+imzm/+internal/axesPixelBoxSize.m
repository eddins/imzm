%axesPixelBoxSize Axes plot box size in pixel units
%   sz = axesPixelBoxSize returns the size of the axes plotting area in
%   pixel units. sz is a two-element vector containing the box width and
%   height.
%
%   The function tightPosition is used to determine the plotting area.

function out = axesPixelBoxSize(ax)
    arguments
        ax (1,1) matlab.graphics.axis.Axes
    end

    original_units = ax.Units;
    units_resetter = onCleanup(@() setAxesUnits(ax,original_units));
    ax.Units = "pixels";
    pos = tightPosition(ax);
    out = pos(3:4);
end

function setAxesUnits(ax,units)
    ax.Units = units;
end