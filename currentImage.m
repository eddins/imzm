function im = currentImage
    im = gobjects;
    r = groot;
    fig = r.CurrentFigure;
    if isempty(fig)
        return
    end

    ax = fig.CurrentAxes;
    if isempty(ax)
        return
    end

    im = findobj(ax,"type","image");

    im = im(1);
end