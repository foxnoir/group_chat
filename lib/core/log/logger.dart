import 'package:japanese_tutorials_app/core/di/di.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@singleton
class LoggerService {
  LoggerService()
      : _logger = Logger(
          printer: PrettyPrinter(
            lineLength: 80,
            dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
          ),
        );
  final Logger _logger;

  /// Debug-Level-Logs
  void debug(String message) {
    _logger.d(message);
  }

  /// Info-Level-Logs
  void info(String message) {
    _logger.i(message);
  }

  /// Warn-Level-Logs
  void warning(String message) {
    _logger.w(message);
  }

  /// Error-Level-Logs
  void error(String message, {Object? error, StackTrace? stackTrace}) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Fatal-Level-Logs
  void fatal(String message, {Object? error, StackTrace? stackTrace}) {
    _logger.f(message, error: error, stackTrace: stackTrace);
  }
}

LoggerService get logger => DI.getIt<LoggerService>();
