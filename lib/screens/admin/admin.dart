import 'package:flutter/material.dart';
import 'package:movie_app/widgets/dark_text_field.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Admin"),
      ),
      body: ListView(
        children: [
          Center(
            child: Text(
              "Add admin",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * .1,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: DarkTextField(),
          ),
        ],
      ),
    );
  }
}
