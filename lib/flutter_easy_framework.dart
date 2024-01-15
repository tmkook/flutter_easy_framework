import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';
export 'package:get/get.dart';

class EasyFramework {
  // create once instance
  EasyFramework._internal();
  factory EasyFramework() => instance;
  static final EasyFramework instance = EasyFramework._internal();

  //added events
  final Map<String, Function> _events = {};

  //init data
  late SharedPreferences prefs;
  late Map<String, dynamic> hardinfo;

  // async package init
  init() async {
    WidgetsFlutterBinding.ensureInitialized();
    prefs = await SharedPreferences.getInstance();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    hardinfo = (await deviceInfo.deviceInfo).data;
  }

  String parseVersion(String v) {
    List<String> a = v.split('+');
    List<String> n = a[0].split('.');
    int b = int.parse(n[0]);
    int m = int.parse(n[1]);
    int l = int.parse(n[2]);
    int p = int.parse(a[1]);
    if (p > 99) {
      b += p ~/ 100;
      p = p % 100;
    }
    if (p > 9) {
      m += p ~/ 10;
      p = p % 10;
    }
    l += p;
    return "$b.$m.$l";
  }

  Map parseSimpleYaml(String yaml) {
    Map data = {};
    Iterable<Match> match = RegExp(r'(\w+): ([\.\w\" \:\/]{2,})').allMatches(yaml);
    for (Match item in match) {
      data[item.group(1)] = item.group(2);
    }
    return data;
  }

  bool listenerEvent(String name, Function func) {
    _events[name] = func;
    return _events[name] == func;
  }

  bool removeEvent(name) {
    _events.remove(name);
    return _events[name] == null;
  }

  dynamic emmitEvent(name, data) {
    if (_events[name] == null) {
      return null;
    }
    return _events[name]!(data);
  }
}
