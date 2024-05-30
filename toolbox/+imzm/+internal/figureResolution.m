%figureResolution Approximate figure resolution (pixels per inch)
%
%   res = figureResolution returns a rough approximation of the figure's
%   screen resolution in pixels per inch.
%
%   This is an internal function that is not intended as a public
%   interface.

function res = figureResolution(fig)
    arguments
        fig (1,1) matlab.ui.Figure
    end

    original_units = fig.Units;
    units_restorer = onCleanup(@() setUnits(fig,original_units));

    fig.Units = "pixels";
    pixel_position = fig.Position;
    fig.Units = "inches";
    inches_position = fig.Position;

    res = pixel_position(3) / inches_position(3);
end

function setUnits(fig,new_units)
    fig.Units = new_units;
end

% Steve Eddins
