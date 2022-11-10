import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text("Test Screen"),
      ),
      body: Center(
        child: Column(
          children: const <Widget>[
            Text("TestScreen"),
          ],
        ),
      ));
}
