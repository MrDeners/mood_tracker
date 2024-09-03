class AuthConstants {
  static const String lengthMapKey = 'length';
  static const String casesMapKey = 'cases';
  static const String specialSymbolsMapKey = 'specialSymbols';

  static const String nameError = 'nameError';
  static const String emailError = 'emailError';
  static const String passwordError = 'passwordError';
  static const String confirmPasswordError = 'confirmPasswordError';

  static RegExp emailStructureRegular = RegExp(r'^[a-zA-Z0-9.]*@[a-zA-Z]*.[a-zA-Z]*$');
  static RegExp passwordCaseRegular = RegExp(r'^(?=.*[a-z])(?=.*[A-Z]).*$');
  static RegExp passwordSpecialSymbolRegular = RegExp(r'^(?=.*[!@#$%^&*()-_+=]).*$');
}
