import '../../../core.dart';

class AuthValidator {
  static const String lengthMapKey = 'length';
  static const String casesMapKey = 'cases';
  static const String specialSymbolsMapKey = 'specialSymbols';

  static const String emailStructureRegular = r'^[a-zA-Z0-9.]*@[a-zA-Z]*.[a-zA-Z]*$';
  static const String passwordCaseRegular = r'^(?=.*[a-z])(?=.*[A-Z]).*$';
  static const String passwordSpecialSymbolRegular = r'^(?=.*[!@#$%^&*()-_+=]).*$';

  static String? nameValidator({
    required String value,
  }) {
    return value.isEmpty ? LocaleKeys.validators_nameEmpty.tr() : null;
  }

  static String? emailValidator({
    required String value,
  }) {
    return value.isEmpty
        ? LocaleKeys.validators_nameEmpty.tr()
        : !RegExp(emailStructureRegular).hasMatch(value)
            ? LocaleKeys.validators_emailNotExist.tr()
            : null;
  }

  static String? passwordValidator({
    required String value,
  }) {
    return value.isEmpty
    ? LocaleKeys.validators_passwordEmpty.tr()
        : value.length <= 8
    ? LocaleKeys.validators_passwordShort.tr()
        : value.length >= 20
    ? LocaleKeys.validators_passwordLong.tr()
        : !RegExp(passwordCaseRegular).hasMatch(value)
    ? LocaleKeys.validators_passwordCase.tr()
        : !RegExp(passwordSpecialSymbolRegular).hasMatch(value)
    ? LocaleKeys.validators_passwordSpecSymbols.tr()
        : null;
  }


  static String? confirmPasswordValidator({
    required String password,
    required String confirmPassword,
  }) {
    return confirmPassword.isEmpty
        ? LocaleKeys.validators_passwordEmpty.tr()
        : password != confirmPassword
        ? LocaleKeys.validators_passwordMismatch.tr()
        : null;
  }

  static Map<String, bool>? passwordRealTimeValidator({
    required String value,
  }) {
    final Map<String, bool> validity = <String, bool>{
      lengthMapKey: false,
      casesMapKey: false,
      specialSymbolsMapKey: false,
    };
    if (value.isEmpty) {
      return null;
    }

    if (value.length >= 8 && value.length <= 20) {
      validity[lengthMapKey] = true;
    }

    if (RegExp(passwordCaseRegular).hasMatch(value)) {
      validity[casesMapKey] = true;
    }

    if (RegExp(passwordSpecialSymbolRegular).hasMatch(value)) {
      validity[specialSymbolsMapKey] = true;
    }

    return validity;
  }
}
