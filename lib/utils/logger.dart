import 'package:logger/logger.dart';

class AppLogger {
  Logger logger = Logger();

  void logDebug({required final String message}) => logger.d(message);

  void logError(
          {required final String message,
          dynamic error,
          final StackTrace? stackTrace}) =>
      logger.e(message, error, stackTrace);
}
