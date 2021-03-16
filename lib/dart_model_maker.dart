library dart_model_maker;

dynamic generateSimpleModel(Map<String, dynamic> data, String parentKey) {
  String definitions = '';
  String identifiers = '';

  for (String key in data.keys) {
    if (data[key] is String) {
      definitions += "$key = json['$key'],\n";
      identifiers += "final String $key; \n";
    }

    if (data[key] is num) {
      definitions += "$key = json['$key'],\n";
      identifiers += "final num $key; \n";
    }

    if (data[key] is bool) {
      definitions += "$key = json['$key'],\n";
      identifiers += "final bool $key; \n";
    }

    if (data[key] is Map) {
      String capsKey = _capitalise(key);
      definitions += "$key = $capsKey.fromJson(json['$key']),\n";
      identifiers += "final $capsKey $key;\n";
    }

    if (data[key] is List) {
      if (data[key].isNotEmpty) {
        String capsKey = _capitalise(key);
        definitions += """ $key = List<Map<String, dynamic>>.from(json['$key'])
          .map((dynamic value) => $capsKey.fromJson(value))
          .toList(),
      """;
        identifiers += "final List<$capsKey> $key;\n";
      }
    }
  }

  definitions = definitions.substring(0, definitions.length - 2);

  final String contents = """
class $parentKey {
   $parentKey.fromJson(Map<String, dynamic> json) :
   $definitions;

$identifiers
}
    """;

  return contents;
}

String _capitalise(String s) => s[0].toUpperCase() + s.substring(1);

final List<String> models = [];

dynamic etch(Map<String, dynamic> data, [String parentKey = 'Response']) {
  models.add(generateSimpleModel(data, parentKey));

  for (String key in data.keys) {
    if (data[key] is Map) {
      etch(data[key], _capitalise(key));
    }

    if (data[key] is List) {
      if (data[key].isNotEmpty) {
        etch(data[key][0], _capitalise(key));
      }
    }
  }
}
