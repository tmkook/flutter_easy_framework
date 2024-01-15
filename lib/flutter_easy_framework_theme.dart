import 'package:flutter/material.dart';
import 'package:flutter_easy_framework/flutter_easy_framework.dart';

class EasyFrameworkTheme {
  // create once instance
  EasyFrameworkTheme._internal();
  factory EasyFrameworkTheme() => instance;
  static final EasyFrameworkTheme instance = EasyFrameworkTheme._internal();

  late Map<String, ThemeData> _themes;
  get themes => _themes;
  get keys => _themes.keys;
  register(Map<String, ThemeData> themes, [String? defaultKey]) {
    _themes = themes;
    if (EasyFramework.instance.prefs.getString('theme') == null) {
      defaultKey = defaultKey ?? _themes.keys.first;
      if (_themes[defaultKey] != null) {
        EasyFramework.instance.prefs.setString('theme', defaultKey);
      } else {
        throw 'Not Found: $defaultKey';
      }
    }
  }

  String getTheme() {
    return EasyFramework.instance.prefs.getString('theme') ?? _themes.keys.first;
  }

  ThemeData getThemeData(String key) {
    return _themes[key] ?? ThemeData.light();
  }

  String getThemeMode() {
    return EasyFramework.instance.prefs.getString('themeMode') ?? 'light';
  }

  ThemeMode getThemeModeData(String mode) {
    if (mode == 'light') {
      return ThemeMode.light;
    } else if (mode == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  void updateThemeMode(String mode) {
    if (mode == 'light') {
      Get.changeThemeMode(ThemeMode.light);
    } else if (mode == 'dark') {
      Get.changeThemeMode(ThemeMode.dark);
    } else if (mode == 'system') {
      Get.changeThemeMode(ThemeMode.system);
    } else {
      throw 'updateThemeMode Not Found: $mode';
    }
    EasyFramework.instance.prefs.setString('themeMode', mode);
  }

  void updateTheme(String key) {
    if (_themes[key] != null) {
      Get.changeTheme(_themes[key]!);
      EasyFramework.instance.prefs.setString('theme', key);
    } else {
      throw 'updateTheme Not found: $key';
    }
  }
}
