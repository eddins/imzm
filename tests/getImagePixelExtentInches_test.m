classdef getImagePixelExtentInches_test < matlab.unittest.TestCase

    properties
        TestFigure
    end

    methods (TestMethodSetup)
        function createFigure(test_case)
            test_case.TestFigure = figure(Units = "inches", ...
                Position = [1 1 6 4]);
            addTeardown(test_case,@() close(test_case.TestFigure));
        end
    end

    methods (Test)
        function basicTest(test_case)
            ax = axes(Units = "inches", Position = [1 1 4 2],...
                Parent = test_case.TestFigure);
            im = imagesc(ones(10,25),Parent = ax);
            drawnow;

            actual = getImagePixelExtentInches(im);
            expected = [4/25 2/10];
            test_case.verifyEqual(actual,expected,...
                AbsTol = 0.01);
        end      
    end
end

% Copyright (c) 2024 Steven L. Eddins