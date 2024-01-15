import 'package:flutter_easy_framework/flutter_easy_framework.dart';
import 'package:flutter_easy_framework/flutter_easy_framework_language.dart';
import 'package:flutter_easy_framework/flutter_easy_framework_theme.dart';
import 'package:flutter/material.dart';
import './apps/views/home.dart';
import './apps/routes.dart';
import './apps/bootstrap.dart';

void main() async {
  EasyFramework frame = EasyFramework();
  await frame.init();
  await bootstrap();
  runApp(const MyApp());
}

class Langs extends Translations {
  @override
  Map<String, Map<String, String>> get keys => EasyFrameworkLanguage.instance.langs;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = EasyFrameworkTheme.instance.getThemeData(EasyFrameworkTheme.instance.getTheme());
    ThemeData darkTheme = EasyFrameworkTheme.instance.getThemeData('dark');
    ThemeMode mode = EasyFrameworkTheme.instance.getThemeModeData(EasyFrameworkTheme.instance.getThemeMode());
    Locale locale = EasyFrameworkLanguage.instance.getLocale(EasyFrameworkLanguage.instance.getLanguage());

    return GetMaterialApp(
      initialRoute: '/',
      getPages: routes,
      translations: Langs(),
      debugShowCheckedModeBanner: false,
      themeMode: mode,
      locale: locale,
      fallbackLocale: Get.deviceLocale,
      theme: theme,
      darkTheme: darkTheme,
      home: const Home(),
    );
  }
}
