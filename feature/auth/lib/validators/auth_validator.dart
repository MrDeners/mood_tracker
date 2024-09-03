import 'package:core/core.dart';

import '../constants/note_constants.dart';

class AuthValidator {
  static String? nameValidator({
    required String value,
  }) {
    return value.isEmpty ? LocaleKeys.validators_nameEmpty.tr() : null;
  }

  static String? emailValidator({
    required String value,
  }) {
    String? result;
    if (value.isEmpty) {
      result = LocaleKeys.validators_emailEmpty.tr();
    } else if (!AuthConstants.emailStructureRegular.hasMatch(value)) {
      result = LocaleKeys.validators_emailNotExist.tr();
    } else {
      result = null;
    }

    return result;
  }

  static String? passwordValidator({
    required String value,
  }) {
    String? result;
    if (value.isEmpty) {
      result = LocaleKeys.validators_passwordEmpty.tr();
    } else if (value.length < 8) {
      result = LocaleKeys.validators_passwordShort.tr();
    } else if (value.length > 20) {
      result = LocaleKeys.validators_passwordLong.tr();
    } else if (!AuthConstants.passwordCaseRegular.hasMatch(value)) {
      result = LocaleKeys.validators_passwordCase.tr();
    } else if (!AuthConstants.passwordSpecialSymbolRegular.hasMatch(value)) {
      result = LocaleKeys.validators_passwordSpecSymbols.tr();
    } else {
      result = null;
    }

    return result;
  }

  static String? confirmPasswordValidator({
    required String password,
    required String confirmPassword,
  }) {
    String? result;
    if (confirmPassword.isEmpty) {
      result = LocaleKeys.validators_confirmPasswordEmpty.tr();
    } else if (password != confirmPassword) {
      result = LocaleKeys.validators_passwordMismatch.tr();
    } else {
      result = null;
    }

    return result;
  }

  static Map<String, bool>? passwordRealTimeValidator({
    required String value,
  }) {
    final Map<String, bool> validity = <String, bool>{
      AuthConstants.lengthMapKey: false,
      AuthConstants.casesMapKey: false,
      AuthConstants.specialSymbolsMapKey: false,
    };
    if (value.isEmpty) {
      return null;
    }

    if (value.length >= 8 && value.length <= 20) {
      validity[AuthConstants.lengthMapKey] = true;
    }

    if (AuthConstants.passwordCaseRegular.hasMatch(value)) {
      validity[AuthConstants.casesMapKey] = true;
    }

    if (AuthConstants.passwordSpecialSymbolRegular.hasMatch(value)) {
      validity[AuthConstants.specialSymbolsMapKey] = true;
    }

    return validity;
  }
}
