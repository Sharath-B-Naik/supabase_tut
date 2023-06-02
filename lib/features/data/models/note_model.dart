import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/note_entity.dart';

class NoteModel extends NoteEntity {
  const NoteModel({
    required super.uid,
    required super.id,
    required super.title,
    required super.description,
    required super.color,
    required super.isPinned,
  });

  factory NoteModel.fromSnapShot(DocumentSnapshot snapshot) {
    return NoteModel(
      uid: snapshot.get('uid') ?? '',
      id: snapshot.get('id') ?? '',
      title: snapshot.get('title') ?? '',
      description: snapshot.get('description') ?? '',
      color: snapshot.get('color') ?? 0xFFE8E8E8,
      isPinned: snapshot.get('isPinned') ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'id': id,
      'title': title,
      'description': description,
      'color': color,
      'isPinned': isPinned,
    };
  }
}
