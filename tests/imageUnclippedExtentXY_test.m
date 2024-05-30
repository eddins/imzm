classdef imageUnclippedExtentXY_test < matlab.unittest.TestCase
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
        function defaultXY(test_case)
            ax = axes(Parent = test_case.TestFigure);
            im = image(ones(20,10),Parent = ax);
            actual = imzm.internal.imageUnclippedExtentXY(im);
            expected = [10 20];
            test_case.verifyEqual(actual,expected);
        end

        function alternativeXY(test_case)
            ax = axes(Parent = test_case.TestFigure);
            im = image(ones(17,33),Parent = ax,...
                XData = [1 4],YData = [1 2]);

            actual = imzm.internal.imageUnclippedExtentXY(im);
            expected = [3+3/32, 1+1/16];
            test_case.verifyEqual(actual,expected);
        end
    end
end

% Steve Eddins