import 'package:flutter/material.dart';
import 'package:movie_app/enums/user_type.dart';
import 'package:movie_app/models/admin.dart';
import 'package:movie_app/models/bases/person.dart';
import 'package:movie_app/theme/theme.dart';

class AdminList extends StatelessWidget {
  const AdminList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie List",
      debugShowCheckedModeBanner: false,
      theme: theme(context),
      home: const AdminWidget(),
    );
  }
}

class AdminWidget extends StatefulWidget {
  const AdminWidget({super.key});

  @override
  State<AdminWidget> createState() => _AdminWidgetState();
}

class _AdminWidgetState extends State<AdminWidget> {
  List<Widget> listOfAdmin = [];

  @override
  void initState() {
    super.initState();

    if (admins.isEmpty) {
      for (var i = 0; i < 30; i++) {
        Admin admin = Admin("admin$i", "admin$i", "admin$i@gmail.com",
            "${i}00 000 0000", UserType.admin);
        admin.register();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin List"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 8),
          child: Center(
            child: Column(children: <Widget>[
              const Text(
                "Admin List",
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
              const Padding(padding: EdgeInsets.all(1)),
              admins.isNotEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * .8,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(1),
                        itemCount: admins.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(
                              Icons.person,
                              size: 40,
                            ),
                            iconColor: Colors.white,
                            title: Text(
                              "${admins[index].firstName.toString()} ${admins[index].lastName.toString()}",
                            ),
                            subtitle: Text(
                              "${admins[index].eMail.toString()} - ${admins[index].phoneNumber.toString()}",
                            ),
                            onTap: () => {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    _detailPage(context, admins[index]),
                              )
                            },
                            trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  admins[index].remove();
                                });
                              },
                              icon: const Icon(Icons.delete, color: Colors.red),
                            ),
                          );
                        },
                      ),
                    )
                  : const Text("Empty List"),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _detailPage(BuildContext context, Admin info) {
    return AlertDialog(
      backgroundColor: const Color.fromRGBO(13, 17, 23, 1),
      title: const Center(child: Text('Admin Detail')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "${info.firstName} ${info.lastName}",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                info.eMail,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                info.phoneNumber,
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Center(
              child: Icon(
            Icons.close,
            size: 50,
          )),
        ),
      ],
    );
  }
}
