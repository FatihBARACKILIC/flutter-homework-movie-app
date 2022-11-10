// ignore_for_file: unused_field

import 'dart:math';

import 'package:movie_app/models/movies.dart';
import 'package:movie_app/models/series.dart';

var series = <Movie>[];
var serries = <Series>[];

class Video {
  final String _id = Random().nextInt(2147483648).toRadixString(32);
  String name;
  DateTime publishTime;
  String image;
  String summary;
  List<String> stars;
  List<String> categories;
  String addPersonId;
  final DateTime _registerDate = DateTime.now();

  Video(this.name, this.publishTime, this.image, this.summary, this.stars,
      this.categories, this.addPersonId);

  String get id => _id;

  bool register() {
    return true;
  }

  List getInfos() {
    return [
      name,
      publishTime,
      image,
      summary,
      stars,
      categories,
    ];
  }

  bool remove(String id) {
    return true;
  }
}
