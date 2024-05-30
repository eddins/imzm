classdef axesPlotAreaExtentPixels_test < matlab.unittest.TestCase
    properties
        TestFigure
    end

    methods (TestMethodSetup)
        function createFigure(test_case)
            test_case.TestFigure = figure(Units = "pixels",...
                Position = [100 100 800 400]);
            addTeardown(test_case,@() close(test_case.TestFigure));
        end
    end

    methods (Test)
        function fullSizeAxes(test_case)
            ax = axes(Parent = test_case.TestFigure, ...
                Units = "normalized", ...
                Position = [0 0 1 1]);
            drawnow;
            actual = imzm.internal.axesPlotAreaExtentPixels(ax);
            expected = [800 400];
            test_case.verifyEqual(actual,expected,AbsTol = 2);
        end

        function PartialSizeAxes(test_case)
            ax = axes(Parent = test_case.TestFigure,...
                Units = "pixels",...
                Position = [100 100 400 200]);
            drawnow;
            actual = imzm.internal.axesPlotAreaExtentPixels(ax);
            expected = [400 200];
            test_case.verifyEqual(actual,expected);
        end        
    end
end