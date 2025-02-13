function ax = getTrueAxes(ax)
    fig = ancestor(ax,"figure");
    embedded_fig = imzm.internal.getTrueFigure(fig);
    if fig ~= embedded_fig
        all_axes = findobj(fig,"type","axes");
        k = find(all_axes == ax);
        all_embedded_axes = findobj(embedded_fig,"type","axes");
        if (k <= numel(all_embedded_axes))
            ax = all_embedded_axes(k);
        end
    end
end
