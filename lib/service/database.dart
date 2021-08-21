import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:outstagram/service/APIs.dart';

abstract class Database {
  Future<http.Response> getPosts(String token);
}

class MongoDatabase implements Database {
  Future<http.Response> getPosts(String token) async {
    log(token);
    return await http.get(
      Uri.parse(APIPath.posts()),
      headers: {
        'Authorization': token,
      },
    );
  }
}
