import 'package:flutter/material.dart';
import 'package:flutter_easy_framework/flutter_easy_framework.dart';

class EasyFrameworkLanguage {
  // create once instance
  EasyFrameworkLanguage._internal();
  factory EasyFrameworkLanguage() => instance;
  static final EasyFrameworkLanguage instance = EasyFrameworkLanguage._internal();

  late Map<String, Map<String, String>> _langs;
  get langs => _langs;
  get keys => _langs.keys;
  register(Map<String, Map<String, String>> langs, [String? defaultKey]) {
    _langs = langs;
    if (EasyFramework.instance.prefs.getString('language') == null) {
      defaultKey = defaultKey ?? _langs.keys.first;
      if (_langs[defaultKey] != null) {
        EasyFramework.instance.prefs.setString('language', defaultKey);
      } else {
        throw 'register Not Found: $defaultKey';
      }
    }
  }

  String getLanguage() {
    return EasyFramework.instance.prefs.getString('language') ?? _langs.keys.first;
  }

  Locale getLocale(String lang) {
    List code = lang.split('_');
    return Locale(code[0], code[1]);
  }

  void updateLocale(String key) {
    if (_langs[key] != null) {
      List code = key.split('_');
      Get.updateLocale(Locale(code[0], code[1]));
      EasyFramework.instance.prefs.setString('language', key);
    } else {
      throw 'updateLocale Not Found: $key';
    }
  }
}
