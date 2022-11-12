import 'package:movie_app/models/bases/video.dart';

/// Film modeli
class Movie extends Video {
  Movie(super.movieName, super.summary, super.categories);

  @override
  bool register() {
    try {
      movies.add(this);
      return true;
    } catch (e) {
      throw "Couldn't register the movie";
    }
  }

  @override
  bool remove() {
    try {
      movies.remove(this);
      return true;
    } catch (e) {
      throw "Couldn't remove the Movie.";
    }
  }
}
