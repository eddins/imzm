# Image Zoom Level and Pan Utilities: Release Notes

## Version 2.0.2

Reimplemented the code that determines the axes pixel extent to avoid temporarily setting the axes `Units` to `"pixels"`, which had undesirable side effects.

## Version 2.0.1

Fixed bug in `setAxesCenterXY`. This function was previously updating the center location using the specified x value in both the horizontal and vertical directions.

## Version 2.0.0

Added new function, `zoomImage`, for a more convenient way to zoom in and zoom out.

Modified the zooming implementation to allow a zoomed-in image to fill the entire plot box.

### Compatibility Considerations

In this release, calling `setImageZoomLevel`, or calling the new function `zoomImage`, sets the axes `DataAspectRatio`, which in turn causes the `DataAspectRatioMode` to be set to `"manual"`.

## Version 1.0.2

Updated some File Exchange URLs.
