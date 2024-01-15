import 'dart:ui';

import 'package:flutter_easy_framework/flutter_easy_framework.dart';
import 'package:flutter_easy_framework/flutter_easy_framework_theme.dart';
import 'package:flutter_easy_framework/flutter_easy_framework_language.dart';
import '../states/welcome_state.dart';

class WelcomeLogic extends GetxController {
  final user = WelcomeState().obs;

  void updateTheme(String name) {
    EasyFrameworkTheme.instance.updateTheme(name);
    user.value.theme = name;
    user.refresh();
  }

  void updateLocale(String name) {
    EasyFrameworkLanguage.instance.updateLocale(name);
    Get.updateLocale(const Locale('zh', 'CN'));
    user.value.locale = name;
    user.refresh();
  }

  void increase() {
    user.value.counter += 1;
    user.refresh();
  }
}
