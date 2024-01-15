import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_easy_framework/flutter_easy_framework.dart';

void main() {
  test('test easy framework', () async {
    EasyFramework frame = EasyFramework();
    String yaml = '''
name: test
description: test
version: 0.0.1
''';
    expect(frame.parseVersion('0.0.0+5'), '0.0.5');
    expect(frame.parseVersion('1.0.0+20'), '1.2.0');
    expect(frame.parseVersion('1.0.0+55'), '1.5.5');
    expect(frame.parseSimpleYaml(yaml), {'name': 'test', 'description': 'test', 'version': '0.0.1'});
    expect(frame.listenerEvent('test', (String data) {
      return data;
    }),true);
    expect(frame.emmitEvent('test', 'test event is running...'), 'test event is running...');
    expect(frame.removeEvent('test'), true);
    expect(frame.emmitEvent('test', 'test event is running...'), null);
  });
}
