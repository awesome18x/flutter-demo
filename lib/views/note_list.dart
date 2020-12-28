import 'package:call_api/models/note_for_listing.dart';
import 'package:call_api/views/note_delete.dart';
import 'package:call_api/views/note_modify.dart';
import 'package:flutter/material.dart';

class NoteList extends StatelessWidget {
  final notes = [
    new NoteForListing(
      noteId: '1',
      createDateTime: DateTime.now(),
      noteTitle: 'Note 1',
      lastEditDateTime: DateTime.now()
    ),
    new NoteForListing(
        noteId: '2',
        createDateTime: DateTime.now(),
        noteTitle: 'Note 2',
        lastEditDateTime: DateTime.now()
    ),
    new NoteForListing(
        noteId: '3',
        createDateTime: DateTime.now(),
        noteTitle: 'Note 3',
        lastEditDateTime: DateTime.now()
    ),
    new NoteForListing(
        noteId: '4',
        createDateTime: DateTime.now(),
        noteTitle: 'Note 4',
        lastEditDateTime: DateTime.now()
    ),
    new NoteForListing(
        noteId: '5',
        createDateTime: DateTime.now(),
        noteTitle: 'Note 5',
        lastEditDateTime: DateTime.now()
    )
  ];

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('List of notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => NoteModify()));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green,),
        itemBuilder: (_, index) {
          return Dismissible(
            key: ValueKey(notes[index].noteId),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {

            },
            confirmDismiss: (direction) async {
              final result = await showDialog(
                context: context,
                builder: (_) => NoteDelete()
              );
              print(result);
              return result;
            },
            child: ListTile(
              title: Text(
                notes[index].noteTitle,
                style: TextStyle(
                  color: Colors.blueAccent
                )
              ),
              subtitle: Text('Last edited on ${formatDateTime(notes[index].lastEditDateTime)}'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => NoteModify(noteId: notes[index].noteId)));
              },
            ),
          );
        },
        itemCount: notes.length,

      )
    );
  }
}
