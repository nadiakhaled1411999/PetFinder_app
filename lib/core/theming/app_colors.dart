import 'dart:ui';

class AppColors {
  AppColors._();
  static final AppColors _instance = AppColors._();
  factory AppColors() => _instance;

  static const Color primaryColor = Color(0xff44BDB6);

  static const Color black = Color(0xff090909);
  static const Color grey = Color(0xff9F9F9F);
  static const Color grey0 = Color(0xffF6F6F6);
  static const Color white = Color(0xffFFFFFF);
  static const Color white2 = Color(0xffEDF9F7);
  static const Color grey2 = Color(0xff8F8F8F);
  static const Color grey3 = Color(0xff646464);
}
