import 'package:flutter/material.dart';
import 'package:movie_app/enums/gender.dart';
import 'package:movie_app/enums/user_type.dart';
import 'package:movie_app/models/admin.dart';
import 'package:movie_app/screens/admin/admin_list.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  final TextEditingController _controllerEMail = TextEditingController();
  final TextEditingController _controllerPhoneNumber = TextEditingController();
  Gender _gender = Gender.custom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Admin"),
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Add admin",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * .1,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controllerFirstName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controllerLastName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Surname",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _controllerEMail,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.phone,
              controller: _controllerPhoneNumber,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Phone Number",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
          ListTile(
            title: const Text("Female"),
            leading: Radio<Gender>(
              value: Gender.female,
              groupValue: _gender,
              onChanged: (Gender? value) {
                setState(
                  () {
                    _gender = value!;
                  },
                );
              },
              fillColor: const MaterialStatePropertyAll<Color>(
                Colors.white,
              ),
            ),
          ),
          ListTile(
            title: const Text("Male"),
            leading: Radio<Gender>(
              value: Gender.male,
              groupValue: _gender,
              onChanged: (Gender? value) {
                setState(
                  () {
                    _gender = value!;
                  },
                );
              },
              fillColor: const MaterialStatePropertyAll<Color>(
                Colors.white,
              ),
            ),
          ),
          ListTile(
            title: const Text("Custom"),
            leading: Radio<Gender>(
              value: Gender.custom,
              groupValue: _gender,
              onChanged: (Gender? value) {
                setState(
                  () {
                    _gender = value!;
                  },
                );
              },
              fillColor: const MaterialStatePropertyAll<Color>(
                Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {
                registerAdmin();
              },
              child: const Text("Submit"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AdminList(),
                  ),
                );
              },
              child: const Text(
                "Show Admins",
              ),
            ),
          ),
        ],
      ),
    );
  }

  registerAdmin() {
    String firstName = _controllerFirstName.text.toString().trim();
    String lastName = _controllerLastName.text.toString().trim();
    String eMail = _controllerEMail.text.toString().trim();
    String phoneNumber = _controllerPhoneNumber.text.toString().trim();

    Admin admin =
        Admin(firstName, lastName, eMail, phoneNumber, UserType.admin);
    if (_gender.name.isNotEmpty) admin.gender = _gender;
    admin.register();

    setState(() {
      _controllerFirstName.clear();
      _controllerLastName.clear();
      _controllerEMail.clear();
      _controllerPhoneNumber.clear();
      _gender = Gender.custom;
    });
  }
}
