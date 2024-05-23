function setAxesXYCenter(center,ax)
    arguments
        center (1,2) double
        ax (1,1) matlab.graphics.axis.Axes = gca
    end

    current_center = getAxesXYCenter(ax);
    shiftxy = center - current_center;
    ax.XLim = ax.XLim + shiftxy(1);
    ax.YLim = ax.YLim + shiftxy(2);
end
