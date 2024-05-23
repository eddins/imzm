function sppi = figureScreenPixelsPerInch(fig)
    arguments
        fig (1,1) matlab.ui.Figure
    end

    sppi = fig.ScreenPixelsPerInch;
end