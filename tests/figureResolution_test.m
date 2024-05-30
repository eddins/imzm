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
            % run the function and make sure it runs without error and
            % returns a positive result.

            actual = imzm.internal.figureResolution(test_case.TestFigure);
            mustBePositive(actual);
        end  
    end
end

% Steve Eddins