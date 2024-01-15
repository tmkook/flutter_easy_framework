import 'package:flutter_easy_framework/flutter_easy_framework.dart';
import 'package:flutter/material.dart';
import '../logics/welcome_logic.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final WelcomeLogic welcome = Get.put(WelcomeLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("app.name".tr),
        ),
        floatingActionButton: IconButton(
            icon: const Icon(Icons.play_arrow),
            onPressed: () {
              Get.toNamed('/?test=1');
            }),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text("counter: ${welcome.user.value.counter}")),
            ElevatedButton(child: const Text('+1'), onPressed: () => welcome.increase()),
            const Divider(height: 50),
            Text("${"app.theme".tr}: ${welcome.user.value.theme}"),
            ElevatedButton(child: Text('app.light'.tr), onPressed: () => welcome.updateTheme('light')),
            ElevatedButton(child: Text('app.dark'.tr), onPressed: () => welcome.updateTheme('dark')),
            const Divider(height: 50),
            Text("locale: ${welcome.user.value.locale}"),
            ElevatedButton(child: Text('app.zh_CN'.tr), onPressed: () => welcome.updateLocale('zh_CN')),
            ElevatedButton(child: Text('app.en_US'.tr), onPressed: () => welcome.updateLocale('en_US')),
          ],
        ));
  }
}
