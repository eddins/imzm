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
            ax = axes(Units = "pixels", Position = [100 100 50 50]);
            im = imagesc(ones(10,25),Parent = ax);
            setImageZoomLevel([100 100],im);
            drawnow

            actual = getImageZoomLevel(im);
            expected = [100 100];
            test_case.verifyEqual(actual,expected);
        end

        function scalarInput(test_case)
            ax = axes(Units = "pixels", Position = [100 100 50 50]);
            im = imagesc(ones(10,25),Parent = ax);
            setImageZoomLevel(100,im);
            drawnow

            actual = getImageZoomLevel(im);
            expected = [100 100];
            test_case.verifyEqual(actual,expected);            
        end

        function dataAspectRatioModeManual(test_case)
            ax = axes(Units = "pixels", Position = [100 100 50 50]);
            im = imagesc(ones(10,25),Parent = ax);
            ax.DataAspectRatioMode = "manual";
            drawnow

            setImageZoomLevel(100,im);
            actual = getImageZoomLevel(im);
            expected = [100 100];
            test_case.verifyEqual(actual,expected);             
        end

        function dataAspectRatioModeManualErrorCase(test_case)
            ax = axes(Units = "pixels", Position = [100 100 50 50]);
            im = imagesc(ones(10,25),Parent = ax);
            ax.DataAspectRatioMode = "manual";
            drawnow

            test_case.verifyError(@() setImageZoomLevel([100 125],im),...
                "imzm:InvalidRatioChange");            
        end        
    end
end

% Steve Eddins