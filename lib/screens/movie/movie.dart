import 'package:flutter/material.dart';
import 'package:movie_app/enums/genres.dart';
import 'package:movie_app/models/movies.dart';
import 'package:movie_app/screens/movie/movie_list.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final TextEditingController _controllerMovieName = TextEditingController();
  final TextEditingController _controllerSummary = TextEditingController();
  Genres? _selectedGenre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Movie"),
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Add Movie",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * .1,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controllerMovieName,
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
              maxLines: 4,
              controller: _controllerSummary,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Summary",
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
            child: DropdownButton<Genres>(
              menuMaxHeight: 150,
              hint: const Text("Genre"),
              value: _selectedGenre,
              onChanged: (Genres? value) {
                setState(() {
                  _selectedGenre = value;
                });
              },
              items: Genres.values.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e.name),
                );
              }).toList(),
              style: const TextStyle(
                color: Colors.white,
              ),
              dropdownColor: const Color.fromRGBO(13, 17, 23, 1),
              isExpanded: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {
                registerMovie();
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
                    builder: (context) => const MovieList(),
                  ),
                );
              },
              child: const Text(
                "Show Movies",
              ),
            ),
          ),
        ],
      ),
    );
  }

  registerMovie() {
    String movieName = _controllerMovieName.text.toString().trim();
    String summary = _controllerSummary.text.toString().trim();

    Movie movie = Movie(movieName, summary, _selectedGenre!);
    movie.register();

    setState(() {
      _controllerMovieName.clear();
      _controllerSummary.clear();
    });
  }
}
