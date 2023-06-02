import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_app/features/data/datasources/firebase_remote_source.dart';
import 'package:note_app/features/data/models/note_model.dart';
import 'package:note_app/features/data/models/user_model.dart';
import 'package:note_app/features/domain/entities/note_entity.dart';
import 'package:note_app/features/domain/entities/user_entity.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  FirebaseRemoteDataSourceImpl({required this.auth, required this.firestore});

  @override
  Future<bool> isSignedIn() async {
    return auth.currentUser?.uid != null;
  }

  @override
  String getLoggedUserUid() {
    return auth.currentUser!.uid;
  }

  @override
  Future<void> signIn(UserEntity user) async {
    await auth.signInWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  Future<void> signUp(UserEntity user) async {
    await auth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
  }

  @override
  Future<void> forgotPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> createCurrentUserDocIfNew(UserEntity userEntity) async {
    final ref = firestore.collection('user');
    final uid = getLoggedUserUid();
    await ref.doc(uid).get().then((value) async {
      if (!value.exists) {
        final newuser = UserModel(
          uid: uid,
          name: userEntity.name,
          password: userEntity.password,
          email: userEntity.email,
        );

        await ref.doc(uid).set(newuser.toMap());
      }
    });
  }

  @override
  Stream<List<NoteEntity>> getNotes(String uid) {
    final ref = firestore.collection('user').doc(uid).collection('notes');

    return ref.snapshots().map<List<NoteEntity>>(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (snapshot) {
            return NoteModel.fromSnapShot(snapshot);
          },
        ).toList();
      },
    );
  }

  @override
  Future<void> addNote(NoteEntity noteEntity) async {
    final ref = firestore
        .collection('user')
        .doc(getLoggedUserUid())
        .collection('notes');

    final noteid = ref.doc().id;

    await ref.doc(noteid).get().then((note) async {
      /// RETURN IF EXISTS
      if (note.exists) return;

      final notemodel = NoteModel(
        uid: getLoggedUserUid(),
        id: noteid,
        title: noteEntity.title,
        description: noteEntity.description,
        color: 0xFFE8E8E8,
        isPinned: noteEntity.isPinned,
      );

      await ref.doc(noteid).set(notemodel.toMap());
    });
  }

  @override
  Future<void> deleteNote(NoteEntity noteEntity) async {
    final ref =
        firestore.collection('user').doc(noteEntity.uid).collection('notes');

    await ref.doc(noteEntity.id).get().then((value) async {
      if (!value.exists) return;

      await ref.doc(noteEntity.id).delete();
    });
  }

  @override
  Future<void> updateNote(NoteEntity noteEntity) async {
    final ref =
        firestore.collection('user').doc(noteEntity.uid).collection('notes');

    await ref.doc(noteEntity.id).get().then((value) async {
      if (!value.exists) return;

      Map<String, dynamic> updatevalues = {};

      updatevalues['title'] = noteEntity.title;
      updatevalues['description'] = noteEntity.description;
      updatevalues['color'] = noteEntity.color;
      updatevalues['isPinned'] = noteEntity.isPinned;

      await ref.doc(noteEntity.id).update(updatevalues);
    });
  }
}
