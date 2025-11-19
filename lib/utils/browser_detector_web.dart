// Web implementation that uses `dart:html` to inspect the user agent.
// The file is only included on web builds via conditional export. Suppress
// lints that disallow web-only imports in non-plugin packages.
// ignore_for_file: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:html' as html;

bool isIosSafari() {
  final ua = html.window.navigator.userAgent.toLowerCase();
  final isIos = ua.contains('iphone') || ua.contains('ipad') || ua.contains('ipod');
  final isSafari = ua.contains('safari') && !ua.contains('crios') && !ua.contains('fxios') && !ua.contains('chrome');
  return isIos && isSafari;
}
