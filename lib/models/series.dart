import 'package:movie_app/models/bases/video.dart';

class Series extends Video {
  Series(super.movieName, super.summary, super.categories);

  @override
  bool register() {
    try {
      series.add(this);
      return true;
    } catch (e) {
      throw "Couldn't register the Series";
    }
  }

  @override
  bool remove() {
    try {
      series.remove(this);
      return true;
    } catch (e) {
      throw "Couldn't remove the Series.";
    }
  }
}
