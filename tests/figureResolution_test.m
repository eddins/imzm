classdef figureResolution_test < matlab.unittest.TestCase
    properties
        TestFigure
    end

    methods (TestMethodSetup)
        function createFigure(test_case)
            test_case.TestFigure = figure;
            addTeardown(test_case,@() close(test_case.TestFigure));
            drawnow;
        end
    end

    methods (Test)
        function runsWithoutError(test_case)
            % There is no way to independently verify the answer, so just
            % run the function and make sure it equals the figure's
            % ScreenPixelsPerInch property.

            actual = imzm.internal.figureResolution(test_case.TestFigure);
            expected = test_case.TestFigure.ScreenPixelsPerInch;
            test_case.verifyEqual(actual,expected);
        end  
    end
end