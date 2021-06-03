import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:dart_model_maker/dart_model_maker.dart';

void main() {
  test('parse json from API response', () {
    final String file = File('model.json').readAsStringSync();
    final Map<String, dynamic> data = jsonDecode(file);

    etch(data);

    File('result.dart').writeAsStringSync(models.join('\n'));

    Process.runSync('flutter', ['format', 'result.dart']);
  });
}
