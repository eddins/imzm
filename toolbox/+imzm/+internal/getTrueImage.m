function im = getTrueImage(im)
    fig = ancestor(im,"figure");
    if string(fig.Tag) == "EmbeddedFigure_Internal"
        return
    end    
    ax = ancestor(im,"axes");
    embedded_ax = imzm.internal.getTrueAxes(ax);
    if ax ~= embedded_ax
        all_images = findobj(ax,"type","image");
        k = find(all_images == im);
        all_embedded_images = findobj(embedded_ax,"type","image");
        if (k <= numel(all_embedded_images))
            im = all_embedded_images(k);
        end
    end
end
