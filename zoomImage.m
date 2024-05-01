function zoomImage(mag,options)
    arguments
        s  (1,1) double = nthroot(2,4)
        options.Image (1,1) matlab.graphics.primitive.Image
        options.Center (1,2) double
        im (1,1) matlab.graphics.primitive.Image = findimage
    end

    ax = ancestor(im,"axes");
    xlim = ax.XLim;
    ylim = ax.YLim;

    center_x = mean(xlim);
    new_xlim = (xlim - center_x)/s + center_x;
    ax.XLim = new_xlim;

    center_y = mean(ylim);
    new_ylim = (ylim - center_y)/s + center_y;
    ax.YLim = new_ylim;
end
