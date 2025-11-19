// Conditional export to provide the web hostname at runtime.
export 'auth_domain_stub.dart'
    if (dart.library.html) 'auth_domain_web.dart';
