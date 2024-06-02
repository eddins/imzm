classdef setImageZoomLevel_test < matlab.unittest.TestCase

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
            setImageZoomLevel([100 100],im);
            drawnow

            actual = getImageZoomLevel(im);
            expected = [100 100];
            test_case.verifyEqual(actual,expected);
        end

        function scalarInput(test_case)
            ax = axes(Units = "pixels", Position = [100 100 50 50],...
                Parent = test_case.TestFigure);
            im = imagesc(ones(10,25),Parent = ax);
            setImageZoomLevel(100,im);
            drawnow

            actual = getImageZoomLevel(im);
            expected = [100 100];
            test_case.verifyEqual(actual,expected);            
        end

        function basicFitBehavior(test_case)
            ax = axes(Parent = test_case.TestFigure);
            im = imagesc(ones(10,25),Parent = ax);
            setImageZoomLevel(5,im);
            setImageZoomLevel("fit",im);

            actual = ax.XLim;
            expected = [0.5 25.5];
            test_case.verifyEqual(actual,expected);

            actual = ax.YLim;
            expected = [0.5 10.5];
            test_case.verifyEqual(actual,expected);
        end

        function oneRowFitBehavior(test_case)
            ax = axes(Parent = test_case.TestFigure);
            im = imagesc(ones(1,25),Parent = ax);
            setImageZoomLevel(5,im);
            setImageZoomLevel("fit",im);

            actual = ax.YLim;
            expected = [0.5 1.5];
            test_case.verifyEqual(actual,expected);
        end

        function oneColumnFitBehavior(test_case)
            ax = axes(Parent = test_case.TestFigure);
            im = imagesc(ones(10,1),Parent = ax);
            setImageZoomLevel(5,im);
            setImageZoomLevel("fit",im);

            actual = ax.XLim;
            expected = [0.5 1.5];
            test_case.verifyEqual(actual,expected);
        end

        function dataAspectRatioModeManual(test_case)
            ax = axes(Units = "pixels", Position = [100 100 50 50],...
                Parent = test_case.TestFigure);
            im = imagesc(ones(10,25),Parent = ax);
            ax.DataAspectRatioMode = "manual";
            drawnow

            setImageZoomLevel(100,im);
            actual = getImageZoomLevel(im);
            expected = [100 100];
            test_case.verifyEqual(actual,expected);             
        end

        function dataAspectRatioModeManualErrorCase(test_case)
            ax = axes(Units = "pixels", Position = [100 100 50 50],...
                Parent = test_case.TestFigure);
            im = imagesc(ones(10,25),Parent = ax);
            ax.DataAspectRatioMode = "manual";
            drawnow

            test_case.verifyError(@() setImageZoomLevel([100 125],im),...
                "imzm:InvalidRatioChange");            
        end        
    end
end

% Steve Eddins