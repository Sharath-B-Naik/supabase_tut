import 'package:note_app/features/domain/entities/note_entity.dart';
import 'package:note_app/features/domain/entities/user_entity.dart';

abstract class FirebaseRemoteDataSource {
  Future<bool> isSignedIn();
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> signOut();
  Future<void> forgotPassword(String email);
  String getLoggedUserUid();
  Future<void> createCurrentUserDocIfNew(UserEntity userEntity);
  Stream<List<NoteEntity>> getNotes(String uid);
  Future<void> addNote(NoteEntity note);
  Future<void> deleteNote(NoteEntity note);
  Future<void> updateNote(NoteEntity note);
}
