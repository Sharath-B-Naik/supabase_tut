import 'package:flutter/material.dart';
import 'package:note_app/dependency_injection.dart';
import 'package:note_app/features/domain/usecases/firebase_usecases.dart';
import 'package:note_app/features/presentation/pages/auth_pages/login_screen.dart';
import 'package:note_app/services/local_database_service.dart';
import 'package:note_app/widgets/app_text.dart';

class NotePage extends StatelessWidget {
  const NotePage({Key? key}) : super(key: key);

  static const String route = 'todo-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            floating: true,
            elevation: 0,
            title: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: AppText(
                'Notes',
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            actions: [
              Tooltip(
                message: 'Logout',
                child: GestureDetector(
                  onTap: () {
                    sl.call<FireBaseUseCases>().signOut();
                    sl.call<DatabaseService>().clear();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginPage();
                        },
                      ),
                      (route) => false,
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.logout,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // SliverList(
          //   delegate: SliverChildListDelegate(
          //     [
          //       BlocBuilder<NoteBloc, NoteState>(
          //         builder: (context, state) {
          //           log("$state");
          //           if (state is NoteInitial) {
          //             return Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: const [
          //                 SizedBox(height: 200),
          //                 CupertinoActivityIndicator(),
          //                 SizedBox(height: 10),
          //                 AppText(
          //                   "Loading...",
          //                   fontSize: 10,
          //                   fontWeight: FontWeight.w400,
          //                 )
          //               ],
          //             );
          //           } else if (state is NotesLoaded && state.notes.isNotEmpty) {
          //             List<NoteEntity> filtered = [];

          //             for (final element in (state.notes)) {
          //               if (element.isPinned) {
          //                 filtered.insert(0, element);
          //               } else {
          //                 filtered.add(element);
          //               }
          //             }

          //             return GridView.builder(
          //               padding: const EdgeInsets.all(20),
          //               itemCount: filtered.length,
          //               shrinkWrap: true,
          //               physics: const NeverScrollableScrollPhysics(),
          //               gridDelegate:
          //                   const SliverGridDelegateWithFixedCrossAxisCount(
          //                 crossAxisCount: 2,
          //                 crossAxisSpacing: 10,
          //                 mainAxisSpacing: 10,
          //               ),
          //               itemBuilder: (BuildContext context, int index) {
          //                 return ContextMenuArea(
          //                   width: 200,
          //                   builder: (context) => [
          //                     GestureDetector(
          //                       onTap: () async {
          //                         Navigator.of(context).pop();

          //                         await sl
          //                             .call<FireBaseUseCases>()
          //                             .deleteNote(filtered[index]);
          //                       },
          //                       child: Padding(
          //                         padding: const EdgeInsets.all(8.0),
          //                         child: Row(
          //                           children: const [
          //                             Icon(
          //                               Icons.delete,
          //                               color: Colors.red,
          //                             ),
          //                             SizedBox(width: 5),
          //                             AppText('Delete'),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                     GestureDetector(
          //                       onTap: () async {
          //                         Navigator.of(context).pop();

          //                         final item = NoteEntity(
          //                           uid: filtered[index].uid,
          //                           id: filtered[index].id,
          //                           title: filtered[index].title,
          //                           description: filtered[index].description,
          //                           color: filtered[index].color,
          //                           isPinned: !filtered[index].isPinned,
          //                         );

          //                         await sl
          //                             .call<FireBaseUseCases>()
          //                             .updateNote(item);
          //                       },
          //                       child: Padding(
          //                         padding: const EdgeInsets.all(8.0),
          //                         child: Row(
          //                           children: [
          //                             const Icon(
          //                               Icons.push_pin,
          //                               color: Colors.red,
          //                             ),
          //                             const SizedBox(width: 5),
          //                             AppText(filtered[index].isPinned
          //                                 ? 'Unpin from top'
          //                                 : 'Pin to top'),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                     GestureDetector(
          //                       onTap: () async {
          //                         Navigator.of(context).pop();

          //                         final item = NoteEntity(
          //                           uid: filtered[index].uid,
          //                           id: filtered[index].id,
          //                           title: filtered[index].title,
          //                           description: filtered[index].description,
          //                           color: Colors.green.value,
          //                           isPinned: filtered[index].isPinned,
          //                         );

          //                         await sl
          //                             .call<FireBaseUseCases>()
          //                             .updateNote(item);
          //                       },
          //                       child: Padding(
          //                         padding: const EdgeInsets.all(8.0),
          //                         child: Row(
          //                           children: const [
          //                             Icon(
          //                               Icons.note,
          //                               color: Colors.green,
          //                             ),
          //                             SizedBox(width: 5),
          //                             AppText('Color note to green'),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                     GestureDetector(
          //                       onTap: () async {
          //                         Navigator.of(context).pop();

          //                         final item = NoteEntity(
          //                           uid: filtered[index].uid,
          //                           id: filtered[index].id,
          //                           title: filtered[index].title,
          //                           description: filtered[index].description,
          //                           color: Colors.blue.value,
          //                           isPinned: filtered[index].isPinned,
          //                         );

          //                         await sl
          //                             .call<FireBaseUseCases>()
          //                             .updateNote(item);
          //                       },
          //                       child: Padding(
          //                         padding: const EdgeInsets.all(8.0),
          //                         child: Row(
          //                           children: const [
          //                             Icon(
          //                               Icons.note,
          //                               color: Colors.blue,
          //                             ),
          //                             SizedBox(width: 5),
          //                             AppText('Color note to blue'),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                     GestureDetector(
          //                       onTap: () async {
          //                         Navigator.of(context).pop();

          //                         final item = NoteEntity(
          //                           uid: filtered[index].uid,
          //                           id: filtered[index].id,
          //                           title: filtered[index].title,
          //                           description: filtered[index].description,
          //                           color: 0xFFE8E8E8,
          //                           isPinned: filtered[index].isPinned,
          //                         );

          //                         await sl
          //                             .call<FireBaseUseCases>()
          //                             .updateNote(item);
          //                       },
          //                       child: Padding(
          //                         padding: const EdgeInsets.all(8.0),
          //                         child: Row(
          //                           children: const [
          //                             Icon(
          //                               Icons.note,
          //                               color: Color(0xFFE8E8E8),
          //                             ),
          //                             SizedBox(width: 5),
          //                             AppText('Color note to normal'),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                   ],
          //                   child: GestureDetector(
          //                     onTap: () {
          //                       Navigator.push(
          //                         context,
          //                         MaterialPageRoute(
          //                           builder: (context) {
          //                             return AddEditNotePage(
          //                               note: filtered[index],
          //                             );
          //                           },
          //                         ),
          //                       );
          //                     },
          //                     child: Stack(
          //                       children: [
          //                         Container(
          //                           height: 200,
          //                           width: double.infinity,
          //                           decoration: BoxDecoration(
          //                             color: Color(filtered[index].color),
          //                             borderRadius: BorderRadius.circular(8),
          //                           ),
          //                           child: ClipRRect(
          //                             borderRadius: BorderRadius.circular(8),
          //                             child: Padding(
          //                               padding: const EdgeInsets.all(15.0),
          //                               child: Column(
          //                                 crossAxisAlignment:
          //                                     CrossAxisAlignment.start,
          //                                 children: [
          //                                   AppText(
          //                                     filtered[index].title,
          //                                     maxLines: 2,
          //                                     overflow: TextOverflow.ellipsis,
          //                                     fontWeight: FontWeight.w700,
          //                                   ),
          //                                   const SizedBox(height: 10),
          //                                   Expanded(
          //                                     child: AppText(
          //                                       filtered[index].description,
          //                                       fontWeight: FontWeight.w300,
          //                                     ),
          //                                   ),
          //                                 ],
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                         if (filtered[index].isPinned)
          //                           const Positioned(
          //                             top: 10,
          //                             right: 10,
          //                             child: Icon(
          //                               Icons.push_pin,
          //                               color: Colors.indigo,
          //                             ),
          //                           ),
          //                       ],
          //                     ),
          //                   ),
          //                 );
          //               },
          //             );
          //           } else {
          //             return Center(
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: const [
          //                   SizedBox(height: 200),
          //                   AppText(
          //                     "No notes found.",
          //                     fontWeight: FontWeight.w400,
          //                   )
          //                 ],
          //               ),
          //             );
          //           }
          //         },
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return const AddEditNotePage(
          //         isNewNote: true,
          //         // todo: notes[index],
          //       );
          //     },
          //   ),
          // );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
