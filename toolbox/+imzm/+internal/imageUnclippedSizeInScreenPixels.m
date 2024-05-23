function out = imageUnclippedSizeInScreenPixels(im)
    arguments
        im (1,1) matlab.graphics.primitive.Image
    end

    ax = ancestor(im,"axes");
    out = (imzm.internal.imageSizeInXY(im) ./ ...
        imzm.internal.axesXYBoxSize(ax)) .* ...
        imzm.internal.axesPixelBoxSize(ax);
end