function out = getImagePixelSize(im)
    arguments
        im (1,1) matlab.graphics.primitive.Image
    end

    fig = ancestor(im,"figure");
    out = (getImageZoomLevel(im)/100) ./ ...
        imzm.internal.figureResolution(fig);
end