function out = getImageZoomLevel(im)
    arguments
        im (1,1) matlab.graphics.primitive.Image = imzm.internal.currentImage
    end

    out = imzm.internal.imageUnclippedSizeInScreenPixels(im) ./ ...
        size(im.CData,[2 1]);

    out = out * 100;
end