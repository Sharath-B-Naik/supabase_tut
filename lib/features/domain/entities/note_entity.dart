import 'package:equatable/equatable.dart';

class NoteEntity extends Equatable {
  final String uid;
  final String id;
  final String title;
  final String description;
  final int color;
  final bool isPinned;

  const NoteEntity({
    required this.uid,
    required this.id,
    required this.title,
    required this.description,
    required this.color,
    required this.isPinned,
  });

  @override
  List<Object?> get props => [id, title, description, color, isPinned];
}
