function im = currentImage
    im = gobjects(1,0);
    r = groot;
    fig = r.CurrentFigure;
    if ~isempty(fig)
        ax = fig.CurrentAxes;
        if ~isempty(ax)
            ax_im = findobj(ax,"type","image");
            if ~isempty(ax_im)
                im = ax_im(1);
            end
        end
    end
end
