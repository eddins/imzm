function [old_scale,old_center] = imageDisplayScale(new_scale,new_center,options)
    arguments
        new_scale (1,1) double = NaN
        new_center (1,2) double = [NaN NaN]
        options.Image (1,1) matlab.graphics.primitive.Image = currentImage
    end

    if ~isfield(options,"Image")
        options.Image = currentImage;
        if isempty(options.Image)
            error("imageDisplayScale:ImageNotFound",...
                "No image found in current axes.");
        end
    end

    im = options.Image;
    ax = ancestor(im,"axes");

    if ~isequal(ax.DataAspectRatio([1 2]),[1 1])
        error("imageDisplayScale:InvalidDataAspectRatio", ...
            "The axes DataAspectRatio is not [1 1 1], " + ...
            "so the image display scale cannot be set to a single value.");
    end

    xlim = ax.XLim([1 end]);
    ylim = ax.YLim([1 end]);
    orig_center = [mean(xlim) mean(ylim)];

    orig_scale = 100 * imageUnclippedSizeInScreenPixels(im) ./ ...
        size(im.CData,[2 1]);

    if ~isnan(new_scale) || any(~isnan(new_center))
        if ~isnan(new_center(1))
            cx = new_center(1);
        else
            cx = orig_center(1);
        end

        if ~isnan(new_center(2))
            cy = new_center(2);
        else
            cy = orig_center(2);
        end

        sx = new_scale / orig_scale(1);
        sy = new_scale / orig_scale(2);

        new_xlim = (xlim - cx)/sx + cx;
        ax.XLim = new_xlim;

        new_ylim = (ylim - cy)/sy + cy;
        ax.YLim = new_ylim;
    end

    if (nargout > 0) || (nargin == 0)
        old_scale = orig_scale;
        old_center = orig_center;
    end
end