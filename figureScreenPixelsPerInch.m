function sppi = figureScreenPixelsPerInch(fig)
    arguments
        fig (1,1) matlab.ui.Figure = gcf
    end

    sppi = fig.ScreenPixelsPerInch;
end