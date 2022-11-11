import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Movie"),
      ),
      body: const Center(
        child: Text(
          "Movie",
        ),
      ),
    );
  }
}
