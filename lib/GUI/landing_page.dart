import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outstagram/BloC/sign_in_bloc.dart';
import 'package:outstagram/GUI/login/sign_in_page.dart';
import 'package:outstagram/service/auth.dart';
import 'package:outstagram/models/user.dart';
import 'package:provider/provider.dart';

import 'home_page/home_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;

  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    if (_user == null) {
      return SignInPage(
        bloc: SignInBloc(auth: auth),
        onSignIn: _updateUser,
      );
    }
    return Provider<User>(
      create: (_) => _user,
      child: HomePage(
        onSignOut: () => _updateUser(null),
      ),
    );
  }
}
