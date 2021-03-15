import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

String generateSimpleModel(Map<String, dynamic> data) {
  String definitions = '';
  String identifiers = '';

  for (String key in data.keys) {
    if (data[key] is String) {
      definitions += "$key = json['$key']";
      identifiers += "final String $key;";
    }
  }

  final String contents = """
    class _InternalGenerated {
       A.fromJson(Map<String, dynamic> json) :
       $definitions
       ;
    
    $identifiers;
    }
    """;

  return contents;
}

void main() {
  test('parse json from API response', () {
    final String file = File('model.json').readAsStringSync();
    final Map<String, dynamic> data = jsonDecode(file);
    print(data.keys);

    String definitions = '';
    String identifiers = '';

    for (String key in data.keys) {
      if (data[key] is String) {
        print(data[key]);
        definitions += "$key = json['$key']";
        identifiers += "final String $key;";
      }
    }

    String contents = """
class _InternalGenerated {
   _InternalGenerated.fromJson(Map<String, dynamic> json) :
   $definitions
   ;

$identifiers
}
    """;

    var newFile = File('result.dart').writeAsStringSync(contents);
  });
}
