classdef imageUnclippedExtentPixels_test < matlab.unittest.TestCase
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
        function fillAxes(test_case)
            ax = axes(Parent = test_case.TestFigure, ...
                Units = "pixels", ...
                Position = [0 0 800 200]);
            im = image(ones(200,800),Parent = ax);
            drawnow
            actual = imzm.internal.imageUnclippedExtentPixels(im);
            expected = [800 200];
            test_case.verifyEqual(actual,expected,...
                AbsTol = 1);
        end

        function zoomedOut(test_case)
            ax = axes(Parent = test_case.TestFigure, ...
                Units = "pixels", ...
                Position = [0 0 800 200]);
            im = image(ones(40,50),XData = [1 50],YData = [1 40]);
            ax.XLim = [0.5 800.5];
            ax.YLim = [0.5 200.5];
            drawnow
            actual = imzm.internal.imageUnclippedExtentPixels(im);
            expected = [50 40];
            test_case.verifyEqual(actual,expected,...
                AbsTol = 1);
        end

        function zoomedIn(test_case)
            ax = axes(Parent = test_case.TestFigure, ...
                Units = "pixels", ...
                Position = [0 0 800 200]);
            im = image(ones(40,50),XData = [1 50],YData = [1 40]);
            ax.XLim = [0.5 200.5];
            ax.YLim = [0.5 50.5];
            drawnow    

            actual = imzm.internal.imageUnclippedExtentPixels(im);
            expected = [200 160];
            test_case.verifyEqual(actual,expected,...
                AbsTol = 1);
        end
    end
end

% Steve Eddins