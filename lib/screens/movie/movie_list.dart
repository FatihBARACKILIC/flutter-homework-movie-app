import 'package:flutter/material.dart';
import 'package:movie_app/enums/genres.dart';
import 'package:movie_app/models/bases/video.dart';
import 'package:movie_app/models/member.dart';
import 'package:movie_app/models/movies.dart';
import 'package:movie_app/theme/theme.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Member List",
      debugShowCheckedModeBanner: false,
      theme: theme(context),
      home: const MovieWidget(),
    );
  }
}

class MovieWidget extends StatefulWidget {
  const MovieWidget({super.key});

  @override
  State<MovieWidget> createState() => _MovieWidgetState();
}

class _MovieWidgetState extends State<MovieWidget> {
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 30; i++) {
      Movie movie = Movie("Movie$i", "Summary$i", Genres.adventure);
      movie.register();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie List"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 8),
          child: Center(
            child: Column(children: <Widget>[
              const Text(
                "Movie List",
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
              const Padding(padding: EdgeInsets.all(1)),
              movies.isNotEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * .8,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(1),
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(
                              Icons.person,
                              size: 40,
                            ),
                            iconColor: Colors.white,
                            title: Text(
                              movies[index].name.toString(),
                            ),
                            subtitle: Text(
                              movies[index].categories.name,
                            ),
                            onTap: () => {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    _detailPage(context, movies[index]),
                              )
                            },
                            trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  movies[index].remove();
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

  Widget _detailPage(BuildContext context, Movie info) {
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
              child: Text(info.name),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(info.categories.name),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(info.summary),
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
