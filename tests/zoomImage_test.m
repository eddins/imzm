classdef zoomImage_test < matlab.unittest.TestCase

    methods (Test)
        function basicTest(test_case)
            fig = figure;
            addTeardown(test_case, @() close(fig));

            ax = axes(Parent = fig);
            im = imagesc(ones(10,25), Parent = ax);

            setImageZoomLevel(100,im);
            drawnow
            zoomImage(2,im);

            test_case.verifyEqual(getImageZoomLevel, [200 200], ...
                AbsTol = 0.1);
        end   

        function negativeZoomFactor_test(test_case)
            fig = figure;
            addTeardown(test_case, @() close(fig));

            ax = axes(Parent = fig);
            im = imagesc(ones(10,25), Parent = ax);  

            test_case.verifyError(@()zoomImage(-5,im),...
                "MATLAB:validators:mustBePositive");
        end

        function infiniteZoomFactor_test(test_case)
            fig = figure;
            addTeardown(test_case, @() close(fig));

            ax = axes(Parent = fig);
            im = imagesc(ones(10,25), Parent = ax);  

            test_case.verifyError(@()zoomImage(inf,im),...
                "MATLAB:validators:mustBeFinite");
        end        
    end
end

% Copyright (c) 2024 Steven L. Eddins