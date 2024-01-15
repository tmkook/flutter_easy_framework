import 'package:flutter/material.dart';
import 'package:flutter_easy_framework/flutter_easy_framework_language.dart';
import 'package:flutter_easy_framework/flutter_easy_framework_theme.dart';

// App 启动前的初始化
// EasyFrameworkLanguage 如不注册即不启用多语言
// EasyFrameworkTheme 如不注册即不启用多主题
bootstrap() async {
  EasyFrameworkLanguage frameLang = EasyFrameworkLanguage();
  EasyFrameworkTheme frameTheme = EasyFrameworkTheme();
  frameLang.register({
    "zh_CN": {"app.name": '演示', "app.theme": "主题", "app.light": "白色", "app.dark": "暗黑", "app.system": "系统", "app.themeMode": "主题模式", "app.zh_CN": "中文", "app.en_US": "英文"},
    "en_US": {"app.name": 'Easy Framework Demo', "app.theme": "Theme", "app.light": "Light", "app.dark": "Dark", "app.system": "System", "app.themeMode": "Theme Mode", "app.zh_CN": "Chiness", "app.en_US": "English"}
  });
  frameTheme.register({"light": ThemeData.light(), "dark": ThemeData.dark()});
}
