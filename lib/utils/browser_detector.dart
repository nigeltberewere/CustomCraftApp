// Public entry for browser detection utilities.
// Uses conditional export so `dart:html` is only referenced on web builds.
export 'browser_detector_stub.dart'
    if (dart.library.html) 'browser_detector_web.dart';
