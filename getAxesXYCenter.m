function center = getAxesXYCenter(ax)
    arguments
        ax (1,1) matlab.graphics.axis.Axes = gca
    end

    xlim = ax.XLim([1 end]);
    ylim = ax.YLim([1 end]);
    center = [mean(xlim) mean(ylim)];
end
