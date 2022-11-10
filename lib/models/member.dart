// ignore_for_file: avoid_print, unused_import

import 'package:movie_app/enums/gender.dart';
import 'package:movie_app/enums/user_type.dart';
import 'package:movie_app/models/bases/person.dart';

class Member extends Person {
  Member(
    super.firstName,
    super.lastName,
    super.eMail,
    super.phoneNumber,
    super.userType,
  );

  @override
  List getSpecialUserInfos({
    bool firstName = false,
    bool lastName = false,
    bool eMail = false,
    bool phoneNumber = false,
    bool gender = false,
    bool dateOfBirth = false,
    bool userType = false,
  }) {
    var memberInfos = [];

    if (firstName) memberInfos.add(this.firstName);
    if (lastName) memberInfos.add(this.lastName);
    if (eMail) memberInfos.add(this.eMail);
    if (phoneNumber) memberInfos.add(this.phoneNumber);
    if (gender) memberInfos.add(this.gender.name);
    if (dateOfBirth) memberInfos.add(this.dateOfBirth);
    if (userType) memberInfos.add(this.userType.name);

    return memberInfos;
  }

  @override
  Member register() {
    try {
      members.add(this);
      return this;
    } catch (e) {
      throw "Couldn't register the Member.";
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
  }) {
    try {
      for (var member in members) {
        if (member.id == id) {
          member.firstName = firstName ?? this.firstName;
          member.lastName = lastName ?? this.lastName;
          member.eMail = eMail ?? this.eMail;
          member.phoneNumber = phoneNumber ?? this.phoneNumber;
          member.gender = gender ?? this.gender;
          member.dateOfBirth = dateOfBirth ?? this.dateOfBirth;
          return true;
        }
      }
      return false;
    } catch (e) {
      throw "Couldn't update the Member.";
    }
  }

  static bool remove(String id) {
    bool result = false;
    try {
      for (var member in members) {
        members.remove(member);
        if (member.id != id) {
          members.add(member);
        } else {
          result = true;
        }
      }
      return result;
    } catch (e) {
      throw "Couldn't remove the Member.";
    }
  }
}
