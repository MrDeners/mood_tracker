import 'app_exception_code.dart';

class AppException implements Exception {
  final String? errorMessage;
  final AppExceptionCode code;

  const AppException({
    required this.code,
    this.errorMessage,
  });

  const AppException.unknown({
    this.errorMessage,
  }) : code = AppExceptionCode.unknown;

  String get message => errorMessage ?? '';

  @override
  String toString() {
    return message;
  }
}
