// ignore_for_file: avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:movie_app/enums/gender.dart';
import 'package:movie_app/enums/user_type.dart';
import 'package:movie_app/models/admin.dart';
import 'package:movie_app/models/bases/person.dart';
import 'package:movie_app/models/member.dart';
import 'package:movie_app/screens/test_screen.dart';

void main() {
  runApp(const App());
}

const Color darkColor = Color.fromRGBO(13, 17, 23, 1);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie List",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.amber,
          scaffoldBackgroundColor: darkColor,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
                decorationColor: Colors.white,
              )),
      home: const MovieApp(),
    );
  }
}

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<StatefulWidget> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.movie,
          ),
        ),
        title: const Text(
          "Movie App",
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TestScreen()),
              );
            },
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: const <Widget>[
              Text("Context"),
            ],
          ),
        ),
      ),
    );
  }
}
