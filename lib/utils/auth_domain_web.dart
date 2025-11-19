// Web implementation that returns the current hostname.
// The file is only included on web builds via conditional export. Suppress
// lints that disallow web-only imports in non-plugin packages and the
// deprecated dart:html member usage warning.
// ignore_for_file: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:html' as html;

String getAuthDomain() => html.window.location.hostname ?? 'customcraftapp.web.app';
