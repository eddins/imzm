%figureResolution Approximate figure resolution (pixels per inch)
%
%   res = figureResolution returns a rough approximation of the figure's
%   screen resolution in pixels per inch.
%
%   This function is a wrapper around the undocumented figure property,
%   ScreenPixelsPerInch. Unlike the ScreenPixelsPerInch property on the
%   graphics root (groot), a figure's ScreenPixelsPerInch does account for
%   high-resolution displays.

function sppi = figureResolution(fig)
    arguments
        fig (1,1) matlab.ui.Figure
    end

    sppi = fig.ScreenPixelsPerInch;
end