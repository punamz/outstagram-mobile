import 'package:flutter/material.dart';
import 'package:outstagram/GUI/landing_page.dart';
import 'package:outstagram/service/auth.dart';
import 'package:outstagram/service/database.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthBase>(create: (_) => Auth()),
        Provider<Database>(create: (_) => MongoDatabase())
      ],
      child: MaterialApp(
        title: 'Outstagram',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LandingPage(),
      ),
    );

    //   Provider<AuthBase>(
    //   create: (_) => Auth(),
    //   child: MaterialApp(
    //     title: 'Outstagram',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     home: LandingPage(),
    //   ),
    // );
  }
}
