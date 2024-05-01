function setmaglevel(mag,options)
    arguments
        mag  (1,1) double = 100
        options.Image (1,1) matlab.graphics.primitive.Image
        options.Center (1,2) double
    end

    if ~isfield(options,"Image")
        options.Image = findimage;
    end

    ax = ancestor(options.Image,"axes");
    xlim = ax.XLim([1 end]);
    ylim = ax.YLim([1 end]);

    if ~isfield(options,"Center")
        cx = mean(xlim);
        cy = mean(ylim);
    else
        cx = options.Center(1);
        cy = options.Center(2);
    end

    start_mag = imageScreenMagnification(options.Image);
    sx = mag / start_mag(1);
    sy = mag / start_mag(2);

    new_xlim = (xlim - cx)/sx + cx;
    ax.XLim = new_xlim;

    new_ylim = (ylim - cy)/sy + cy;
    ax.YLim = new_ylim;
end
