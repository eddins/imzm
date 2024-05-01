function out = imagePixelSizeInInches(im)
    arguments
        im (1,1) matlab.graphics.primitive.Image = findimage;
    end

    fig = ancestor(im,"figure");
    out = (imageScreenMagnification(im)/100) ./ figureScreenPixelsPerInch(fig);
end