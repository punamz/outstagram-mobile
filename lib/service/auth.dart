

import 'package:http/http.dart' as http;
import 'package:outstagram/service/APIs.dart';

abstract class AuthBase {
  Future<http.Response> signIn(String email, String password);
}

class Auth implements AuthBase {
  @override
  Future<http.Response> signIn(String email, String password) async {
    return await http.post(
      Uri.parse(APIPath.signIn()),
      body: <String, String>{
        'email': email,
        'password': password,
      },
    );
  }
}
