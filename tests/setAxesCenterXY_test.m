classdef setAxesCenterXY_test < matlab.unittest.TestCase
    properties
        TestFigure
    end

    methods (TestMethodSetup)
        function createFigure(test_case)
            test_case.TestFigure = figure(Units = "pixels", ...
                Position = [100 100 800 200]);
            addTeardown(test_case,@() close(test_case.TestFigure));
        end
    end

    methods (Test)
        function simplePlot(test_case)
            ax = axes(Parent = test_case.TestFigure);
            plot(ax,1:2:9);
            drawnow
            center = getAxesCenterXY(ax);
            new_center = center - [1 2];
            setAxesCenterXY(new_center,ax);
            drawnow
            xlim = ax.XLim;
            ylim = ax.YLim;

            test_case.verifyEqual(mean(xlim),new_center(1));
            test_case.verifyEqual(mean(ylim),new_center(2));
        end
    end
end