/*
 * File: constants.dart
 * Project: CVideo
 * File Created: Thursday, 4th June 2020 10:59 am
 * Author: luonglvse130702 (luonglvse130702@fpt.edu.vn)
 * -----
 * Last Modified: Thursday, 4th June 2020 2:55 pm
 * Modified By: luonglvse130702 (luonglvse130702@fpt.edu.vn>)
 * -----
 * Copyright (c) Daxua Team
 */
class AppConstants {
  static const SECURE_API_TOKEN = "SECURE_API_TOKEN";
  static const LANGUAGE_CODE = "language_code";
}

class AppRoutes {
  static const SCR001_SCREEN = "/SCR001";
  static const SCR002_SCREEN = "/SCR002";
  static const SCR003_SCREEN = "/SCR003";
  static const SCR004_SCREEN = "/SCR004";
  static const SCR001_SPLASH = "/SPLASH";
  static const SCR005_SCREEN = "/SCR005";
  static const SCR006_SCREEN = "/SCR006";
  static const SCR007_SCREEN = "/SCR007";
  static const SCR008_SCREEN = "/SCR008";
  static const SCR009_SCREEN = "/SCR009";
  static const SCR010_SCREEN = "/SCR010";
  static const SCR011_SCREEN = "/SCR011";
}

class SCR001Constants {
  static const FCM_ERR = "cr001.errMsgFCM";
  static const API_TOKEN_ERR = "scr001.errMsgApiToken";
  static const LOGIN_FAIL_ERR = "scr001.errMsgLoginFail";
}

class AppSupportLanguage {
  static const Map<String, String> languageSupports = {
    "vi": "Tiếng Việt",
    "en": "English"
  };
}
