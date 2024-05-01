function out = imageUnclippedSizeInScreenPixels(im)
    arguments
        im (1,1) matlab.graphics.primitive.Image = findimage
    end

    ax = ancestor(im,"axes");
    out = (imageSizeInXY(im) ./ axesBoxSizeInXY(ax)) .* ...
        axesBoxSizeInScreenPixels(ax);
end