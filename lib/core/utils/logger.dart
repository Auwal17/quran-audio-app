/// Simple Logger for debugging
class Logger {
  static const String _prefix = '[QuranApp]';

  static void log(String message) {
    print('$_prefix [INFO] $message');
  }

  static void warning(String message) {
    print('$_prefix [WARNING] $message');
  }

  static void error(String message, [StackTrace? stackTrace]) {
    print('$_prefix [ERROR] $message');
    if (stackTrace != null) {
      print('$_prefix [STACKTRACE]\n$stackTrace');
    }
  }
}
