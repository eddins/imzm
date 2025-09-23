%axesPlotAreaExtentPixels Axes plot area extent in pixels
%   extent = axesPlotAreaExtentPixels returns the extent of the axes
%   plotting area in pixels. extent is a two-element vector containing the
%   plot area width and height.
%
%   The function tightPosition is used to determine the plot area.
%
%   This is an internal function that is not intended as a public
%   interface.

function extent = axesPlotAreaExtentPixels(ax)
    extent = getObjectPixelSize(ax);
end

function wh = getObjectPixelSize(obj)
    root = groot;

    if (obj == root)
        wh = obj.ScreenSize(3:4);
        return
    end

    if imzm.internal.liveEditorRunning
        if isa(obj, "matlab.ui.Figure")
            fig_embedded = imzm.internal.findEmbeddedFigure(obj);
            if ~isempty(fig_embedded)
                % The Live Editor has already created a shadow figure to
                % contain the embedded graphics. Use the shadow figure for
                % subsequent calculations.
                obj = fig_embedded;
            else
                % Although we are running the Live Editor, the shadow
                % figure has not yet been created. The only thing to do is
                % to continue the calculations based on the original
                % figure. There's nothing to do in this branch.
            end
        end
    end

    if (isa(obj, "matlab.graphics.axis.Axes") || ...
            isa(obj, "matlab.ui.control.UIAxes"))
        pos = tightPosition(obj);
    else
        pos = obj.Position;
    end

    switch obj.Units
        case "normalized"
            wh = pos(3:4) .* ...
                getObjectPixelSize(obj.Parent);

        case "inches"
            wh = pos(3:4) * root.ScreenPixelsPerInch;

        case "centimeters"
            wh = pos(3:4) * root.ScreenPixelsPerInch / 2.54;

        case "characters"
            error("imzm:CharacterUnitsNotSupported",...
                "Character units not supported.")

        case "points"
            wh = pos(3:4) * root.ScreenPixelsPerInch / 72;

        case "pixels"
            wh = pos(3:4);

        otherwise
            error("imzm:UnknownUnits", ...
                "Unknown object units: ""%s""", obj.Units)
    end
end

% Copyright (c) 2024-2025 Steven L. Eddins
