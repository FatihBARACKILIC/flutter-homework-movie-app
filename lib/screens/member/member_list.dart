import 'package:flutter/material.dart';
import 'package:movie_app/enums/user_type.dart';
import 'package:movie_app/models/member.dart';
import 'package:movie_app/models/bases/person.dart';
import 'package:movie_app/theme/theme.dart';

/// Üyelerin listelendiği sayfa
class MemberList extends StatelessWidget {
  const MemberList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Member List",
      debugShowCheckedModeBanner: false,
      theme: theme(context),
      home: const MemberWidget(),
    );
  }
}

class MemberWidget extends StatefulWidget {
  const MemberWidget({super.key});

  @override
  State<MemberWidget> createState() => _MemberWidgetState();
}

class _MemberWidgetState extends State<MemberWidget> {
  List<Widget> listOfMember = [];

  @override
  void initState() {
    super.initState();

    /// Sayfa boş olduğunda otomatik olarak veri oluşturur
    // if (members.isEmpty) {
    //   for (var i = 0; i < 30; i++) {
    //     Member member = Member("member$i", "member$i", "member$i@gmail.com",
    //         "${i}00 000 0000", UserType.member);
    //     member.register();
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Member List"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 8),
          child: Center(
            child: Column(children: <Widget>[
              const Text(
                "Member List",
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
              const Padding(padding: EdgeInsets.all(1)),
              members.isNotEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * .8,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(1),
                        itemCount: members.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(
                              Icons.person,
                              size: 40,
                            ),
                            iconColor: Colors.white,
                            title: Text(
                              "${members[index].firstName.toString()} ${members[index].lastName.toString()}",
                            ),
                            subtitle: Text(
                              "${members[index].eMail.toString()} - ${members[index].phoneNumber.toString()}",
                            ),
                            onTap: () => {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    _detailPage(context, members[index]),
                              )
                            },
                            trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  members[index].remove();
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

  /// Popup detay sayfası
  Widget _detailPage(BuildContext context, Member info) {
    return AlertDialog(
      backgroundColor: const Color.fromRGBO(13, 17, 23, 1),
      title: const Center(child: Text('Member Detail')),
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
