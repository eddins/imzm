function out = getImageZoomLevel(im)
    arguments
        im (1,1) matlab.graphics.primitive.Image = currentImage
    end

    out = imageUnclippedSizeInScreenPixels(im) ./ ...
        size(im.CData,[2 1]);

    out = out * 100;
end