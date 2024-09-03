part of core_ui;

class AppImages {

  static const String packageName = kPackageName;

  static const String _basePath = kImagesPath;

  static const String _woozyFaceKey = '${_basePath}woozy-face.png';
  static const String _happyFaceKey = '${_basePath}happy-face.png';
  static const String _lovedFaceKey = '${_basePath}loved-face.png';
  static const String _neutralFaceKey = '${_basePath}neutral-face.png';
  static const String _poutingFaceKey = '${_basePath}pouting-face.png';
  static const String _sadFaceKey = '${_basePath}sad-face.png';
  static const String _hidePasswordKey = '${_basePath}hide-password.png';

  static const AppImage woozyFace = AppImage(_woozyFaceKey);
  static const AppImage happyFace = AppImage(_happyFaceKey);
  static const AppImage lovedFace = AppImage(_lovedFaceKey);
  static const AppImage neutralFace = AppImage(_neutralFaceKey);
  static const AppImage poutingFace = AppImage(_poutingFaceKey);
  static const AppImage sadFace = AppImage(_sadFaceKey);
  static const AppImage hidePassword = AppImage(_hidePasswordKey);
}
