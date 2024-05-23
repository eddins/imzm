%currentImage First image found in current axes of current figure
%
%   im = currentImage returns the first graphics image object found in the
%   current axes of the current figure. The output is empty if:
%
%   - There is no current figure, or
%   - The current figure does not have a current axes, or
%   - The current axes of the current figure does not contain an image

function im = currentImage
    im = matlab.graphics.primitive.Image.empty(1,0);
    r = groot;
    fig = r.CurrentFigure;
    if ~isempty(fig)
        ax = fig.CurrentAxes;
        if ~isempty(ax)
            ax_im = findobj(ax,"type","image");
            if ~isempty(ax_im)
                im = ax_im(1);
            end
        end
    end
end
