import 'package:note_app/features/data/datasources/firebase_remote_source.dart';
import 'package:note_app/features/domain/entities/note_entity.dart';
import 'package:note_app/features/domain/entities/user_entity.dart';
import 'package:note_app/features/domain/repositories/firebase_repositories.dart';

class FireBaseRepositoryImpl implements FireBaseRepository {
  final FirebaseRemoteDataSource datasource;

  FireBaseRepositoryImpl({required this.datasource});

  @override
  Future<void> addNote(NoteEntity note) async {
    return await datasource.addNote(note);
  }

  @override
  Future<void> createCurrentUserDocIfNew(UserEntity userEntity) async {
    return await datasource.createCurrentUserDocIfNew(userEntity);
  }

  @override
  Future<void> deleteNote(NoteEntity note) async {
    return await datasource.deleteNote(note);
  }

  @override
  Future<void> forgotPassword(String email) async {
    return await datasource.forgotPassword(email);
  }

  @override
  String getLoggedUserUid() {
    return datasource.getLoggedUserUid();
  }

  @override
  Stream<List<NoteEntity>> getNotes(String uid) {
    return datasource.getNotes(uid);
  }

  @override
  Future<bool> isSignedIn() async {
    return await datasource.isSignedIn();
  }

  @override
  Future<void> signIn(UserEntity user) async {
    return await datasource.signIn(user);
  }

  @override
  Future<void> signOut() async {
    return await datasource.signOut();
  }

  @override
  Future<void> signUp(UserEntity user) async {
    return await datasource.signUp(user);
  }

  @override
  Future<void> updateNote(NoteEntity note) async {
    return await datasource.updateNote(note);
  }
}
