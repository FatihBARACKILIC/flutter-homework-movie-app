import 'bases/video.dart';

class Series extends Video {
  Series(super.name, super.publishTime, super.image, super.summary, super.stars,
      super.categories, super.addPersonId);

  @override
  bool register() {
    try {
      serries.add(this);
      return true;
    } catch (e) {
      throw "Couldn't register the Series";
    }
  }

  @override
  bool remove(String id) {
    bool result = false;
    try {
      for (var s in series) {
        series.remove(s);
        if (s.id != id) {
          series.add(s);
        } else {
          result = true;
        }
      }
      return result;
    } catch (e) {
      throw "Couldn't remove the Series.";
    }
  }
}
