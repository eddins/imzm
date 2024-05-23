function out = imageUnclippedSizeInScreenPixels(im)
    arguments
        im (1,1) matlab.graphics.primitive.Image
    end

    ax = ancestor(im,"axes");
    out = (imzm.internal.imageSizeInXY(im) ./ ...
        imzm.internal.axesBoxSizeInXY(ax)) .* ...
        imzm.internal.axesBoxSizeInScreenPixels(ax);
end