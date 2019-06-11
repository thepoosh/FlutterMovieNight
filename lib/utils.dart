import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

/// Api key loader from given JSON file
class Secret {
  final String apiKey;

  Secret({this.apiKey = ""});

  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    return new Secret(apiKey: jsonMap["movie_db_key"]);
  }
}

class SecretLoader {
  final String secretPath;

  SecretLoader({this.secretPath});

  Future<Secret> load() {
    return rootBundle.loadStructuredData(this.secretPath, (jsonStr) async {
      final secret = Secret.fromJson(json.decode(jsonStr));
      return secret;
    });
  }
}

