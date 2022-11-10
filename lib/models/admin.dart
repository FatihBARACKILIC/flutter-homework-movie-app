// ignore_for_file: avoid_print, unused_import

import 'package:movie_app/enums/gender.dart';
import 'package:movie_app/enums/user_type.dart';
import 'package:movie_app/models/bases/person.dart';
import 'package:movie_app/models/member.dart';

class Admin extends Person {
  Admin(
    super.firstName,
    super.lastName,
    super.eMail,
    super.phoneNumber,
    super.userType,
  );

  List<String> addedMovies = [];

  @override
  List<String> getUserInfos() {
    return [
      id,
      firstName,
      lastName,
      eMail,
      phoneNumber,
      gender.name,
      dateOfBirth.toString(),
      userType.name,
      registerTime.toString(),
    ];
  }

  @override
  List getSpecialUserInfos({
    bool id = false,
    bool firstName = false,
    bool lastName = false,
    bool eMail = false,
    bool phoneNumber = false,
    bool gender = false,
    bool dateOfBirth = false,
    bool userType = false,
    bool registerTime = false,
  }) {
    var adminInfos = [];

    if (id) adminInfos.add(this.id);
    if (firstName) adminInfos.add(this.firstName);
    if (lastName) adminInfos.add(this.lastName);
    if (eMail) adminInfos.add(this.eMail);
    if (phoneNumber) adminInfos.add(this.phoneNumber);
    if (gender) adminInfos.add(this.gender.name);
    if (dateOfBirth) adminInfos.add(this.dateOfBirth);
    if (userType) adminInfos.add(this.userType.name);
    if (registerTime) adminInfos.add(this.registerTime);

    return adminInfos;
  }

  @override
  Person register() {
    try {
      admins.add(this);
      return this;
    } catch (e) {
      throw "Couldn't register the Admin.";
    }
  }

  @override
  bool update({
    required String id,
    String? firstName,
    String? lastName,
    String? eMail,
    String? phoneNumber,
    Gender? gender,
    DateTime? dateOfBirth,
    UserType? userType,
  }) {
    try {
      for (var admin in admins) {
        if (admin.id == id) {
          admin.firstName = firstName ?? admin.firstName;
          admin.lastName = lastName ?? admin.lastName;
          admin.eMail = eMail ?? admin.eMail;
          admin.phoneNumber = phoneNumber ?? admin.phoneNumber;
          admin.gender = gender ?? admin.gender;
          admin.dateOfBirth = dateOfBirth ?? admin.dateOfBirth;
          admin.userType = userType ?? admin.userType;
          if (admin.userType == UserType.member) {
            admins.remove(admin);
            Member member = Member(
              admin.firstName,
              admin.lastName,
              admin.eMail,
              admin.phoneNumber,
              admin.userType,
            );
            member.dateOfBirth = admin.dateOfBirth;
          }
          return true;
        }
      }
      return false;
    } catch (e) {
      throw "Couldn't update the Admin.";
    }
  }

  static bool remove(String id) {
    bool result = false;
    try {
      for (var admin in admins) {
        admins.remove(admin);
        if (admin.id != id) {
          admins.add(admin);
        } else {
          result = true;
        }
      }
      return result;
    } catch (e) {
      throw "Couldn't remove the Admin.";
    }
  }
}
