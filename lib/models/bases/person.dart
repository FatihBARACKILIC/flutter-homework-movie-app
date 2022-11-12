import 'dart:math';
import 'package:movie_app/enums/gender.dart';
import 'package:movie_app/enums/user_type.dart';
import 'package:movie_app/models/admin.dart';
import 'package:movie_app/models/member.dart';

List<Admin> admins = <Admin>[];
List<Member> members = <Member>[];

/// Üye ve admin sayfaları bu class tarafından alınmıştır
abstract class Person {
  /// Her kayıtta otomatik id oluşturur
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
    bool userType = false,
  }) {
    return [];
  }

  bool register() {
    return true;
  }

  bool update({
    required String id,
    String? firstName,
    String? lastName,
    String? eMail,
    String? phoneNumber,
    Gender? gender,
  }) {
    return true;
  }

  bool remove() {
    return true;
  }
}
