%axesXYBoxSize Axes plot box size in data space (x-y) units
%   sz = axesPixelBoxSize returns the size of the axes plotting area in
%   data space (x-y) units. sz is a two-element vector containing the box
%   width and height.

function out = axesXYBoxSize(ax)
    arguments
        ax (1,1) matlab.graphics.axis.Axes = gca
    end

    xlim = ax.XLim;
    ylim = ax.YLim;

    out = [(xlim(2) - xlim(1)) (ylim(2) - ylim(1))];
end