function setImageZoomLevel(scale,im)
    arguments
        scale (1,2) double {mustBeReal, mustBeFinite}
        im    (1,1) matlab.graphics.primitive.Image = currentImage
    end

    current_scale = getImagePixelDisplayScale(im);
    s = current_scale ./ scale;

    ax = ancestor(im,"axes");
    c = getAxesDisplayCenter(ax);

    ax.XLim = s(1) * (ax.XLim - c(1)) + c(1);
    ax.YLim = s(2) * (ax.YLim - c(2)) + c(2);
end