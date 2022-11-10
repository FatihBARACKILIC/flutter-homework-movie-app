// ignore_for_file: unused_import

import 'dart:math';
import 'package:movie_app/enums/gender.dart';
import 'package:movie_app/enums/user_type.dart';
import 'package:movie_app/models/admin.dart';
import 'package:movie_app/models/member.dart';

var admins = <Admin>[];
var members = <Member>[];

abstract class Person {
  final String _id = Random().nextInt(2147483648).toRadixString(32);
  String firstName;
  String lastName;
  String eMail;
  String phoneNumber;
  Gender gender = Gender.custom;
  DateTime? dateOfBirth;
  UserType userType = UserType.member;
  final DateTime _registerTime = DateTime.now();

  Person(
    this.firstName,
    this.lastName,
    this.eMail,
    this.phoneNumber,
    this.userType,
  );

  String get id => _id;
  DateTime get registerTime => _registerTime;

  List<String> getUserInfos() {
    return [
      firstName,
      lastName,
      eMail,
      phoneNumber,
      gender.name,
      dateOfBirth.toString(),
    ];
  }

  List getSpecialUserInfos({
    bool firstName = false,
    bool lastName = false,
    bool eMail = false,
    bool phoneNumber = false,
    bool gender = false,
    bool dateOfBirth = false,
    bool userType = false,
  }) {
    return [];
  }

  Person register() {
    return this;
  }

  bool update({
    required String id,
    String? firstName,
    String? lastName,
    String? eMail,
    String? phoneNumber,
    Gender? gender,
    DateTime? dateOfBirth,
  }) {
    return true;
  }

  static bool remove(String id) {
    return false;
  }
}