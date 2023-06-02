import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app/features/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.name,
    required super.password,
    required super.email,
  });

  factory UserModel.fromSnapShot(DocumentSnapshot snapshot) {
    return UserModel(
      uid: snapshot.get('uid') ?? '',
      name: snapshot.get('name') ?? '',
      password: snapshot.get('password') ?? '',
      email: snapshot.get('email') ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'password': password,
      'email': email,
    };
  }
}
