import 'dart:io';

void main(List<String> args) async {
  ProcessResult res = await Process.run('ls',[]);
  // ignore: avoid_print
  print(res.stdout);
}