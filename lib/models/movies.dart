import 'package:movie_app/models/bases/video.dart';

class Movie extends Video {
  Movie(super.movieName, super.image, super.summary, super.stars,
      super.categories, super.addPersonId);

  @override
  bool register() {
    try {
      series.add(this);
      return true;
    } catch (e) {
      throw "Couldn't register the movie";
    }
  }

  @override
  bool remove(String id) {
    bool result = false;
    try {
      for (var movie in series) {
        series.remove(movie);
        if (movie.id != id) {
          series.add(movie);
        } else {
          result = true;
        }
      }
      return result;
    } catch (e) {
      throw "Couldn't remove the Movie.";
    }
  }
}
