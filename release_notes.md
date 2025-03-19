# Image Zoom Level and Pan Utilities: Release Notes

## Version 2.0.3

There are no code or functional changes in this release. It is only for resolving an issue with the File Exchange connection.

## Version 2.0.2

**Bug fix.** Previously, the code for determining the axes extent in pixels had undesirable side effects. This issue is now resolved.

## Version 2.0.1

**Bug fix.** Previously, the function `setAxesCenterXY` was incorrectly updating the center location using the specified x value in both the horizontal and vertical directions. This issue is now resolved.

## Version 2.0.0

**More convenient zooming.** You can now call a new function, `zoomImage`, for a more convenient way to zoom in and zoom out.

**Bug fix.** Previously, zooming into an image sometimes did not fill the entire plot box. This issue has been resolved.

**Bug fix.** Previously, calling `setImageZoomLevel` sometimes resulted in an incorrect aspect ratio. This issue is now resolved.

**Compatibility issue.** Calling `setImageZoomLevel` now sets the axes `DataAspectRatio`, which in turn causes the `DataAspectRatioMode` to be set to `"manual"`.

## Version 1.0.2

**README and doc changes.** Some File Exchange URLs in the README and documentation have now been corrected.
