classdef getAxesCenterXY_test < matlab.unittest.TestCase
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
            drawnow;
            actual = getAxesCenterXY(ax);
            expected = [3 5];
            test_case.verifyEqual(actual,expected);
        end       
    end
end

% Steve Eddins