import 'dart:developer';

import 'package:core/core.dart';
import 'package:domain/domain.dart';

class SafeRequestService {
  static const String noMessageExceptionCode = 'No message';
  static const String invalidCredentialExceptionCode = 'invalid-credential';
  static const String invalidCredentialsExceptionCode = 'invalid-credential';
  static const String invalidEmailExceptionCode = 'invalid-email';
  static const String userDisabledExceptionCode = 'user-disabled';
  static const String userNotFoundExceptionCode = 'user-not-found';
  static const String wrongPasswordExceptionCode = 'wrong-password';
  static const String emailAlreadyInUseExceptionCode = 'email-already-in-use';
  static const String operationNotAllowedExceptionCode = 'operation-not-allowed';
  static const String weakPasswordExceptionCode = 'weak-password';

  static Future<T?> firebaseSafeRequest<T>(Future<dynamic> Function() request) async {
    try {
      return await request();
    } on FirebaseAuthException catch (error) {
      log(error.toString());
      final String? response = error.message;
      log(response ?? noMessageExceptionCode);
      final String responseCode = error.code;
      log(responseCode);

      if (responseCode == invalidCredentialExceptionCode) {
        throw AppException(
          errorMessage: LocaleKeys.validators_invalidCredential.tr(),
          code: AppExceptionCode.invalidEmail,
        );
      }
      if (responseCode == invalidEmailExceptionCode) {
        throw AppException(
          errorMessage: LocaleKeys.validators_emailInvalid.tr(),
          code: AppExceptionCode.invalidEmail,
        );
      }
      if (responseCode == userDisabledExceptionCode) {
        throw AppException(
          errorMessage: LocaleKeys.validators_accountDisabled.tr(),
          code: AppExceptionCode.disabledAccount,
        );
      }
      if (responseCode == userNotFoundExceptionCode) {
        throw AppException(
          errorMessage: LocaleKeys.validators_emailNotRegister.tr(),
          code: AppExceptionCode.notRegistered,
        );
      }
      if (responseCode == wrongPasswordExceptionCode) {
        throw AppException(
          errorMessage: LocaleKeys.validators_passwordWrong.tr(),
          code: AppExceptionCode.wrongPassword,
        );
      }
      if (responseCode == emailAlreadyInUseExceptionCode) {
        throw AppException(
          errorMessage: LocaleKeys.validators_emailInUse.tr(),
          code: AppExceptionCode.usedEmail,
        );
      }
      if (responseCode == operationNotAllowedExceptionCode) {
        throw AppException(
          errorMessage: LocaleKeys.validators_registrationNotAllowed.tr(),
          code: AppExceptionCode.notAllowedRegistrationMethod,
        );
      }
      if (responseCode == weakPasswordExceptionCode) {
        throw AppException(
          errorMessage: LocaleKeys.validators_passwordDifficult.tr(),
          code: AppExceptionCode.weakPassword,
        );
      }
    } catch (e) {
      throw const AppException.unknown();
    }
    return null;
  }
}
