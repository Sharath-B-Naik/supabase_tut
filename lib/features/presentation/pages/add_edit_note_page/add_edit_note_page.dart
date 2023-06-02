// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:note_app/features/domain/entities/note_entity.dart';
// import 'package:note_app/features/presentation/blocs/note_bloc/note_bloc.dart';
// import 'package:note_app/utils/loading.dart';
// import 'package:note_app/utils/snackbar.dart';
// import 'package:note_app/widgets/app_text.dart';

// class AddEditNotePage extends StatefulWidget {
//   final NoteEntity? note;
//   final bool isNewNote;
//   const AddEditNotePage({
//     Key? key,
//     this.note,
//     this.isNewNote = false,
//   }) : super(key: key);

//   static const String route = 'add-edit-note-page';

//   @override
//   State<AddEditNotePage> createState() => _AddEditNotePageState();
// }

// class _AddEditNotePageState extends State<AddEditNotePage> {
//   final titleController = TextEditingController();
//   final descriptionController = TextEditingController();
//   String get title => titleController.text.trim();
//   String get description => descriptionController.text.trim();

//   @override
//   void initState() {
//     super.initState();
//     if (!widget.isNewNote) {
//       titleController.text = widget.note!.title;
//       descriptionController.text = widget.note!.description;
//     }
//   }

//   @override
//   void dispose() {
//     titleController.dispose();
//     descriptionController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//           onTap: () => Navigator.of(context).pop(),
//           child: const Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//           ),
//         ),
//         backgroundColor: Colors.transparent,
//         titleSpacing: 0,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextFormField(
//               controller: titleController,
//               keyboardType: TextInputType.text,
//               cursorWidth: 1,
//               maxLines: 1,
//               minLines: 1,
//               cursorColor: Colors.black,
//               style: const TextStyle(
//                 fontSize: 20,
//                 color: Colors.black87,
//                 fontWeight: FontWeight.w700,
//               ),
//               decoration: const InputDecoration(
//                 border: InputBorder.none,
//                 hintText: 'Title',
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   color: Colors.black45,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: TextFormField(
//                 controller: descriptionController,
//                 keyboardType: TextInputType.multiline,
//                 cursorWidth: 1,
//                 cursorColor: Colors.black,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 minLines: 6,
//                 maxLines: null,
//                 decoration: const InputDecoration(
//                   border: InputBorder.none,
//                   hintText: 'Description',
//                   hintStyle: TextStyle(
//                     fontSize: 14,
//                     color: Colors.black45,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: BlocListener<NoteBloc, NoteState>(
//         listener: (context, state) {
//           print(state);
//           if (state is NoteSaving) {
//             showLoading(context);
//           } else if (state is NoteSaved) {
//             stopLoading(context);
//             Navigator.of(context).pop();
//           } else if (state is NoteSavingFailed) {
//             stopLoading(context);
//             showSnackBar(context, msg: state.message);
//           }
//         },
//         child: FloatingActionButton.extended(
//           label: const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 40),
//             child: AppText(
//               'Save',
//               color: Colors.white,
//             ),
//           ),
//           onPressed: () async {
//             if (title.isEmpty) {
//               showSnackBar(context, msg: 'Title should not be empty');
//               return;
//             }
//             if (description.isEmpty) {
//               showSnackBar(context, msg: 'Description should not be empty');
//               return;
//             }

//             late NoteEntity item;
//             if (widget.isNewNote) {
//               item = NoteEntity(
//                 uid: '',
//                 id: '',
//                 title: title,
//                 description: description,
//                 color: 0xFFE8E8E8,
//                 isPinned: false,
//               );
//             } else {
//               item = NoteEntity(
//                 uid: widget.note!.uid,
//                 id: widget.note!.id,
//                 title: title,
//                 description: description,
//                 color: widget.note!.color,
//                 isPinned: widget.note!.isPinned,
//               );
//             }

//             final bloc = context.read<NoteBloc>();
//             if (widget.isNewNote) {
//               bloc.add(AddNoteEvent(item));
//               // final resp = await sl.call<NoteProvider>().newNote(context, item);
//               // if (resp) Navigator.of(context).pop();
//             } else {
//               bloc.add(UpdateNoteEvent(item));

//               // final resp = await sl.call<NoteProvider>().update(context, item);
//               // if (resp) Navigator.of(context).pop();
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
