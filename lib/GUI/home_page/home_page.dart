import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outstagram/models/user.dart';
import 'package:outstagram/service/database.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, @required this.onSignOut}) : super(key: key);

  final VoidCallback onSignOut;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> getPost(String token) async {
    try {
      final database = Provider.of<Database>(context, listen: false);
      final response = await database.getPosts(token);
      log(response.body);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      body: Container(
        child: Column(
          children: [
            Text(user.token),
            ElevatedButton(
              child: Text("click me!"),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10),),
                ),
              ),
              onPressed: ()=>getPost(user.token),
            ),
            ElevatedButton(
              child: Text("logout"),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              onPressed: widget.onSignOut,
            )
          ],
        ),
      ),
    );
  }
}
