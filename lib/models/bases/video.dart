// ignore_for_file: unused_field

import 'dart:math';

import 'package:movie_app/enums/genres.dart';
import 'package:movie_app/models/movies.dart';
import 'package:movie_app/models/series.dart';

var movies = <Movie>[];
var series = <Series>[];

class Video {
  final String _id = Random().nextInt(2147483648).toRadixString(32);
  String name;
  String summary;
  Genres categories;

  Video(this.name, this.summary, this.categories);

  String get id => _id;

  bool register() {
    return true;
  }

  List getInfos() {
    return [
      name,
      summary,
      categories,
    ];
  }

  bool remove() {
    return true;
  }
}
