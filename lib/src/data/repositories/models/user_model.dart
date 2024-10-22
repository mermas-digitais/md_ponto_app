// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String uid;
  final String firstName;
  final String lastName;
  final String? group;
  final String? userType;
  final String? email;
  final num? frequence;
  final int? photo;

  UserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.group,
    this.userType,
    this.email,
    this.frequence,
    this.photo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'group': group,
      'userType': userType,
      'email': email,
      'frequence': frequence.toString(),
      'photo': photo,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      group: map['group'] as String,
      userType: map['userType'] as String,
      email: map['email'] as String,
      //parse the frequence to string
      frequence: map['frequence'],
      photo: map['profilePhoto'].toString().contains('http')
          ? map['profilePhoto']
          : int.parse(['profilePhoto'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return '(uid: $uid, firstName: $firstName, lastName: $lastName, group: $group, userType: $userType, email: $email, frequence: $frequence, photo: $photo)';
  }
}
