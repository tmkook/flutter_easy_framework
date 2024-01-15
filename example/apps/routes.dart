import 'package:flutter_easy_framework/flutter_easy_framework.dart';
import './views/home.dart';

final List<GetPage> routes = [
  GetPage(name: "/", page: () => const Home()),
];
