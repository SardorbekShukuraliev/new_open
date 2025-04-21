import 'package:kursol/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.id,
      required super.email,
      required super.firstName,
      required super.lastName,
      required super.username,
      required super.roles,
      required super.skillOccupation,
      required super.registrationDate,
      String? phoneNumber,
      String? biography});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['uuid'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      username: json['username'] as String,
      roles: List<String>.from(json['roles'] as List),
      skillOccupation: json['skillOccupation'] as bool,
      biography: json['biography'] as String?,
      registrationDate: DateTime.parse(json['registrationDate'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': id,
      'email': email,
      'phone_number': phoneNumber,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'roles': roles,
      'skillOccupation': skillOccupation,
      'biography': biography,
      'registrationDate': registrationDate.toIso8601String(),
    };
  }
}
