classdef getImageZoomLevel_test < matlab.unittest.TestCase

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
        function basicTest(test_case)
            ax = axes(Units = "pixels", Position = [100 100 50 50],...
                Parent = test_case.TestFigure);
            im = imagesc(ones(10,25),Parent = ax);
            drawnow;
            actual = getImageZoomLevel(im);
            expected = [200 500];
            test_case.verifyEqual(actual,expected,...
                AbsTol = 0.1);
        end
    end
end

% Steve Eddins