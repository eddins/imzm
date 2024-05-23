classdef axesPixelBoxSize_test < matlab.unittest.TestCase
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
        function fullSizeAxes(test_case)
            ax = axes(Parent = test_case.TestFigure, ...
                Units = "normalized", ...
                Position = [0 0 1 1]);
            drawnow;
            actual = imzm.internal.axesPixelBoxSize(ax);
            expected = [800 200];
            test_case.verifyEqual(actual,expected);
        end

        function PartialSizeAxes(test_case)
            ax = axes(Parent = test_case.TestFigure, ...
                Units = "pixels", ...
                Position = [10 10 50 80]);
            drawnow;
            actual = imzm.internal.axesPixelBoxSize(ax);
            expected = [50 80];
            test_case.verifyEqual(actual,expected);
        end        
    end
end