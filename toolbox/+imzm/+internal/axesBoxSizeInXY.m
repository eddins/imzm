function out = axesBoxSizeInXY(ax)
    arguments
        ax (1,1) matlab.graphics.axis.Axes = gca
    end

    xlim = ax.XLim;
    ylim = ax.YLim;

    out = [(xlim(2) - xlim(1)) (ylim(2) - ylim(1))];
end