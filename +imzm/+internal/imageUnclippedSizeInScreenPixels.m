function out = imageUnclippedSizeInScreenPixels(im)
    arguments
        im (1,1) matlab.graphics.primitive.Image
    end

    ax = ancestor(im,"axes");
    out = (imzm.internal.imageSizeInXY(im) ./ axesBoxSizeInXY(ax)) .* ...
        axesBoxSizeInScreenPixels(ax);
end