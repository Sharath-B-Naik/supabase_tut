import 'package:note_app/features/domain/entities/note_entity.dart';
import 'package:note_app/features/domain/entities/user_entity.dart';
import 'package:note_app/features/domain/repositories/firebase_repositories.dart';

class FireBaseUseCases {
  final FireBaseRepository repository;

  const FireBaseUseCases({required this.repository});

  Future<bool> isSignedIn() async {
    return await repository.isSignedIn();
  }

  Future<void> signIn(UserEntity user) async {
    return await repository.signIn(user);
  }

  Future<void> signUp(UserEntity user) async {
    return await repository.signUp(user);
  }

  Future<void> signOut() async {
    return await repository.signOut();
  }

  Future<void> forgotPassword(String email) async {
    return await repository.forgotPassword(email);
  }

  String getLoggedUserUid() {
    return repository.getLoggedUserUid();
  }

  Future<void> createCurrentUserDocIfNew(UserEntity userEntity) async {
    return await repository.createCurrentUserDocIfNew(userEntity);
  }

  Stream<List<NoteEntity>> getNotes(String uid) {
    return repository.getNotes(uid);
  }

  Future<void> addNote(NoteEntity note) async {
    return await repository.addNote(note);
  }

  Future<void> deleteNote(NoteEntity note) async {
    return await repository.deleteNote(note);
  }

  Future<void> updateNote(NoteEntity note) async {
    return await repository.updateNote(note);
  }
}
