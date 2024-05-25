%setAxesCenterXY Set the axes center in data space (x-y) coordinates
%
%   setAxesCenterXY(center) sets the center of the plotting area, in
%   data space (x-y) coordinates, of the current axes. The center is
%   returned as a two-element vector, [center_x center_y].
%
%   setAxesCenterXY(center,ax) sets the center of the specified axes.
%
%   See also getAxesCenterXY

% Steve Eddins

function setAxesCenterXY(center,ax)
    arguments
        center (1,2) double
        ax (1,1) matlab.graphics.axis.Axes = gca
    end

    current_center = getAxesCenterXY(ax);
    shiftxy = center - current_center;

    xlim = ax.XLim;
    new_xlim = xlim + shiftxy(1);
    ax.XLim = new_xlim;

    ylim = ax.YLim;
    new_ylim = ylim + shiftxy(1);
    ax.YLim = new_ylim;
end
