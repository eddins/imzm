function out = axesBoxSizeInScreenPixels(ax)
    arguments
        ax (1,1) matlab.graphics.axis.Axes
    end

    old_units = ax.Units;
    units_resetter = onCleanup(@() setAxesUnits(ax,old_units));
    ax.Units = "pixels";
    pos = tightPosition(ax);
    out = pos(3:4);
end

function setAxesUnits(ax,units)
    ax.Units = units;
end