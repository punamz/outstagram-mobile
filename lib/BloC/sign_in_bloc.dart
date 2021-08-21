import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:outstagram/models/user.dart';
import 'package:outstagram/service/auth.dart';
import 'package:outstagram/service/validator.dart';
import 'package:rxdart/rxdart.dart';

class SignInBloc {
  SignInBloc({@required this.auth}) {
    Rx.combineLatest2(_emailController, _passwordController, (email, password) {
      return EmailValidator().isValid(email) &&
          PasswordValidator().isValid(password);
    }).listen((event) {
      signInButtonSink.add(event);
    });
  }

  final AuthBase auth;

  final _isLoadingController = StreamController<bool>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _signInButtonController = BehaviorSubject<bool>();

  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  Stream<String> get emailStream =>
      _emailController.stream.transform(emailValidation).skip(1);

  Sink<String> get emailSink => _emailController.sink;

  Stream<String> get passwordStream =>
      _passwordController.stream.transform(passwordValidation).skip(1);

  Sink<String> get passwordSink => _passwordController.sink;

  Stream<bool> get signInButtonStream => _signInButtonController.stream;

  Sink<bool> get signInButtonSink => _signInButtonController.sink;

  var emailValidation = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      !EmailValidator().isValid(email)
          ? sink.add("Email invalid")
          : sink.add(null);
    },
  );

  var passwordValidation = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      !PasswordValidator().isValid(password)
          ? sink.add("Password invalid")
          : sink.add(null);
    },
  );

  void dispose() {
    _isLoadingController.close();
    _signInButtonController.close();
    _emailController.close();
    _passwordController.close();
  }

  void _setIsLoading(bool isLoading) =>
      _isLoadingController.sink.add(isLoading);

  Future<User> signIn(String email, String password) async {
    try {
      _setIsLoading(true);
      final response = await auth.signIn(email, password);
      if (response.statusCode == 200) {
        log(response.body);
        if (json.decode(response.body)["message"] != null)
          throw Exception(json.decode(response.body)["message"]);
        return User.fromJson(json.decode(response.body));
      } else
        throw Exception('Failed to Connect to Server');
    } catch (e) {
      _setIsLoading(false);
      rethrow;
    } finally {
      _setIsLoading(false);
    }
  }
}
