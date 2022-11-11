import 'package:flutter/material.dart';

class MemberScreen extends StatelessWidget {
  const MemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Member"),
      ),
      body: const Center(
        child: Text(
          "Members",
        ),
      ),
    );
  }
}
