import 'dart:io';

void main(List<String> args) async {
  await Process.run('cp -Rf packages/flutter_easy_framework/example lib',[]);
}