import 'package:flutter/material.dart';

class NoteDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      title: Text('Warning'),
      content: Text('Are you sure want to delete this note?'),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text('Yes')
        ),
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('No')
        )
      ]
    );
  }
}
