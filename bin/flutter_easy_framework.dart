import 'dart:io';

void main(List<String> args) async {
  await Process.run('cp -Rf plugins/example lib',[]);
}