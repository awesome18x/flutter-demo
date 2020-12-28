import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  final String noteId;
  bool get isEditing => noteId != null;

  NoteModify({this.noteId});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Note' : 'Create Note'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextField(
                decoration: InputDecoration(
                    hintText: 'Note title'
                )
            ),
            Container(height: 8.0,),
            TextField(
                decoration: InputDecoration(
                    hintText: 'Note content'
                )
            ),
            Container(height: 16.0,),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  if (isEditing) {

                  } else {

                  }
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                      color: Colors.white,
                  ),
                ),
                color: Theme.of(context).primaryColor
              ),
            )
          ],
        ),
      )
    );
  }
}
