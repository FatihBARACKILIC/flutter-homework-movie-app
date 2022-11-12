import 'package:flutter/material.dart';
import 'package:movie_app/screens/admin/admin.dart';
import 'package:movie_app/screens/admin/admin_list.dart';
import 'package:movie_app/widgets/menu_buttons.dart';
import 'package:movie_app/screens/member/member.dart';
import 'package:movie_app/screens/movie/movie.dart';
import 'package:movie_app/theme/theme.dart';

void main() {
  runApp(const App());
}

// const Color darkColor = Color.fromRGBO(13, 17, 23, 1);
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie List",
      debugShowCheckedModeBanner: false,
      theme: theme(context),
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
          "Movie List",
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <MenuButtons>[
              MenuButtons(
                cb: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // TODO:
                      builder: (context) => const AdminScreen(),
                      // builder: (context) => const AdminList(),
                    ),
                  );
                },
                icon: Icons.admin_panel_settings_outlined,
                text: "Add Admin",
              ),
              MenuButtons(
                cb: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MemberScreen(),
                    ),
                  );
                },
                icon: Icons.person_add,
                text: "Add Member",
              ),
              MenuButtons(
                cb: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MovieScreen(),
                    ),
                  );
                },
                icon: Icons.movie,
                text: "Add Movie",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
